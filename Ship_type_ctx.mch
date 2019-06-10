/* Ship_type_ctx
 * Author: muril
 * Creation date: 10/06/2019
 */
MACHINE
    Ship_type_ctx
    
SETS
    SHIP_TYPE

CONSTANTS
    battleship,
    cruiser,
    destroyer,
    submarine
    
PROPERTIES
    battleship : SHIP_TYPE & cruiser : SHIP_TYPE & destroyer : SHIP_TYPE & submarine : SHIP_TYPE &
    battleship /= cruiser & battleship /= destroyer & battleship /= submarine &
    cruiser /= destroyer & cruiser /= submarine & destroyer /= submarine &
    card(SHIP_TYPE) = 4

END
