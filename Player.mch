/* Player
 * Author: muril
 * Creation date: 05/06/2019
 */
MACHINE
    Player
    
SEES
    Ship_ctx
    
SETS
    SHIPS
    
CONSTANTS
    ship_type_r,
    water_c
    
PROPERTIES
    ship_type_r : SHIPS --> SHIP_TYPE &
    water_c : SHIPS
    
VARIABLES
    ships1,
    ships2
    
INVARIANT
    ships1 <: SHIPS &
    ships2 <: SHIPS &
    ships1 /\ ships2 = {}

INITIALISATION
    ships1 := {} || ships2 := {}

END
