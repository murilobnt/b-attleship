/* Ship
 * Author: murilobento
 * Creation date: 27/05/2019
 */
MACHINE
    Ship_size
    
SEES
    Ship_ctx,
    Dimensions_ctx

CONSTANTS
    ship_size
    
PROPERTIES
    ship_size : SHIP_TYPE >-> SHIP_SIZE
    
OPERATIONS
    rr <-- get_ship_size(ss) =
        PRE ss : SHIP_TYPE
        THEN
            rr := ship_size(ss)
        END
END
