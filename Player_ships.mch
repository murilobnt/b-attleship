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
    ships1 <: SHIPS &
    ships2 <: SHIPS &
    ships1 /\ ships2 = {}

INITIALISATION        
    ANY 
        aux_ships1, aux_ships2 
    WHERE 
        aux_ships1 <: SHIPS & 
        aux_ships2 <: SHIPS & 
        aux_ships1 /\ aux_ships2 = {}
    THEN
        ships1 := aux_ships1 || ships2 := aux_ships2
    END

END
