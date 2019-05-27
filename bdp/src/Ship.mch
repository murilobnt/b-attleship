/* Ship
 * Author: murilobento
 * Creation date: 27/05/2019
 */
MACHINE
    Ship

SETS
    SHIP_TYPE

ABSTRACT_VARIABLES
    ship_size

INVARIANT
    ship_size : SHIP_TYPE --> 1 .. 4

INITIALISATION
    ship_size :: SHIP_TYPE --> 1 .. 4

OPERATIONS
    rr <-- get_ship_size ( ss ) =
        PRE ss : SHIP_TYPE
        THEN
            rr := ship_size ( ss )
            END

END
