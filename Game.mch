/* Game
 * Author: murilobento
 * Creation date: 27/05/2019
 */
MACHINE
    Game
    
SEES
    Dimensions_ctx
    
SETS
    Answer = {yes, no}

VARIABLES
    grid_self
    
INVARIANT
    grid_self : 0..grid_sz --> Answer
    
INITIALISATION
    grid_self :: 0..grid_sz --> Answer

END
