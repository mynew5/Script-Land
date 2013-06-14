/* Copyright (C) 2006 - 2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software licensed under GPL version 2
 * Please see the included DOCS/LICENSE.TXT for more information */

#ifndef DEF_BFD_H
#define DEF_BFD_H

enum Data64
{
    DATA_ONYXIA,
    DATA_FLOOR_ERUPTION
};

enum Data
{
    TYPE_ONYXIA,
    DATA_ONYXIA_PHASE,
    DATA_SHE_DEEP_BREATH_MORE,
    DATA_MANY_WHELPS_COUNT
};

enum Creatures
{
    NPC_WHELP                   = 11262,
    NPC_LAIRGUARD               = 36561,

    NPC_ONYXIA                  = 10184
};

enum GameObjects
{
    GO_WHELP_SPAWNER            = 176510,
    GO_WHELP_EGG                = 176511
};

enum OnyPhases 
{
    PHASE_START                 = 1,
    PHASE_BREATH                = 2,
    PHASE_END                   = 3
};
#endif
