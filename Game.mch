/* Game
 * Author: muril
 * Creation date: 10/06/2019
 */
MACHINE
    Game
    
INCLUDES
    Attack_grid,
    Player_ships

PROMOTES
    get_attack_grid1,
    get_attack_grid2

SEES
    Ship_ctx,
    Dimensions_ctx,
    Ship_type_ctx,
    Grid_cell,
    Attack_who_ctx

SETS
    ORIENTATION = {vertical, horizontal};
    ATTACK_REPORT = {hit, miss, destroyed}

VARIABLES
    ship_health,
    grid_to_ship1,
    grid_to_ship2,
    attacked1,
    attacked2,
    to_be_destroyed,
    ready

INVARIANT
    ship_health : 0..20 --> 0..4 &
    grid_to_ship1 : 0..grid_sz - 1 --> ships1 &
    grid_to_ship2 : 0..grid_sz - 1 --> ships2 &
    attacked1 : 0..grid_sz - 1 --> BOOL &
    attacked2 : 0..grid_sz - 1 --> BOOL &
    to_be_destroyed : 0..20 <-> 0..grid_sz - 1 &
    ready : BOOL

INITIALISATION
    ship_health := %xx . (xx : 0..20 | ship_size(ship_type_r(xx))) ||
    grid_to_ship1 := (0..grid_sz - 1) * {water_c} ||
    grid_to_ship2 := (0..grid_sz - 1) * {water_c} ||
    attacked1 := (0..grid_sz - 1) * {FALSE} ||
    attacked2 := (0..grid_sz - 1) * {FALSE} ||
    to_be_destroyed := {} ||
    ready := FALSE

OPERATIONS
    rr <-- check_win_condition(to) =
    PRE to : ATTACK_WHO THEN
        IF to = p1 THEN
            IF ships2 = {water_c} THEN
                rr := TRUE
            ELSE
                rr := FALSE
            END
        ELSE
            IF ships1 = {water_c} THEN
                rr := TRUE
            ELSE
                rr := FALSE
            END
        END
    END;
    
    add_ship(ii, oo, pp) =
    PRE ii : 0..19 &
        oo : ORIENTATION &
        ready = FALSE & 
        pp : 0..grid_sz - 1 &
        (ii : ships1 => ii /: ran(grid_to_ship1) & grid_to_ship1(pp) = water_c &
            (!xx.(xx : 1..ship_size(ship_type_r(ii)) - 1 => 
                (oo = horizontal & (pp mod grid_dim_x) + xx < grid_dim_x & 
                    ((pp mod grid_dim_x) + xx < grid_dim_x => grid_to_ship1(pp + xx) = water_c)) or 
                (oo = vertical & pp + (xx * grid_dim_y) < grid_sz & 
                    (pp + (xx * grid_dim_y) < grid_sz => grid_to_ship1(pp + (xx * grid_dim_y)) = water_c))
        ))) &
        (ii : ships2 => ii /: ran(grid_to_ship2) & grid_to_ship2(pp) = water_c &
            (!xx.(xx : 1..ship_size(ship_type_r(ii)) - 1 => 
                (oo = horizontal & (pp mod grid_dim_x) + xx < grid_dim_x & 
                    ((pp mod grid_dim_x) + xx < grid_dim_x => grid_to_ship2(pp + xx) = water_c)) or 
                (oo = vertical & pp + (xx * grid_dim_y) < grid_sz & 
                    (pp + (xx * grid_dim_y) < grid_sz => grid_to_ship2(pp + (xx * grid_dim_y)) = water_c))
        )))
    THEN
        LET hh, vv BE 
            hh = ran(%xx . (xx : 0..ship_size(ship_type_r(ii)) - 1 | pp + xx)) & 
            vv = ran(%xx . (xx : 0..ship_size(ship_type_r(ii)) - 1 | pp + (xx * grid_dim_y)))
        IN 
            IF ii : ships1 THEN 
                IF oo = horizontal THEN
                    grid_to_ship1 := grid_to_ship1 <+ (hh * {ii})
                ELSE
                    grid_to_ship1 := grid_to_ship1 <+ (vv * {ii})
                END
            ELSE
                IF oo = horizontal THEN
                    grid_to_ship2 := grid_to_ship2 <+ (hh * {ii})
                ELSE
                    grid_to_ship2 := grid_to_ship2 <+ (vv * {ii})
                END
            END
        END
    END;

    unlock_attack =
    PRE !xx . (xx : (ships1 - {water_c}) => xx : ran(grid_to_ship1)) &
             !xx . (xx : (ships2 - {water_c}) => xx : ran(grid_to_ship2)) &
             ready = FALSE THEN
        ready := TRUE
    END;
    
    rr <-- attack(pp, to) =
    PRE pp : 0..grid_sz - 1 & ready = TRUE &
        to : ATTACK_WHO &
        (to = p1 => attacked1(pp) = FALSE & 
                    (grid_to_ship1(pp) /= water_c => ship_health(grid_to_ship1(pp)) > 0)) &
        (to = p2 => attacked2(pp) = FALSE &
                    (grid_to_ship2(pp) /= water_c => ship_health(grid_to_ship2(pp)) > 0))
    THEN
        IF to = p1 THEN
            IF grid_to_ship1(pp) /= water_c THEN
                ship_health(grid_to_ship1(pp)) := ship_health(grid_to_ship1(pp)) - 1 ||
                IF ship_health(grid_to_ship1(pp)) - 1 = 0 THEN
                    rr := destroyed || 
                    ANY dd WHERE dd : 0..ship_size(ship_type_r(grid_to_ship1(pp))) --> 0 .. grid_sz - 1 & 
                        ran(dd) = to_be_destroyed[{grid_to_ship1(pp)}] \/ {pp}
                    THEN
                        update_atk_grid_for_destroyed_ship(dd, to, ship_size(ship_type_r(grid_to_ship1(pp))))
                    END ||
                    grid_to_ship1(pp) := water_c ||
                    remove_ship_from_1(grid_to_ship1(pp))
                ELSE
                    rr := hit || 
                    to_be_destroyed := to_be_destroyed \/ {grid_to_ship1(pp) |-> pp} ||
                    update_atk_grid(pp, ship, to) ||
                    grid_to_ship1(pp) := water_c
                END
            ELSE
                rr := miss || update_atk_grid(pp, water, to)
            END ||
            attacked1(pp) := TRUE
        ELSE
            IF grid_to_ship2(pp) /= water_c THEN
                ship_health(grid_to_ship2(pp)) := ship_health(grid_to_ship2(pp)) - 1 ||
                IF ship_health(grid_to_ship2(pp)) - 1 = 0 THEN
                    rr := destroyed || 
                    ANY dd WHERE dd : 0..ship_size(ship_type_r(grid_to_ship2(pp))) --> 0 .. grid_sz - 1 & 
                        ran(dd) = to_be_destroyed[{grid_to_ship2(pp)}] \/ {pp}
                    THEN
                        update_atk_grid_for_destroyed_ship(dd, to, ship_size(ship_type_r(grid_to_ship2(pp))))
                    END ||
                    grid_to_ship2(pp) := water_c ||
                    remove_ship_from_2(grid_to_ship2(pp))
                ELSE
                    rr := hit || 
                    to_be_destroyed := to_be_destroyed \/ {grid_to_ship2(pp) |-> pp} ||
                    update_atk_grid(pp, ship, to) ||
                    grid_to_ship2(pp) := water_c
                END
            ELSE
                rr := miss || update_atk_grid(pp, water, to)
            END ||
            attacked2(pp) := TRUE
        END
    END

END
