/* Attack_grid
 * Author: muril
 * Creation date: 01/06/2019
 */
MACHINE
    Attack_grid
    
SEES 
    Grid_cell,
    Dimensions_ctx,
    Attack_who_ctx
    
VARIABLES
    atk_grid1,
    atk_grid2
    
INVARIANT
    atk_grid1 : 0..grid_sz - 1 --> CELL &
    atk_grid2 : 0..grid_sz - 1 --> CELL

INITIALISATION
    atk_grid1 := (0..grid_sz - 1) * {undiscovered} || 
    atk_grid2 := (0..grid_sz - 1) * {undiscovered}
    
OPERATIONS
    update_atk_grid(pp, cc, to) =
    PRE pp : 0..grid_sz - 1 & 
        cc : CELL & 
        to : ATTACK_WHO 
    THEN
        IF to = p1 THEN
            atk_grid1(pp) := cc
        ELSE
            atk_grid2(pp) := cc
        END
    END;
    
    ag <-- get_attack_grid1 =
        ag := atk_grid1;
        
    ag <-- get_attack_grid2 =
        ag := atk_grid2
END
