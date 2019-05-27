MACHINE Ship

SEES
      Ship_ctx,
      Dimensions_ctx

VARIABLES
      ships, ship_type_r, ship_pos_r

INVARIANT
      ships <: NAT & 
      ship_type_r : ships --> SHIP_TYPE & 
      ship_pos_r : ships --> 0..grid_sz

INITIALISATION
      ships := {} || ship_type_r := {} || ship_pos_r := {}

OPERATIONS
      // TODO: Verify if the ship's size doesn't exceed the grid.
      add_ship(ss, tt, pp) =
      PRE ss : NAT & tt : SHIP_TYPE & pp : 0..grid_sz 
      THEN
            ships := ships \/ {ss} || ship_type_r(ss) := tt || ship_pos_r(ss) := pp
      END
      
END

