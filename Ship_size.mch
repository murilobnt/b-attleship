/* Ship
 * Author: murilobento
 * Creation date: 27/05/2019
 */
MACHINE
    Ship_size
    
SEES
    Ship_type_ctx

//ABSTRACT_CONSTANTS
//    ship_size,
//    ship_size_index
//    
//PROPERTIES
//    ship_size_index : SHIP_TYPE --> 0..3 &
//    ship_size : SHIP_TYPE --> 1..4

CONSTANTS
    ship_size
    
PROPERTIES
    ship_size : SHIP_TYPE --> 1..4
    
END
