/* Game
 * Author: murilobento
 * Creation date: 27/05/2019
 */
MACHINE
    Game

SETS
    PLAYER

ABSTRACT_VARIABLES
    player

INVARIANT
    player : PLAYER

INITIALISATION
    player :: PLAYER

OPERATIONS

    pp <-- get_player =
    pp := player

END
