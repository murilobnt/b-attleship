/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Ship_type_ctx.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

#define Ship_type_ctx__battleship 0
#define Ship_type_ctx__cruiser 1
#define Ship_type_ctx__destroyer 2
#define Ship_type_ctx__submarine 3
/* Array and record constants */

const int32_t Ship_type_ctx__ship_size[Ship_type_ctx__SHIP_TYPE__max+1] = {4,3,2,1};
/* Clause CONCRETE_VARIABLES */

/* Clause INITIALISATION */
void Ship_type_ctx__INITIALISATION(void)
{
    
    ;
}

