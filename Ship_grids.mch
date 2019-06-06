/* Ship_grids
 * Author: muril
 * Creation date: 05/06/2019
 */
MACHINE
    Ship_grids
    
SEES
    Player,
    Dimensions_ctx,
    Water_ctx
    
VARIABLES
    
    
INVARIANT
    grid_to_ship1 : 0..grid_sz - 1 --> ships1 \/ {water_c} &
    grid_to_ship2 : 0..grid_sz - 1 --> ships2 \/ {water_c} 
    
INITIALISATION
    grid_to_ship1 := (0..grid_sz - 1) * {water_c} ||
    grid_to_ship2 := (0..grid_sz - 1) * {water_c}
    
OPERATIONS
    add_ship_for_p1(pp, ss) =
    PRE pp : 0..grid_sz - 1 & ss : ships1 
    THEN
        grid_to_ship1(pp) := ss
    END;
    
    add_ship_for_p2(pp, ss) =
    PRE pp : 0..grid_sz - 1 & ss : ships2
    THEN
        grid_to_ship2(pp) := ss
    END
    
END
