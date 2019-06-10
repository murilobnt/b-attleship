MACHINE Ship
    
INCLUDES
    Attack_grid,
    Player

SEES
    Ship_ctx,
    Dimensions_ctx,
    Ship_size,
    Grid_cell,
    Attack_who_ctx

SETS
    ORIENTATION = {vertical, horizontal};
    ATTACK_REPORT = {hit, miss, destroyed}

VARIABLES
    ship_health,
    grid_to_ship1,
    grid_to_ship2

INVARIANT
    ship_health : SHIPS --> 0..4 &
    grid_to_ship1 : 0..grid_sz - 1 --> ships1 &
    grid_to_ship2 : 0..grid_sz - 1 --> ships2 

INITIALISATION
    ship_health := %xx . (xx : SHIPS | ship_size(ship_type_r(xx))) ||
    grid_to_ship1 := (0..grid_sz - 1) * {water_c} ||
    grid_to_ship2 := (0..grid_sz - 1) * {water_c}

OPERATIONS
    rr <-- check_win_condition(to) =
    PRE to : ATTACK_WHO THEN
        IF to = p1 THEN
            IF !xx . (xx : ships2 => ship_health(xx) = 0) THEN
                rr := TRUE
            ELSE
                rr := FALSE
            END
        ELSE
            IF !xx . (xx : ships1 => ship_health(xx) = 0) THEN
                rr := TRUE
            ELSE
                rr := FALSE
            END
        END
    END;
    
    add_ship(ii, oo, pp) =
    PRE ii : SHIPS &
        oo : ORIENTATION & 
        pp : 0..grid_sz - 1 &
        (ii : ships1 => 
            (!xx.(xx : 1..ship_size(ship_type_r(ii)) - 1 => 
                (oo = horizontal & (pp mod grid_dim_x) + xx < grid_dim_x & 
                    ((pp mod grid_dim_x) + xx < grid_dim_x => grid_to_ship1((pp mod grid_dim_x) + xx) = water_c)) or 
                (oo = vertical & pp + (xx * grid_dim_y) < grid_sz & 
                    (pp + (xx * grid_dim_y) < grid_sz => grid_to_ship1(pp + (xx * grid_dim_y)) = water_c))
        ))) &
        (ii : ships2 => 
            (!xx.(xx : 1..ship_size(ship_type_r(ii)) - 1 => 
                (oo = horizontal & (pp mod grid_dim_x) + xx < grid_dim_x & 
                    ((pp mod grid_dim_x) + xx < grid_dim_x => grid_to_ship2((pp mod grid_dim_x) + xx) = water_c)) or 
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
    
    rr <-- attack(pp, to) =
    PRE pp : 0..grid_sz - 1 &
        to : ATTACK_WHO &
        (to = p1 => (grid_to_ship1(pp) /= water_c => ship_health(grid_to_ship1(pp)) > 0)) &
        (to = p2 => (grid_to_ship2(pp) /= water_c => ship_health(grid_to_ship2(pp)) > 0))
    THEN
        IF to = p1 THEN
            IF grid_to_ship1(pp) /= water_c THEN
                ship_health(grid_to_ship1(pp)) := ship_health(grid_to_ship1(pp)) - 1 ||
                IF ship_health(grid_to_ship1(pp)) - 1 = 0 THEN
                    rr := destroyed || update_atk_grid(pp, ship, to)
                ELSE
                    rr := hit || update_atk_grid(pp, ship, to)
                END
            ELSE
                rr := miss || update_atk_grid(pp, water, to)
            END
        ELSE
            IF grid_to_ship2(pp) /= water_c THEN
                ship_health(grid_to_ship2(pp)) := ship_health(grid_to_ship2(pp)) - 1 ||
                IF ship_health(grid_to_ship2(pp)) - 1 = 0 THEN
                    rr := destroyed || update_atk_grid(pp, ship, to)
                ELSE
                    rr := hit || update_atk_grid(pp, ship, to)
                END
            ELSE
                rr := miss || update_atk_grid(pp, water, to)
            END
        END
    END
END
