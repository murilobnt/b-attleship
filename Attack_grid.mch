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
    atk_grid1 : 0..grid_sz_for_arr --> CELL &
    atk_grid2 : 0..grid_sz_for_arr --> CELL

INITIALISATION
    atk_grid1 := (0..grid_sz_for_arr) * {undiscovered} || 
    atk_grid2 := (0..grid_sz_for_arr) * {undiscovered}
    
OPERATIONS
    update_atk_grid(pp, cc, to) =
    PRE pp : 0..grid_sz_for_arr & 
        cc : CELL & 
        to : ATTACK_WHO 
    THEN
        IF to = p1 THEN
            atk_grid1(pp) := cc
        ELSE
            atk_grid2(pp) := cc
        END
    END;

    update_atk_grid_for_destroyed_ship(pp, to, sz) =
    PRE sz : NAT &
        pp : 0..sz --> 0..grid_sz_for_arr &
        to : ATTACK_WHO
    THEN
        IF to = p1 THEN
            atk_grid1 := atk_grid1 <+ (ran(pp) * {destroyed_ship})
        ELSE
            atk_grid2 := atk_grid2 <+ (ran(pp) * {destroyed_ship})
        END
    END;
    
    ag <-- get_attack_grid1 =
        ag := atk_grid1;
        
    ag <-- get_attack_grid2 =
        ag := atk_grid2
END
