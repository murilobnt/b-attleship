/* Attack_grid
 * Author: muril
 * Creation date: 01/06/2019
 */
MACHINE
    Attack_grid
    
SEES 
    Grid_cell,
    Dimensions_ctx
    
VARIABLES
    atk_grid
    
INVARIANT
    atk_grid : 0..grid_sz - 1 --> CELL

INITIALISATION
    atk_grid := (0..grid_sz - 1) * {undiscovered}
    
OPERATIONS
    update_atk_grid(pp, cc) =
    PRE pp : 0..grid_sz - 1 & cc : CELL THEN
        atk_grid(pp) := cc
    END;
    
    ag <-- get_attack_grid =
        ag := atk_grid
END
