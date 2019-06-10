/* Ship_ctx
 * Author: murilobento
 * Creation date: 27/05/2019
 */
MACHINE
    Ship_ctx
    
SEES
    Ship_type_ctx
    
SETS
    SHIPS
    
CONSTANTS
    ship_type_r,
    water_c
    
PROPERTIES
    ship_type_r : 0..20 --> SHIP_TYPE &
    water_c : 0..20

END
