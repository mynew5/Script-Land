/*
 * Copyright (C) 2008 - 2009 Trinity <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

#ifndef DEF_ULDUAR_H
#define DEF_ULDUAR_H

enum eTypes
{
    MAX_ENCOUNTER               = 14,

    TYPE_LEVIATHAN              = 0,
    TYPE_IGNIS                  = 1,
    TYPE_RAZORSCALE             = 2,
    TYPE_XT002                  = 3,
    TYPE_ASSEMBLY               = 4,
    TYPE_KOLOGARN               = 5,
    TYPE_AURIAYA                = 6,
    TYPE_MIMIRON                = 7,
    TYPE_HODIR                  = 8,
    TYPE_THORIM                 = 9,
    TYPE_FREYA                  = 10,
    TYPE_VEZAX                  = 11,
    TYPE_YOGGSARON              = 12,
    TYPE_ALGALON                = 13,
    
    DATA_MIMI_FLOOR,
    DATA_MIMI_DOOR,
    DATA_HARPOON,
    DATA_LEVIATHAN_DOOR,
    DATA_XT002_DOOR,
    
    DATA_STEELBREAKER           = 20,
    DATA_MOLGEIM                = 21,
    DATA_BRUNDIR                = 22,
    DATA_RUNEMASTER_MOLGEIM     = 23,
    DATA_STORMCALLER_BRUNDIR    = 24,
    //Hardmodes etc.
    TYPE_HODIR_HARD             = 25,

    NPC_LEVIATHAN               = 33113,
    NPC_IGNIS                   = 33118,
    NPC_RAZORSCALE              = 33186,
    NPC_XT002                   = 33293,
    NPC_STEELBREAKER            = 32867,
    NPC_MOLGEIM                 = 32927,
    NPC_BRUNDIR                 = 32857,
    NPC_KOLOGARN                = 32930,
    NPC_AURIAYA                 = 33515,
    NPC_MIMIRON                 = 33350,
    NPC_HODIR                   = 32845,
    NPC_THORIM                  = 32865,
    NPC_FREYA                   = 32906,
    NPC_VEZAX                   = 33271,
    NPC_YOGGSARON               = 33288,
    NPC_ALGALON                 = 32871,
    NPC_HARPOON_CREATOR		= 33210

};

enum eGameObjects
{
    GO_Kologarn_CHEST_HERO  = 195047,
    GO_Kologarn_CHEST       = 195046,
    GO_Thorim_CHEST_HERO    = 194315,
    GO_Thorim_CHEST         = 194314,
    GO_Hodir_CHEST_HERO     = 194308,
    GO_Hodir_CHEST          = 194307,
    GO_Freya_CHEST_HERO     = 194325,
    GO_Freya_CHEST          = 194324,
    GO_Hodir_CHEST_S	    = 194200,
    GO_Hodir_CHEST_SH	    = 194201,
    GO_Mimiron_CHEST	    = 194789,
    GO_Mimiron_CHEST_H	    = 194956,
    GO_Algalon_CHEST	    = 194821,
    GO_Algalon_CHEST_H	    = 194822,
    GO_MIMI_FLOOR	    = 194749,
    GO_MIMI_DOOR1	    = 194776,
    GO_MIMI_DOOR2	    = 194775,
    GO_MIMI_DOOR3	    = 194774,
    GO_HARPOON		    = 194565,
    GO_XT002_DOOR           = 194631,
    GO_LEVIATHAN_DOOR       = 194905,
    GO_LEVIATHAN_GATE       = 194630
};
#endif
