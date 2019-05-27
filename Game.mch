/* Game
 * Author: murilobento
 * Creation date: 27/05/2019
 */
MACHINE
    Game
    
SEES
    Dimensions
    
SETS
    LOL = {yes, no}

VARIABLES
    grid_self
    
INVARIANT
    grid_self : 0..sz --> LOL
    
INITIALISATION
    grid_self :: 0..sz --> LOL

END
