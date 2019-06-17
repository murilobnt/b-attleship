#include <stdio.h>
#include "Attack_who_ctx.h"
#include "Ship_type_ctx.h"
#include "Game.h"

void print_attack_grid(Attack_who_ctx__ATTACK_WHO player){
  Grid_cell__CELL ag[Dimensions_ctx__grid_sz_for_arr+1];
  player == Attack_who_ctx__p1 ? Attack_grid__get_attack_grid1(ag) :
                                 Attack_grid__get_attack_grid2(ag);
   printf("x | 1234567890 |\nx | ---------- |\n");
   for(int i = 0; i < Dimensions_ctx__grid_dim_y; ++i){
     printf("%d | ", ((i + 1) % 10));
     for(int j = 0; j < Dimensions_ctx__grid_dim_x; ++j){
       if(ag[j + (i * Dimensions_ctx__grid_dim_x)] == Grid_cell__undiscovered)
        printf("-");
       if(ag[j + (i * Dimensions_ctx__grid_dim_x)] == Grid_cell__water)
        printf("w");
       if(ag[j + (i * Dimensions_ctx__grid_dim_x)] == Grid_cell__ship)
        printf("o");
       if(ag[j + (i * Dimensions_ctx__grid_dim_x)] == Grid_cell__destroyed_ship)
        printf("x");
     }
     printf(" |\n");
   }
}

void print_grid_to_ship(Attack_who_ctx__ATTACK_WHO player){
  int32_t gts[Dimensions_ctx__grid_sz_for_arr+1];
  player == Attack_who_ctx__p1 ? Game__get_grid_to_ship1(gts) :
                                 Game__get_grid_to_ship2(gts);
   printf("x | 1234567890 |\nx | ---------- |\n");
   for(int i = 0; i < Dimensions_ctx__grid_dim_y; ++i){
     printf("%d | ",  ((i + 1) % 10));
     for(int j = 0; j < Dimensions_ctx__grid_dim_x; ++j){
       if(gts[j + (i * Dimensions_ctx__grid_dim_x)] == Ship_ctx__water_c){
         printf("x");
       } else {
         if(Ship_ctx__ship_type_r[gts[j + (i * Dimensions_ctx__grid_dim_x)]] == Ship_type_ctx__battleship)
           printf("e");
         if(Ship_ctx__ship_type_r[gts[j + (i * Dimensions_ctx__grid_dim_x)]] == Ship_type_ctx__cruiser)
           printf("c");
         if(Ship_ctx__ship_type_r[gts[j + (i * Dimensions_ctx__grid_dim_x)]] == Ship_type_ctx__destroyer)
           printf("d");
         if(Ship_ctx__ship_type_r[gts[j + (i * Dimensions_ctx__grid_dim_x)]] == Ship_type_ctx__submarine)
           printf("s");
       }
     }
     printf(" |\n");
   }
}

bool game_turn(Attack_who_ctx__ATTACK_WHO player) {
  print_attack_grid(player);
  char who = (player == Attack_who_ctx__p1 ? '1' : '2');
  printf("Jogador %c, escolha uma posição para atacar (l), (c).", who);
  int32_t pos1, pos2, pos;
  scanf("%i %i", &pos1, &pos2);
  pos = (pos2 - 1) + ((pos1 - 1) * 10);
  Game__ATTACK_REPORT result;
  Game__OP_STATUS status;
  Game__attack(pos, (player == Attack_who_ctx__p1 ? Attack_who_ctx__p2 : Attack_who_ctx__p1), &result, &status);
  if(result == Game__hit)
    printf("O seu ataque acertou um navio inimigo!");
  if(result == Game__miss)
    printf("O seu ataque não acertou nenhum navio inimigo.");
  if(result == Game__destroyed)
    printf("O seu ataque destruiu um navio inimigo!");

  bool win;
  Game__check_win_condition(player, &win);
  if(win){
     printf("O jogador %c venceu!", who);
     return 1;
  }
  return 0;
}

void position_ships_for_p1(){
  printf("Jogador 1, posicione os seus navios.\n");
  for(int32_t i = 0; i < 10; ++i){
    print_grid_to_ship(Attack_who_ctx__p1);
    if(i == 0){
      printf("Posicionar navio: Encouraçado. Tamanho: 4.\n");
    }
    else if (i > 0 & i < 3){
      printf("Posicionar navio: Cruzador. Tamanho: 3.\n");
    }
    else if (i >= 3 & i < 6){
      printf("Posicionar navio: Destroyer. Tamanho: 2.\n");
    }
    else {
      printf("Posicionar navio: Submarino. Tamanho: 1.\n");
    }

    int32_t pos1, pos2, pos, horizontal;
    Game__OP_STATUS status;
    do {
      printf("Escolha uma posição para colocar o navio (l), (c), (0: horizontal, 1: vertical): ");
      scanf("%i %i %i", &pos1, &pos2, &horizontal);
      pos = (pos2 - 1) + ((pos1 - 1) * 10);
      if(!horizontal){
        Game__add_ship(i, Game__horizontal, pos, &status);
      } else {
        Game__add_ship(i, Game__vertical, pos, &status);
      }
      if(status == Game__error)
        printf("Desculpe, você não pode colocar este navio nessa posição.\n");
    } while(status == Game__error);
  }
}

void position_ships_for_p2() {
  printf("Jogador 2, posicione os seus navios.\n");
  for(int32_t i = 10; i < 20; ++i){
    print_grid_to_ship(Attack_who_ctx__p2);
    if(i == 10){
      printf("Posicionar navio: Encouraçado. Tamanho: 4.\n");
    }
    else if (i > 10 & i < 13){
      printf("Posicionar navio: Cruzador. Tamanho: 3.\n");
    }
    else if (i >= 13 & i < 16){
      printf("Posicionar navio: Destroyer. Tamanho: 2.\n");
    }
    else {
      printf("Posicionar navio: Submarino. Tamanho: 1.\n");
    }

    int32_t pos1, pos2, pos, horizontal;
    Game__OP_STATUS status;
    do {
      printf("Escolha uma posição para colocar o navio (l), (c), (0: horizontal, 1: vertical): ");
      scanf("%i %i %i", &pos1, &pos2, &horizontal);
      pos = (pos2 - 1) + ((pos1 - 1) * 10);
      if(!horizontal){
        Game__add_ship(i, Game__horizontal, pos, &status);
      } else {
        Game__add_ship(i, Game__vertical, pos, &status);
      }
      if(status == Game__error)
        printf("Desculpe, você não pode colocar este navio nessa posição.\n");
    } while(status == Game__error);
  }
}

int main(){
  printf("##### B-attleship #####\n");
  Game__INITIALISATION();
  position_ships_for_p1();
  position_ships_for_p2();
  Game__OP_STATUS status;
  Game__unlock_attack(&status);
  if(status == Game__error){
    printf("Desculpe, algo deu errado.\n");
    return 0;
  }
  while(1){
    if(game_turn(Attack_who_ctx__p1)) break;
    if(game_turn(Attack_who_ctx__p2)) break;
  }
  return 0;
}
