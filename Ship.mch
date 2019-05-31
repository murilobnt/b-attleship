MACHINE Ship

SEES
    Ship_ctx,
    Dimensions_ctx,
    Ship_size

SETS
    ORIENTATION = {vertical, horizontal};
    ATTACK_REPORT = {hit, miss, destroyed}
    
CONSTANTS
    water
    
PROPERTIES
    water : NAT

VARIABLES
    ships, ship_type_r, grid_to_ship, ship_index

INVARIANT
    ships <: NAT &
    ship_index : NAT &
    ship_type_r : ships --> SHIP_TYPE & 
    grid_to_ship : 0..grid_sz - 1 --> ships \/ {water}

INITIALISATION
    ships := {} || 
    ship_type_r := {} || 
    grid_to_ship := (0..grid_sz - 1) * {water} || 
    ship_index := 0

OPERATIONS
    add_ship(tt, oo, pp) =
    PRE tt : SHIP_TYPE & oo : ORIENTATION & 
        pp : 0..grid_sz - 1 & ship_index + 1 : NAT & 
        !xx.(xx : 1..ship_size(tt) - 1 => 
                (oo = horizontal & (pp mod grid_dim_x) + xx < grid_dim_x) or 
                (oo = vertical & pp + (xx * grid_dim_y) < grid_sz)
            )
    THEN
        LET hh, vv BE 
            hh = ran(%xx . (xx : 0..ship_size(tt) - 1 | (pp mod grid_dim_x) + xx)) & 
            vv = ran(%xx . (xx : 0..ship_size(tt) - 1 | pp + (xx * grid_dim_y)))
        IN
            ships := ships \/ {ship_index} || 
            ship_type_r(ship_index) := tt || 
            IF oo = horizontal THEN
                grid_to_ship := grid_to_ship <+ (hh * {ship_index})
            ELSE
                grid_to_ship := grid_to_ship <+ (vv * {ship_index})
            END ||
            ship_index := ship_index + 1
        END
    END;
    
    rr <-- attack_position(pp) =
    PRE pp : 0..grid_sz - 1 THEN
        IF grid_to_ship(pp) /= water THEN
            rr := hit 
        ELSE
            rr := miss
        END
    END
END
