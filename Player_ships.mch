/* Player_ships
 * Author: muril
 * Creation date: 10/06/2019
 */
MACHINE
    Player_ships
    
SEES
    Ship_ctx
    
VARIABLES
    ships1,
    ships2
    
INVARIANT
    ships1 <: 0..20 &
    ships2 <: 0..20 &
    ships1 /\ ships2 = {20}

INITIALISATION        
    ANY 
        aux_ships1, aux_ships2 
    WHERE 
        aux_ships1 <: 0..20 & 
        aux_ships2 <: 0..20 & 
        aux_ships1 /\ aux_ships2 = {20}
    THEN
        ships1 := aux_ships1 || ships2 := aux_ships2
    END
    
OPERATIONS
    remove_ship_from_1(ss) =
    PRE ss : ships1 THEN
        ships1 := ships1 - {ss}
    END;
    
    remove_ship_from_2(ss) =
    PRE ss : ships2 THEN
        ships2 := ships2 - {ss}
    END

END
