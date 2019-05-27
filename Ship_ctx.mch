/* Ship_ctx
 * Author: murilobento
 * Creation date: 27/05/2019
 */
MACHINE
    Ship_ctx

SETS
    SHIP_TYPE; SHIP_SIZE

CONSTANTS
    battleship,
    cruiser,
    destroyer,
    submarine
    
PROPERTIES
    battleship : SHIP_TYPE &
    battleship /= cruiser & battleship /= destroyer & battleship /= submarine &
    cruiser /= destroyer & cruiser /= submarine & destroyer /= submarine &
    card(SHIP_TYPE) = 4

END
