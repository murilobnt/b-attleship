#ifndef _Ship_ctx_h
#define _Ship_ctx_h

#include <stdint.h>
#include <stdbool.h>
/* Clause SEES */
#include "Ship_type_ctx.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


#define Ship_ctx__SHIPS__max 20
/* Clause SETS */
typedef int Ship_ctx__SHIPS;

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

#define Ship_ctx__water_c 20
/* Array and record constants */
extern const Ship_type_ctx__SHIP_TYPE Ship_ctx__ship_type_r[21];

extern void Ship_ctx__INITIALISATION(void);


#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Ship_ctx_h */
