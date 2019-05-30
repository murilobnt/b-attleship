MACHINE Ship

SEES
    Ship_ctx,
    Dimensions_ctx,
    Ship_size

SETS
    ORIENTATION = {vertical, horizontal}

VARIABLES
    ships, ship_type_r, ship_pos_r, ship_index

INVARIANT
    ships <: NAT & 
    ship_index : NAT &
    ship_type_r : ships --> SHIP_TYPE & 
    ship_pos_r : ships --> 0..grid_sz

INITIALISATION
    ships := {} || ship_type_r := {} || ship_pos_r := {} || ship_index := 0

OPERATIONS    
    add_ship(tt, oo, pp) =
    PRE tt : SHIP_TYPE & oo : ORIENTATION & 
        pp : 0..grid_sz & ship_index + 1 : NAT & 
        !xx.(xx : 1..ship_size(tt) - 1 => 
                (oo = horizontal & (pp mod grid_dim_x) + xx < grid_dim_x) or 
                (oo = vertical & pp + (xx * grid_dim_y) < grid_sz)
            )
    THEN
    ships := ships \/ {ship_index} || 
    ship_type_r(ship_index) := tt || 
    ship_pos_r(ship_index) := pp ||
    ship_index := ship_index + 1
    END
END

