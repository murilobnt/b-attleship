MACHINE Ship
    
INCLUDES
    Attack_grid

SEES
    Ship_ctx,
    Dimensions_ctx,
    Ship_size,
    Grid_cell,
    Player

SETS
    ORIENTATION = {vertical, horizontal};
    ATTACK_REPORT = {hit, miss, destroyed}
    
CONSTANTS
    water_c
    
PROPERTIES
    water_c : NAT

VARIABLES
    ship_type_r,
    ship_health,
    grid_to_ship

INVARIANT
    ship_type_r : ships --> SHIP_TYPE & 
    ship_health : ships --> 0..4 &
    grid_to_ship : 0..grid_sz - 1 --> ships \/ {water_c}

INITIALISATION
    ship_type_r := {} || 
    ship_health := {} ||
    grid_to_ship := (0..grid_sz - 1) * {water_c}

OPERATIONS
    add_ship(ii, tt, oo, pp) =
    PRE ii : ships &
        tt : SHIP_TYPE & 
        oo : ORIENTATION & 
        pp : 0..grid_sz - 1 & 
        grid_to_ship(pp) /: ships &
        !xx.(xx : 1..ship_size(tt) - 1 => 
                (oo = horizontal & (pp mod grid_dim_x) + xx < grid_dim_x & 
                    ((pp mod grid_dim_x) + xx < grid_dim_x => grid_to_ship((pp mod grid_dim_x) + xx) /: ships)) or 
                (oo = vertical & pp + (xx * grid_dim_y) < grid_sz & 
                    (pp + (xx * grid_dim_y) < grid_sz => grid_to_ship(pp + (xx * grid_dim_y)) /: ships))
            )
    THEN
        LET hh, vv BE 
            hh = ran(%xx . (xx : 0..ship_size(tt) - 1 | pp + xx)) & 
            vv = ran(%xx . (xx : 0..ship_size(tt) - 1 | pp + (xx * grid_dim_y)))
        IN 
            ship_health(ii) := ship_size(tt) ||
            ship_type_r(ii) := tt || 
            IF oo = horizontal THEN
                grid_to_ship := grid_to_ship <+ (hh * {ii})
            ELSE
                grid_to_ship := grid_to_ship <+ (vv * {ii})
            END
        END
    END;
    
    rr <-- attack(pp) =
    PRE pp : 0..grid_sz - 1 & 
        (grid_to_ship(pp) : ships => ship_health(grid_to_ship(pp)) > 0) 
    THEN
        IF grid_to_ship(pp) /= water_c THEN
            ship_health(grid_to_ship(pp)) := ship_health(grid_to_ship(pp)) - 1 ||
            IF ship_health(grid_to_ship(pp)) - 1 = 0 THEN
                rr := destroyed || update_atk_grid(pp, ship)
            ELSE
                rr := hit || update_atk_grid(pp, ship)
            END
        ELSE
            rr := miss || update_atk_grid(pp, water)
        END
    END
END
