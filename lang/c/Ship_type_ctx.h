#ifndef _Ship_type_ctx_h
#define _Ship_type_ctx_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


#define Ship_type_ctx__SHIP_TYPE__max 3
/* Clause SETS */
typedef int Ship_type_ctx__SHIP_TYPE;

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
#define Ship_type_ctx__battleship 0
#define Ship_type_ctx__cruiser 1
#define Ship_type_ctx__destroyer 2
#define Ship_type_ctx__submarine 3

/* Array and record constants */




extern const int32_t Ship_type_ctx__ship_size[Ship_type_ctx__SHIP_TYPE__max+1];
extern void Ship_type_ctx__INITIALISATION(void);


#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Ship_type_ctx_h */
