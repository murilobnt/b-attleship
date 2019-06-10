/* Player
 * Author: muril
 * Creation date: 05/06/2019
 */
MACHINE
    Player
    
SEES
    Ship_ctx
    
CONSTANTS
    ships1,
    ships2,
    ship_type_r,
    ships
    
PROPERTIES
    ships1 <: NAT &
    ships2 <: NAT &
    ships <: NAT &
    ship_type_r : ships --> SHIP_TYPE &
    ships1 /\ ships2 = {} &
    ships = ships1 \/ ships2    

END
