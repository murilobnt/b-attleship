/* GridCell
 * Author: murilobento
 * Creation date: 27/05/2019
 */
MACHINE
    GridCell
    
SETS
    CELL = {water, ship}

VARIABLES
    cell
    
INVARIANT
    cell : CELL
    
INITIALISATION
    cell := water

END
