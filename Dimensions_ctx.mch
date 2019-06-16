    /* Dimensions_ctx
 * Author: murilobento
 * Creation date: 27/05/2019
 */
MACHINE
    Dimensions_ctx
    
CONSTANTS
    grid_dim_x, 
    grid_dim_y, 
    grid_sz, 
    grid_sz_for_arr
    
PROPERTIES
    grid_dim_x : NAT & 
    grid_dim_y : NAT & 
    grid_sz = grid_dim_x * grid_dim_y &
    grid_sz_for_arr = grid_sz - 1

END
