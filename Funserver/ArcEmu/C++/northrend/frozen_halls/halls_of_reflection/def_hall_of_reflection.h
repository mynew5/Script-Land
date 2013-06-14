#ifndef DEF_HALL_OF_REFLECTION_H
#define DEF_HALL_OF_REFLECTION_H  

enum Data
{
    TYPE_INTRO              = 1,
    TYPE_FALRIC             = 2,
    TYPE_MARWYN             = 3,
    TYPE_LICH_KING          = 4,
    TYPE_ICE_WALL_01        = 5,
    TYPE_ICE_WALL_02        = 6,
    TYPE_ICE_WALL_03        = 7,
    TYPE_ICE_WALL_04        = 8,

    DATA_LIDER              = 9,
    DATA_FALRIC             = 10,
    DATA_MARWYN             = 11,
    DATA_LICH_KING          = 12,
    DATA_GO_MAIN_GATE       = 13,
    DATA_GO_FROSTMOURNE     = 14,
    DATA_GO_ICE_WALL_01     = 15,
    DATA_GO_ICE_WALL_02     = 16,
    DATA_GO_ICE_WALL_03     = 17,
    DATA_GO_ICE_WALL_04     = 18,
    DATA_ESCAPE_LIDER       = 19,

    NPC_DARK_1                   = 38177, //Shadowy Mercenary
    NPC_DARK_2                   = 38176, //Tortured Rifleman
    NPC_DARK_3                   = 38173, //Spectral Footman
    NPC_DARK_4                   = 38172, //Phantom Mage
    NPC_DARK_5                   = 38567, //Phantom Hallucination
    NPC_DARK_6                   = 38175, //Ghostly Priest

    MOB_WAVES_NUM_1              = 4,
    MOB_WAVES_DELAY_1            = 30000  //in milliseconds
};

struct Locations
{
    float x, y, z;
    uint32 id;
};

static Locations SpawnLoc[]=
{
    {5325.330078f, 1976.609985f, 707.695007f},  // 0 Марвин
    {5274.630859f, 2040.283813f, 709.319824f},  // 1 Фалрик
    {5346.934570f, 2044.740234f, 707.695801f},  // 2 Выход
};

#endif