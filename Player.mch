/* Player
 * Author: muril
 * Creation date: 05/06/2019
 */
MACHINE
    Player
    
CONSTANTS
    ships1,
    ships2,
    ships
    
PROPERTIES
    ships1 <: NAT &
    ships2 <: NAT &
    ships <: NAT &
    ships1 /\ ships2 = {} &
    ships = ships1 \/ ships2    

END
