TIME_TO_BATTLE = 9000
BATTLE_TIMER = 1800
local timer_nextbattle = os.time() + TIME_TO_BATTLE
local timer_battle = 0
local controll = math.random(1,2)
battle = 0
states = 0
stateuiset = 0
add_tokens = 1
starttimer = 0
spawnobjects = 0
npcstarted = false
south_towers = 3
ATTACKER = " "
DEFENDER = " "

C_BAR_NEUTRAL = 80 -- the neutral vallue of the capture bar. MUST BE UNDER 100.
C_BAR_CAPTURE = (100 - C_BAR_NEUTRAL)/2

GAMEOBJECT_FACTION = 0x0006 + 0x0009

 -- Factions
FACTION_HORDE = 1735
FACTION_ALLIANCE = 1732
FACTION_NEUTRAL = 35

 -- vehicle workshops capture bar controllers
eastspark_progress = 50
westspark_progress = 50
sunkenring_progress = 50
brokentemple_progres = 50
 -- Max vehicle worldstate controllers (neutral, destroyed - 0, half destroyed (A/H) - 2, intact (A/H) - 4)
A_V_EASTSPARK = 0
H_V_EASTSPARK = 0
A_V_WESTSPARK = 0
H_V_WESTSPARK = 0
A_V_SUNKENRING = 0
H_V_SUNKENRING = 0
A_V_BROKENTEMPLE = 0
H_V_BROKENTEMPLE = 0
A_V_FORTRESS_EAST = 0
H_V_FORTRESS_EAST = 0
A_V_FORTRESS_WEST = 0
H_V_FORTRESS_WEST = 0
 -- UI STATES
WG_STATE_NEXT_BATTLE_TIME =	4354
WG_STATE_END_BATTLE_TIME = 3781
WG_HORDE_CONTROLLED = 3802
WG_ALLIANCE_CONTROLLED = 3803
WG_STATE_BATTLE_UI = 3710
WG_STATE_BATTLE_TIME = 3781
WG_STATE_NEXT_BATTLE_TIMER = 3801
WG_STATE_CURRENT_H_VEHICLES = 3490
WG_STATE_MAX_H_VEHICLES = 3491
WG_STATE_CURRENT_A_VEHICLES = 3680
WG_STATE_MAX_A_VEHICLES = 3681
 -- Map states:
WG_STATE_W_FORTRESS_WORKSHOP = 3698
WG_STATE_E_FORTRESS_WORKSHOP = 3699
WG_STATE_BT_WORKSHOP = 3700
WG_STATE_SR_WORKSHOP = 3701
WG_STATE_WS_WORKSHOP = 3702
WG_STATE_ES_WORKSHOP = 3703
WG_STATE_MAIN_GATE = 3763
WG_STATE_KEEP_GATE_ANDGY = 3773
WG_STATE_KEEP_WALL_1 = 3749
WG_STATE_KEEP_WALL_2 = 3750
WG_STATE_KEEP_WALL_3 = 3751
WG_STATE_KEEP_WALL_4 = 3752
WG_STATE_KEEP_WALL_5 = 3753
WG_STATE_KEEP_WALL_6 = 3754
WG_STATE_KEEP_WALL_7 = 3755
WG_STATE_KEEP_WALL_8 = 3756
WG_STATE_KEEP_WALL_9 = 3757
WG_STATE_KEEP_WALL_10 = 3758
WG_STATE_KEEP_WALL_11 = 3759
WG_STATE_KEEP_WALL_12 = 3760
WG_STATE_KEEP_WALL_13 = 3761
WG_STATE_KEEP_WALL_14 = 3762
WG_STATE_KEEP_WALL_15 = 3764
WG_STATE_KEEP_WALL_16 = 3765
WG_STATE_KEEP_WALL_17 = 3766
WG_STATE_KEEP_WALL_18 = 3767
WG_STATE_KEEP_WALL_19 = 3768
WG_STATE_KEEP_WALL_20 = 3769
WG_STATE_KEEP_WALL_21 = 3770
WG_STATE_KEEP_WALL_22 = 3771
WG_STATE_KEEP_WALL_23 = 3772
WG_STATE_KEEP_SE_TOWER = 3714
WG_STATE_KEEP_SW_TOWER = 3713
WG_STATE_KEEP_NW_TOWER = 3711
WG_STATE_KEEP_NE_TOWER = 3712
WG_STATE_FW_TOWER = 3706
WG_STATE_WE_TOWER = 3705
WG_STATE_SS_TOWER = 3704
 -- Dynamic capturebar states
WG_STATE_SOUTH_SHOW = 3501
WG_STATE_SOUTH_PROGRESS = 3502
WG_STATE_SOUTH_NEUTRAL = 3508

WG_STATE_NORTH_SHOW = 3466
WG_STATE_NORTH_PROGRESS = 3467
WG_STATE_NORTH_NEUTRAL = 3468

NPC_DETECTION_UNIT = 27869
NPC_GOBLIN_ENGINEER = 30400
NPC_GNOME_ENGINEER = 30499
NPC_NOT_IMMUNE_PC_NPC = 23472
NPC_INVISIBLE_STALKER = 15214
NPC_VEHICLE_CATAPULT = 27881
NPC_VEHICLE_DEMOLISHER = 28094
NPC_VEHICLE_SIEGE_ENGINE_H = 32627
NPC_VEHICLE_SIEGE_ENGINE_A = 28312

GO_WINTERGRASP_TITAN_RELIC = 192829
GO_WINTERGRASP_SE_TOWER = 190377
GO_WINTERGRASP_NE_TOWER = 190378
GO_WINTERGRASP_SW_TOWER = 190373
GO_WINTERGRASP_NW_TOWER = 190221
GO_WINTERGRASP_SHADOWSIGHT_TOWER = 190356
GO_WINTERGRASP_WINTER_S_EDGE_TOWER = 190357
GO_WINTERGRASP_FLAMEWATCH_TOWER = 190358
GO_WINTERGRASP_FORTRESS_GATE = 190375
GO_WINTERGRASP_VAULT_GATE = 191810
GO_WINTERGRASP_KEEP_COLLISION_WALL = 194162
GO_WINTERGRASP_KEEP_WALL_1 = 190219
GO_WINTERGRASP_KEEP_WALL_2 = 190220
GO_WINTERGRASP_KEEP_WALL_3 = 191802
GO_WINTERGRASP_KEEP_WALL_4 = 191803
GO_WINTERGRASP_KEEP_WALL_5 = 190369
GO_WINTERGRASP_KEEP_WALL_6 = 190371
GO_WINTERGRASP_KEEP_WALL_7 = 190374
GO_WINTERGRASP_KEEP_WALL_8 = 190376
GO_WINTERGRASP_KEEP_WALL_9 = 190372
GO_WINTERGRASP_KEEP_WALL_10 = 190370
GO_WINTERGRASP_KEEP_WALL_11 = 191807
GO_WINTERGRASP_KEEP_WALL_12 = 191808
GO_WINTERGRASP_KEEP_WALL_13 = 191809
GO_WINTERGRASP_KEEP_WALL_14 = 191799
GO_WINTERGRASP_KEEP_WALL_15 = 191795
GO_WINTERGRASP_KEEP_WALL_16 = 191797
GO_WINTERGRASP_KEEP_WALL_17 = 191800
GO_WINTERGRASP_KEEP_WALL_18 = 191804
GO_WINTERGRASP_KEEP_WALL_19 = 191805
GO_WINTERGRASP_KEEP_WALL_20 = 191806
GO_WINTERGRASP_KEEP_WALL_21 = 191801
GO_WINTERGRASP_KEEP_WALL_22 = 191798
GO_WINTERGRASP_KEEP_WALL_23 = 191796
GO_WINTERGRASP_WORKSHOP_E = 192029
GO_WINTERGRASP_WORKSHOP_W = 192028
GO_WINTERGRASP_FW_TOWER = 190358
GO_WINTERGRASP_WE_TOWER = 190357
GO_WINTERGRASP_SS_TOWER = 190356
GO_WINTERGRASP_DEFENDER_H = 190763
GO_WINTERGRASP_DEFENDER_A = 191575
GO_WINTERGRASP_DEFENDER_N = 192819
GO_WINTERGRASP_VEHICLE_TELEPORTER = 192951
 -- Eastspark
GO_WINTERGRASP_WORKSHOP_ES = 192033
GO_WINTERGRASP_CAPTUREPOINT_ES_100 = 194959
GO_WINTERGRASP_CAPTUREPOINT_ES_0 = 194960

GO_WINTERGRASP_WORKSHOP_WS = 192032
GO_WINTERGRASP_CAPTUREPOINT_WS_100 = 194962
GO_WINTERGRASP_CAPTUREPOINT_WS_0 = 194963

GO_WINTERGRASP_WORKSHOP_SR = 192031
GO_WINTERGRASP_CAPTUREPOINT_SR_100 = 190475
GO_WINTERGRASP_CAPTUREPOINT_SR_0 = 192626

GO_WINTERGRASP_WORKSHOP_BT = 192030
GO_WINTERGRASP_CAPTUREPOINT_BT_100 = 190487
GO_WINTERGRASP_CAPTUREPOINT_BT_0 = 192627
 -- Map info
MAP_HOR = 668
MAP_NEXUS = 576
MAP_UP = 575
MAP_UK = 574
MAP_OCULUS = 578
MAP_POS = 658
MAP_TOC = 650
MAP_FOS = 632
MAP_AK = 619
MAP_VH = 608
MAP_GUND = 604
MAP_HOL = 602
MAP_AN = 601
MAP_HOS = 599
MAP_COS = 595
MAP_NORTHREND = 571
 -- Areass
ZONE_WG = 4197
AREA_FORTRESS = 4575
AREA_EASTSPARK = 4612
AREA_WESTSPARK = 4611
AREA_BROKENTEMPLE = 4539
AREA_SUNKENRING = 4538
AREA_FLAMEWATCH_T = 4581
AREA_WINTERSEDGE_T = 4582
AREA_SHADOWSIGHT_T = 4583
AREA_C_BRIDGE = 4576
AREA_E_BRIDGE = 4557
AREA_W_BRIDGE = 4578
 -- Spells
SPELL_RECRUIT = 37795
SPELL_CORPORAL = 33280
SPELL_LIEUTENANT = 55629
SPELL_TENACITY = 58549
SPELL_TENACITY_VEHICLE = 59911
SPELL_TOWER_CONTROL = 62064
SPELL_SPIRITUAL_IMMUNITY = 58729
SPELL_GREAT_HONOR = 58555
SPELL_GREATER_HONOR = 58556
SPELL_GREATEST_HONOR = 58557
SPELL_ALLIANCE_FLAG = 14268
SPELL_HORDE_FLAG = 14267
SPELL_GRAB_PASSENGER = 61178
SPELL_TELEPORT_DEFENDER = 54643
SPELL_TELEPORT_VEHICLE = 49759
SPELL_BUILD_CATAPULT = 56663
SPELL_BUILD_DEMOLISHER = 56575
SPELL_BUILD_ENGINE_A = 56661
SPELL_BUILD_ENGINE_H = 61408
 -- Reward spells
SPELL_VICTORY_REWARD = 56902
SPELL_DEFEAT_REWARD = 58494
SPELL_DAMAGED_TOWER = 59135
SPELL_DESTROYED_TOWER = 59136
SPELL_DAMAGED_BUILDING = 59201
SPELL_INTACT_BUILDING = 59203
SPELL_TELEPORT_BRIDGE = 59096
SPELL_TELEPORT_FORTRESS = 60035
SPELL_TELEPORT_DALARAN = 53360
SPELL_VICTORY_AURA = 60044
SPELL_WINTERGRASP_WATER = 36444
SPELL_ESSENCE_OF_WINTERGRASP = 57940
SPELL_WINTERGRASP_RESTRICTED_FLIGHT_AREA = 58730
 -- Phasing spells
SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT = 56618 -- phase 16
SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT = 56617 -- phase 32
SPELL_HORDE_CONTROL_PHASE_SHIFT = 55773 -- phase 64
SPELL_ALLIANCE_CONTROL_PHASE_SHIFT = 55774  -- phase 128

 -- achievements
ACHIEVEMENT_VICTORY = 1717
ACHIEVEMENT_WIN_OUR_GRASP = 1755
ACHIEVEMENT_LEANING_T = 1727

 -- Quests
QUEST_WG_VICTORY_A = 13181
QUEST_WG_VICTORY_H = 13183
QUEST_WG_TOPPING_TOWERS = 13539
QUEST_WG_SOUTHEN_SABOTAGE = 13538
QUEST_WG_DEFEND_SIEDGE_A = 13222
QUEST_WG_DEFEND_SIEDGE_H = 13223

-- Opcodes
SMSG_PLAY_SOUND = 0x2D2
SMSG_BATTLEFIELD_MGR_ENTRY_INVITE = 0x4DE
CMSG_BATTLEFIELD_MGR_ENTRY_INVITE_RESPONSE = 0x4DF
SMSG_BATTLEFIELD_MGR_ENTERED = 0x4E0
SMSG_BATTLEFIELD_MGR_QUEUE_INVITE = 0x4E1
CMSG_BATTLEFIELD_MGR_QUEUE_INVITE_RESPONSE = 0x4E2
CMSG_BATTLEFIELD_MGR_QUEUE_REQUEST = 0x4E3
SMSG_BATTLEFIELD_MGR_QUEUE_REQUEST_RESPONSE = 0x4E4
SMSG_BATTLEFIELD_MGR_EJECT_PENDING  = 0x4E5
SMSG_BATTLEFIELD_MGR_EJECTED = 0x4E6
CMSG_BATTLEFIELD_MGR_EXIT_REQUEST = 0x4E7
SMSG_BATTLEFIELD_MGR_STATE_CHANGE = 0x4E8
CMSG_BATTLEFIELD_MANAGER_ADVANCE_STATE = 0x4E9
CMSG_BATTLEFIELD_MANAGER_SET_NEXT_TRANSITION_TIME = 0x4EA
CMSG_START_BATTLEFIELD_CHEAT = 0x4CB
CMSG_END_BATTLEFIELD_CHEAT = 0x4CC
CMSG_LEAVE_BATTLEFIELD = 0x2E1
CMSG_BATTLEFIELD_PORT = 0x2D5
CMSG_BATTLEFIELD_STATUS = 0x2D3
SMSG_BATTLEFIELD_STATUS = 0x2D4
CMSG_BATTLEFIELD_LIST = 0x23C
SMSG_BATTLEFIELD_LIST = 0x23D
CMSG_BATTLEFIELD_JOIN = 0x23E
SMSG_BATTLEFIELD_PORT_DENIED = 0x14B

function Aura()
for k,l in pairs(GetPlayersInWorld())do
if(l:GetMapId() == MAP_HOR or l:GetMapId() == MAP_NEXUS or l:GetMapId() == MAP_UP or l:GetMapId() == MAP_UK or l:GetMapId() == MAP_OCULUS or l:GetMapId() == MAP_POS or l:GetMapId() == MAP_TOC or l:GetMapId() == MAP_FOS or l:GetMapId() == MAP_AK or l:GetMapId() == MAP_VH or l:GetMapId() == MAP_GUND or l:GetMapId() == MAP_HOL or l:GetMapId() == MAP_AN or l:GetMapId() == MAP_HOS or l:GetMapId() == MAP_COS or l:GetMapId() == MAP_NORTHREND)then
	if(battle == 0 and controll == 1 and l:GetTeam() == 0 and l:HasAura(SPELL_ESSENCE_OF_WINTERGRASP) ~= true)then
		l:AddAura(SPELL_ESSENCE_OF_WINTERGRASP,0)
	elseif(controll == 1 and l:GetTeam() == 1 and l:HasAura(SPELL_ESSENCE_OF_WINTERGRASP))then
		l:RemoveAura(SPELL_ESSENCE_OF_WINTERGRASP)
	elseif(battle == 0 and controll == 2 and l:GetTeam() == 1 and l:HasAura(SPELL_ESSENCE_OF_WINTERGRASP) ~= true)then
		l:AddAura(SPELL_ESSENCE_OF_WINTERGRASP,0)
	elseif(controll == 2 and l:GetTeam() == 0 and l:HasAura(SPELL_ESSENCE_OF_WINTERGRASP))then
		l:RemoveAura(SPELL_ESSENCE_OF_WINTERGRASP)
	elseif(battle == 1)then
		if(l:HasAura(SPELL_ESSENCE_OF_WINTERGRASP))then
			l:RemoveAura(SPELL_ESSENCE_OF_WINTERGRASP)
		end
	end
else
	if(l:HasAura(SPELL_ESSENCE_OF_WINTERGRASP))then
		l:RemoveAura(SPELL_ESSENCE_OF_WINTERGRASP)
	end
end
if(l:GetZoneId() ~= ZONE_WG and l:GetAreaId() ~= ZONE_WG)then
	if(l:HasAura(SPELL_RECRUIT))then
		l:RemoveAura(SPELL_RECRUIT)
	end
	if(l:HasAura(SPELL_CORPORAL))then
		l:RemoveAura(SPELL_CORPORAL)
	end
	if(l:HasAura(SPELL_LIEUTENANT))then
		l:RemoveAura(SPELL_LIEUTENANT)
	end
	if(l:HasAura(SPELL_TOWER_CONTROL))then
		l:RemoveAura(SPELL_TOWER_CONTROL)
	end
	if(l:HasAura(SPELL_GREAT_HONOR))then
		l:RemoveAura(SPELL_GREAT_HONOR)
	end
	if(l:HasAura(SPELL_GREATER_HONOR))then
		l:RemoveAura(SPELL_GREATER_HONOR)
	end
	if(l:HasAura(SPELL_GREATEST_HONOR))then
		l:RemoveAura(SPELL_GREATEST_HONOR)
	end
	if(l:HasAura(SPELL_VICTORY_AURA))then
		l:RemoveAura(SPELL_VICTORY_AURA)
	end
end
if(l:GetAreaId() == AREA_EASTSPARK)then
	if(eastspark_progress > C_BAR_CAPTURE + C_BAR_NEUTRAL)then
		if(l:HasAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
		if(l:HasAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT) == false)then
			l:CastSpell(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
	elseif(eastspark_progress < C_BAR_CAPTURE + C_BAR_NEUTRAL and eastspark_progress > C_BAR_CAPTURE)then
		if(l:HasAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
		if(l:HasAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
	elseif(eastspark_progress < C_BAR_CAPTURE)then
		if(l:HasAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT) == false)then
			l:CastSpell(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
		if(l:HasAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
	end
elseif(l:GetAreaId() == AREA_WESTSPARK)then
	if(westspark_progress > C_BAR_CAPTURE + C_BAR_NEUTRAL)then
		if(l:HasAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
		if(l:HasAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT) == false)then
			l:CastSpell(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
	elseif(westspark_progress < C_BAR_CAPTURE + C_BAR_NEUTRAL and westspark_progress > C_BAR_CAPTURE)then
		if(l:HasAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
		if(l:HasAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
	elseif(westspark_progress < C_BAR_CAPTURE)then
		if(l:HasAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT) == false)then
			l:CastSpell(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
		if(l:HasAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
	end
elseif(l:GetAreaId() == AREA_SUNKENRING)then
	if(sunkenring_progress > C_BAR_CAPTURE + C_BAR_NEUTRAL)then
		if(l:HasAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
		if(l:HasAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT) == false)then
			l:CastSpell(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
	elseif(sunkenring_progress < C_BAR_CAPTURE + C_BAR_NEUTRAL and sunkenring_progress > C_BAR_CAPTURE)then
		if(l:HasAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
		if(l:HasAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
	elseif(sunkenring_progress < C_BAR_CAPTURE)then
		if(l:HasAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT) == false)then
			l:CastSpell(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
		if(l:HasAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
	end
elseif(l:GetAreaId() == AREA_BROKENTEMPLE)then
	if(brokentemple_progres > C_BAR_CAPTURE + C_BAR_NEUTRAL)then
		if(l:HasAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
		if(l:HasAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT) == false)then
			l:CastSpell(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
	elseif(brokentemple_progres < C_BAR_CAPTURE + C_BAR_NEUTRAL and brokentemple_progres > C_BAR_CAPTURE)then
		if(l:HasAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
		if(l:HasAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
	elseif(brokentemple_progres < C_BAR_CAPTURE)then
		if(l:HasAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT) == false)then
			l:CastSpell(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
		if(l:HasAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
	end
else
	if(l:HasAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_ALLIANCE_CONTROLS_FACTORY_PHASE_SHIFT)
		end
	if(l:HasAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT))then
			l:RemoveAura(SPELL_HORDE_CONTROLS_FACTORY_PHASE_SHIFT)
	end
end
if(l:GetZoneId() == ZONE_WG and controll == 1 and l:GetTeam() == 1 and battle == 1)then
	if(l:HasAura(SPELL_TOWER_CONTROL) == false and south_towers > 0)then
		l:CastSpell(SPELL_TOWER_CONTROL)
	elseif(l:HasAura(SPELL_TOWER_CONTROL) and south_towers > 0 and l:GetAuraStackCount(SPELL_TOWER_CONTROL) < south_towers)then
		l:CastSpell(SPELL_TOWER_CONTROL)
	elseif(l:HasAura(SPELL_TOWER_CONTROL) and south_towers < l:GetAuraStackCount(SPELL_TOWER_CONTROL))then
		l:RemoveAura(SPELL_TOWER_CONTROL)
	end
elseif(l:GetZoneId() == ZONE_WG and controll == 2 and l:GetTeam() == 0 and battle == 1)then
	if(l:HasAura(SPELL_TOWER_CONTROL) == false and south_towers > 0)then
		l:CastSpell(SPELL_TOWER_CONTROL)
	elseif(l:HasAura(SPELL_TOWER_CONTROL) and south_towers > 0 and l:GetAuraStackCount(SPELL_TOWER_CONTROL) < south_towers)then
		l:CastSpell(SPELL_TOWER_CONTROL)
	elseif(l:HasAura(SPELL_TOWER_CONTROL) and south_towers < l:GetAuraStackCount(SPELL_TOWER_CONTROL))then
		l:RemoveAura(SPELL_TOWER_CONTROL)
	end
elseif(l:GetZoneId() == ZONE_WG and battle == 0)then
	if(l:HasAura(SPELL_TOWER_CONTROL))then
		l:RemoveAura(SPELL_TOWER_CONTROL)
	end
end
end
end

function WGUpdate()
if(timer_nextbattle <= os.time() and timer_battle == 0)then
	timer_battle = os.time() + BATTLE_TIMER
	timer_nextbattle = 0
	battle = 1
	stateuiset = 0
	states = 0
	add_tokens = 0
	starttimer = os.time()
	if(controll == 1)then
		eastspark_progress = 0
		westspark_progress = 0
	elseif(controll == 2)then
		eastspark_progress = 100
		westspark_progress = 100
	end
	for k,v in pairs(GetPlayersInZone(ZONE_WG))do
	v:SendAreaTriggerMessage("Let the battle begin!")
	local packetssound = LuaPacket:CreatePacket(SMSG_PLAY_SOUND, 4)
	packetssound:WriteULong(3439)
	v:SendPacketToPlayer(packetssound)
	end
elseif(timer_nextbattle == 0 and timer_battle <= os.time())then
	timer_battle = 0
	timer_nextbattle = os.time() + TIME_TO_BATTLE
	battle = 0
	stateuiset = 0
	states = 0
	starttimer = 0
	south_towers = 3
	for k,v in pairs(GetPlayersInZone(ZONE_WG))do
	local packetseound = LuaPacket:CreatePacket(SMSG_PLAY_SOUND, 4)
	if(controll == 1)then
		packetseound:WriteULong(8455)
		v:SendPacketToPlayer(packetseound)
		v:SendAreaTriggerMessage("The Alliance has successfully defended the Wintergrasp fortress!")
	elseif(controll == 2)then
		packetseound:WriteULong(8454)
		v:SendPacketToPlayer(packetseound)
		v:SendAreaTriggerMessage("The Horde has successfully defended the Wintergrasp fortress!")
	end
	end
end
for k,v in pairs(GetPlayersInMap(MAP_NORTHREND))do
if(v:GetZoneId() == ZONE_WG or v:GetAreaId() == ZONE_WG)then
if(south_towers == 0)then
	timer_battle = timer_battle - 600 -- if all southen towers are destroyed, the attackers loose 10 min.
	v:SetWorldStateForZone(WG_STATE_BATTLE_TIME, timer_battle)
	south_towers = -1
end
	if(v:IsPvPFlagged() ~= true)then
		v:FlagPvP()
	end
	if(battle == 1)then
		if(v:HasAura(SPELL_RECRUIT) == false)then
			if(v:HasAura(SPELL_CORPORAL) == false)then
				if(v:HasAura(SPELL_LIEUTENANT) == false)then
					v:AddAura(SPELL_RECRUIT,0)
				end
			end
		end
	elseif(battle == 0)then
		if(v:HasAura(SPELL_RECRUIT))then
			v:RemoveAura(SPELL_RECRUIT)
		end
		if(v:HasAura(SPELL_CORPORAL))then
			v:RemoveAura(SPELL_CORPORAL)
		end
		if(v:HasAura(SPELL_LIEUTENANT))then
			v:RemoveAura(SPELL_LIEUTENANT)
		end
	end
	if(controll == 1 and battle == 0 and add_tokens == 0)then
			if(v:GetTeam() == 0)then
				v:CastSpell(SPELL_VICTORY_REWARD)
				v:CastSpell(SPELL_VICTORY_AURA)
				if(v:HasQuest(QUEST_WG_VICTORY_A) and v:GetQuestObjectiveCompletion(QUEST_WG_VICTORY_A, 0) == 0)then
					v:AdvanceQuestObjective(QUEST_WG_VICTORY_A, 0)
				end
			elseif(v:GetTeam() == 1)then
				v:CastSpell(SPELL_DEFEAT_REWARD)
			end
			add_tokens = 1
	end
	if(controll == 2 and battle == 0 and add_tokens == 0)then
			if(v:GetTeam() == 1)then
				v:CastSpell(SPELL_VICTORY_REWARD)
				v:CastSpell(SPELL_VICTORY_AURA)
				if(v:HasQuest(QUEST_WG_VICTORY_H) and v:GetQuestObjectiveCompletion(QUEST_WG_VICTORY_H, 0) == 0)then
					v:AdvanceQuestObjective(QUEST_WG_VICTORY_H, 0)
				end
			elseif(v:GetTeam() == 0)then
				v:CastSpell(SPELL_DEFEAT_REWARD)
			end
			add_tokens = 1
	end
if(v:GetAreaId() == AREA_FORTRESS or v:GetAreaId() == AREA_FLAMEWATCH_T or v:GetAreaId() == AREA_WINTERSEDGE_T or v:GetAreaId() == AREA_SHADOWSIGHT_T or v:GetAreaId() == AREA_C_BRIDGE or v:GetAreaId() == AREA_W_BRIDGE or v:GetAreaId() == AREA_E_BRIDGE or v:GetAreaId() == ZONE_WG)then
	if(controll == 1)then
		if(v:HasAura(SPELL_HORDE_CONTROL_PHASE_SHIFT))then
			v:RemoveAura(SPELL_HORDE_CONTROL_PHASE_SHIFT)
		end
		v:CastSpell(SPELL_ALLIANCE_CONTROL_PHASE_SHIFT)
	elseif(controll == 2)then
		if(v:HasAura(SPELL_ALLIANCE_CONTROL_PHASE_SHIFT))then
			v:RemoveAura(SPELL_ALLIANCE_CONTROL_PHASE_SHIFT)
		end
		v:CastSpell(SPELL_HORDE_CONTROL_PHASE_SHIFT)
	end
elseif(v:GetAreaId() ~= AREA_FORTRESS and v:GetAreaId() ~= AREA_FLAMEWATCH_T and v:GetAreaId() ~= AREA_WINTERSEDGE_T and v:GetAreaId() ~= AREA_SHADOWSIGHT_T and v:GetAreaId() ~= AREA_C_BRIDGE and v:GetAreaId() ~= AREA_W_BRIDGE and v:GetAreaId() ~= AREA_E_BRIDGE and v:GetAreaId() ~= ZONE_WG)then
	if(v:HasAura(SPELL_HORDE_CONTROL_PHASE_SHIFT))then
		v:RemoveAura(SPELL_HORDE_CONTROL_PHASE_SHIFT)
	end
	if(v:HasAura(SPELL_ALLIANCE_CONTROL_PHASE_SHIFT))then
		v:RemoveAura(SPELL_ALLIANCE_CONTROL_PHASE_SHIFT)
	end
end
if(stateuiset == 0)then
	if(battle == 1)then
		v:SetWorldStateForZone(WG_HORDE_CONTROLLED, 0)
		v:SetWorldStateForZone(WG_ALLIANCE_CONTROLLED, 0)
		v:SetWorldStateForZone(WG_STATE_BATTLE_UI, 1)
		v:SetWorldStateForZone(WG_STATE_BATTLE_TIME, timer_battle)
		v:SetWorldStateForZone(WG_STATE_NEXT_BATTLE_TIMER, 0)
		v:SetWorldStateForZone(WG_STATE_NEXT_BATTLE_TIME, 0)
		stateuiset = 1
	elseif(battle == 0 and controll == 1)then
		v:SetWorldStateForZone(WG_STATE_NEXT_BATTLE_TIMER, 1)
		v:SetWorldStateForZone(WG_ALLIANCE_CONTROLLED, 1)
		v:SetWorldStateForZone(WG_STATE_BATTLE_UI, 0)
		v:SetWorldStateForZone(WG_STATE_BATTLE_TIME, 0)
		v:SetWorldStateForZone(WG_STATE_NEXT_BATTLE_TIME, timer_nextbattle)
		stateuiset = 1
	elseif(battle == 0 and controll == 2)then
		v:SetWorldStateForZone(WG_STATE_NEXT_BATTLE_TIMER, 1)
		v:SetWorldStateForZone(WG_HORDE_CONTROLLED, 1)
		v:SetWorldStateForZone(WG_STATE_BATTLE_UI, 0)
		v:SetWorldStateForZone(WG_STATE_BATTLE_TIME, 0)
		v:SetWorldStateForZone(WG_STATE_NEXT_BATTLE_TIME, timer_nextbattle)
		stateuiset = 1
	end
end
if(controll == 1)then
	if(states == 0)then
		v:SetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP, 7)
		v:SetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP, 7)
		v:SetWorldStateForZone(WG_STATE_SS_TOWER, 4)
		v:SetWorldStateForZone(WG_STATE_WE_TOWER, 4)
		v:SetWorldStateForZone(WG_STATE_FW_TOWER, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_NW_TOWER, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_NE_TOWER, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_SW_TOWER, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_SE_TOWER, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_1, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_2, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_3, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_4, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_5, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_6, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_7, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_8, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_9, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_10, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_11, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_12, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_13, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_14, 7)
		v:SetWorldStateForZone(WG_STATE_MAIN_GATE, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_15, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_16, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_17, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_18, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_19, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_20, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_21, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_22, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_23, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY, 7)
		v:SetWorldStateForZone(WG_STATE_WS_WORKSHOP, 4)
		v:SetWorldStateForZone(WG_STATE_ES_WORKSHOP, 4)
		v:SetWorldStateForZone(WG_STATE_BT_WORKSHOP, 4)
		v:SetWorldStateForZone(WG_STATE_SR_WORKSHOP, 4)
		eastspark_progress =  0
		westspark_progress =  0
		sunkenring_progress = 0
		brokentemple_progres = 0
		states = 1
		ATTACKER = "Horde"
		DEFENDER = "Alliance"
	end
elseif(controll == 2)then
	if(states == 0)then
		v:SetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP, 4)
		v:SetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP, 4)
		v:SetWorldStateForZone(WG_STATE_SS_TOWER, 7)
		v:SetWorldStateForZone(WG_STATE_WE_TOWER, 7)
		v:SetWorldStateForZone(WG_STATE_FW_TOWER, 7)
		v:SetWorldStateForZone(WG_STATE_KEEP_NW_TOWER, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_NE_TOWER, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_SW_TOWER, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_SE_TOWER, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_1, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_2, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_3, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_4, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_5, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_6, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_7, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_8, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_9, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_10, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_11, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_12, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_13, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_14, 4)
		v:SetWorldStateForZone(WG_STATE_MAIN_GATE, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_15, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_16, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_17, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_18, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_19, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_20, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_21, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_22, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_WALL_23, 4)
		v:SetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY, 4)
		v:SetWorldStateForZone(WG_STATE_WS_WORKSHOP, 7)
		v:SetWorldStateForZone(WG_STATE_ES_WORKSHOP, 7)
		v:SetWorldStateForZone(WG_STATE_BT_WORKSHOP, 7)
		v:SetWorldStateForZone(WG_STATE_SR_WORKSHOP, 7)
		eastspark_progress = 100
		westspark_progress = 100
		sunkenring_progress = 100
		brokentemple_progres = 100
		states = 1
		ATTACKER = "Alliance"
		DEFENDER = "Horde"
	end
end
end
end
end

function DetectionUnitOnSpawn(pUnit, event)
if(pUnit:GetMapId() == MAP_NORTHREND)then
	pUnit:RegisterAIUpdateEvent(1000)
end
end

function DetectionUnitAIUpdate(pUnit)
if(pUnit == nil)then
	pUnit:RemoveAIUpdateEvent()
end
if(pUnit:GetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY) == 0 or pUnit:GetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY) == 1)then
	if(npcstarted == false)then
		stateuiset = 0
		states = 0
		npcstarted = true
	end
else
	npcstarted = true
end
for k,m in pairs(GetPlayersInZone(ZONE_WG))do
	if(m:HasAura(SPELL_VICTORY_AURA))then
		if(m:HasAchievement(ACHIEVEMENT_VICTORY) == false)then
			m:AddAchievement(ACHIEVEMENT_VICTORY)
		end
		m:RemoveAura(SPELL_VICTORY_AURA)
	end
end
if(spawnobjects == 0 and battle == 1)then
	PerformIngameSpawn(2,GO_WINTERGRASP_TITAN_RELIC,MAP_NORTHREND,5439.66,2840.83,430.282,6.20393,100,2300000)
	PerformIngameSpawn(2,GO_WINTERGRASP_KEEP_COLLISION_WALL,MAP_NORTHREND,5397.11,2841.54,425.901,3.14159,100,2300000)
	spawnobjects = 1
end
if(battle == 0 and spawnobjects == 1)then
	spawnobjects = 0
	local relick = pUnit:GetGameObjectNearestCoords(5439.66,2840.83,430.282,GO_WINTERGRASP_TITAN_RELIC)
	local collision = pUnit:GetGameObjectNearestCoords(5397.11,2841.54,425.901,GO_WINTERGRASP_KEEP_COLLISION_WALL)
	if(relick ~= nil)then
		relick:Despawn(1,0)
	end
	if(collision ~= nil)then
		collision:Despawn(1,0)
	end
end
if(pUnit:GetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP) == 4)then
	A_V_FORTRESS_WEST = 0
	H_V_FORTRESS_WEST = 4
elseif(pUnit:GetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP) == 5)then
	A_V_FORTRESS_WEST = 0
	H_V_FORTRESS_WEST = 2
elseif(pUnit:GetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP) == 0 or pUnit:GetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP) == 1 or pUnit:GetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP) == 2 or pUnit:GetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP) == 3 or pUnit:GetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP) == 6 or pUnit:GetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP) == 9)then
	A_V_FORTRESS_WEST = 0
	H_V_FORTRESS_WEST = 0
elseif(pUnit:GetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP) == 7)then
	A_V_FORTRESS_WEST = 4
	H_V_FORTRESS_WEST = 0
elseif(pUnit:GetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP) == 8)then
	A_V_FORTRESS_WEST = 2
	H_V_FORTRESS_WEST = 0
end
if(pUnit:GetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP) == 4)then
	A_V_FORTRESS_EAST = 0
	H_V_FORTRESS_EAST = 4
elseif(pUnit:GetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP) == 5)then
	A_V_FORTRESS_EAST = 0
	H_V_FORTRESS_EAST = 2
elseif(pUnit:GetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP) == 0 or pUnit:GetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP) == 1 or pUnit:GetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP) == 2 or pUnit:GetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP) == 3 or pUnit:GetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP) == 6 or pUnit:GetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP) == 9)then
	A_V_FORTRESS_EAST = 0
	H_V_FORTRESS_EAST = 0
elseif(pUnit:GetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP) == 7)then
	A_V_FORTRESS_EAST = 4
	H_V_FORTRESS_EAST = 0
elseif(pUnit:GetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP) == 8)then
	A_V_FORTRESS_EAST = 2
	H_V_FORTRESS_EAST = 0
end
if(pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) == 4)then
	A_V_BROKENTEMPLE = 0
	H_V_BROKENTEMPLE = 4
elseif(pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) == 5)then
	A_V_BROKENTEMPLE = 0
	H_V_BROKENTEMPLE = 2
elseif(pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) == 0 or pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) == 1 or pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) == 2 or pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) == 3 or pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) == 6 or pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) == 9)then
	A_V_BROKENTEMPLE = 0
	H_V_BROKENTEMPLE = 0
elseif(pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) == 7)then
	A_V_BROKENTEMPLE = 4
	H_V_BROKENTEMPLE = 0
elseif(pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) == 8)then
	A_V_BROKENTEMPLE = 2
	H_V_BROKENTEMPLE = 0
end
if(pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) == 4)then
	A_V_SUNKENRING = 0
	H_V_SUNKENRING = 4
elseif(pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) == 5)then
	A_V_SUNKENRING = 0
	H_V_SUNKENRING = 2
elseif(pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) == 0 or pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) == 1 or pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) == 2 or pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) == 3 or pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) == 6 or pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) == 9)then
	A_V_SUNKENRING = 0
	H_V_SUNKENRING = 0
elseif(pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) == 7)then
	A_V_SUNKENRING = 4
	H_V_SUNKENRING = 0
elseif(pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) == 8)then
	A_V_SUNKENRING = 2
	H_V_SUNKENRING = 0
end
if(pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) == 4)then
	A_V_WESTSPARK = 0
	H_V_WESTSPARK = 4
elseif(pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) == 5)then
	A_V_WESTSPARK = 0
	H_V_WESTSPARK = 2
elseif(pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) == 0 or pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) == 1 or pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) == 2 or pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) == 3 or pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) == 6 or pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) == 9)then
	A_V_WESTSPARK = 0
	H_V_WESTSPARK = 0
elseif(pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) == 7)then
	A_V_WESTSPARK = 4
	H_V_WESTSPARK = 0
elseif(pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) == 8)then
	A_V_WESTSPARK = 2
	H_V_WESTSPARK = 0
end
if(pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) == 4)then
	A_V_EASTSPARK = 0
	H_V_EASTSPARK = 4
elseif(pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) == 5)then
	A_V_EASTSPARK = 0
	H_V_EASTSPARK = 2
elseif(pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) == 0 or pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) == 1 or pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) == 2 or pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) == 3 or pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) == 6 or pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) == 9)then
	A_V_EASTSPARK = 0
	H_V_EASTSPARK = 0
elseif(pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) == 7)then
	A_V_EASTSPARK = 4
	H_V_EASTSPARK = 0
elseif(pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) == 8)then
	A_V_EASTSPARK = 2
	H_V_EASTSPARK = 0
end
local alliancevehicles = A_V_EASTSPARK + A_V_WESTSPARK + A_V_SUNKENRING + A_V_BROKENTEMPLE + A_V_FORTRESS_EAST + A_V_FORTRESS_WEST
local hordevehicles = H_V_EASTSPARK + H_V_WESTSPARK + H_V_SUNKENRING + H_V_BROKENTEMPLE + H_V_FORTRESS_EAST + H_V_FORTRESS_WEST
pUnit:SetWorldStateForZone(WG_STATE_MAX_A_VEHICLES, alliancevehicles)
pUnit:SetWorldStateForZone(WG_STATE_MAX_H_VEHICLES, hordevehicles)
for k,v in pairs(pUnit:GetInRangeObjects())do
if(v:GetHP() ~= nil)then -- filter all non destructable objects.
	if(battle == 0 and v:GetHP() < v:GetMaxHP())then -- rebuild all if there is no battle and anything is damaged.
		v:Rebuild()
	end
	if(v:GetEntry() == GO_WINTERGRASP_FORTRESS_GATE)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_MAIN_GATE) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_MAIN_GATE, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_MAIN_GATE) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_MAIN_GATE, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_MAIN_GATE) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_MAIN_GATE, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_MAIN_GATE) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_MAIN_GATE, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_MAIN_GATE) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_MAIN_GATE, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_MAIN_GATE) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_MAIN_GATE, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_VAULT_GATE)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY, 6)
			for k,m in pairs(v:GetInRangeObjects())do
				if(m:GetEntry() == GO_WINTERGRASP_KEEP_COLLISION_WALL)then
					m:Activate()
				end
			end
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY, 9)
			for k,m in pairs(v:GetInRangeObjects())do
				if(m:GetEntry() == GO_WINTERGRASP_KEEP_COLLISION_WALL)then
					m:Activate()
				end
			end
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_SE_TOWER)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_SE_TOWER) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_SE_TOWER, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_SE_TOWER) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_SE_TOWER, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_SE_TOWER) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_SE_TOWER, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_SE_TOWER) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_SE_TOWER, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_SE_TOWER) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_SE_TOWER, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_SE_TOWER) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_SE_TOWER, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_SW_TOWER)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_SW_TOWER) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_SW_TOWER, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_SW_TOWER) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_SW_TOWER, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_SW_TOWER) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_SW_TOWER, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_SW_TOWER) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_SW_TOWER, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_SW_TOWER) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_SW_TOWER, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_SW_TOWER) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_SW_TOWER, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_NW_TOWER)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_NW_TOWER) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_NW_TOWER, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_NW_TOWER) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_NW_TOWER, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_NW_TOWER) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_NW_TOWER, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_NW_TOWER) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_NW_TOWER, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_NW_TOWER) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_NW_TOWER, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_NW_TOWER) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_NW_TOWER, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_NE_TOWER)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_NE_TOWER) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_NE_TOWER, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_NE_TOWER) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_NE_TOWER, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_NE_TOWER) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_NE_TOWER, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_NE_TOWER) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_NE_TOWER, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_NE_TOWER) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_NE_TOWER, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_NE_TOWER) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_NE_TOWER, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_1)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_1) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_1, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_1) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_1, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_1) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_1, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_1) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_1, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_1) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_1, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_1) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_1, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_2)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_2) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_2, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_2) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_2, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_2) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_2, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_2) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_2, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_2) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_2, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_2) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_2, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_3)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_3) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_3, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_3) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_3, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_3) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_3, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_3) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_3, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_3) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_3, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_3) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_3, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_4)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_4) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_4, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_4) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_4, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_4) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_4, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_4) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_4, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_4) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_4, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_4) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_4, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_5)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_5) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_5, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_5) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_5, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_5) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_5, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_5) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_5, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_5) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_5, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_5) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_5, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_6)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_6) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_6, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_6) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_6, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_6) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_6, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_6) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_6, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_6) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_6, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_6) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_6, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_7)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_7) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_7, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_7) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_7, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_7) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_7, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_7) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_7, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_7) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_7, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_7) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_7, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_8)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_8) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_8, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_8) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_8, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_8) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_8, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_8) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_8, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_8) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_8, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_8) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_8, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_9)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_9) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_9, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_9) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_9, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_9) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_9, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_9) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_9, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_9) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_9, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_9) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_9, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_10)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_10) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_10, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_10) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_10, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_10) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_10, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_10) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_10, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_10) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_10, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_10) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_10, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_11)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_11) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_11, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_11) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_11, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_11) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_11, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_11) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_11, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_11) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_11, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_11) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_11, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_12)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_12) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_12, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_12) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_12, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_12) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_12, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_12) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_12, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_12) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_12, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_12) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_12, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_13)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_13) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_13, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_13) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_13, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_13) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_13, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_13) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_13, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_13) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_13, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_13) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_13, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_14)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_14) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_14, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_14) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_14, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_14) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_14, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_14) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_14, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_14) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_14, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_14) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_14, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_15)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_15) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_15, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_15) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_15, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_15) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_15, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_15) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_15, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_15) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_15, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_15) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_15, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_16)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_16) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_16, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_16) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_16, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_16) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_16, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_16) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_16, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_16) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_16, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_16) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_16, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_17)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_17) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_17, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_17) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_17, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_17) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_17, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_17) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_17, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_17) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_17, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_17) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_17, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_18)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_18) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_18, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_18) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_18, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_18) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_18, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_18) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_18, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_18) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_18, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_18) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_18, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_19)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_19) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_19, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_19) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_19, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_19) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_19, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_19) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_19, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_19) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_19, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_19) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_19, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_20)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_20) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_20, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_20) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_20, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_20) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_20, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_20) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_20, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_20) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_20, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_20) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_20, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_21)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_21) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_21, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_21) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_21, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_21) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_21, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_21) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_21, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_21) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_21, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_21) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_21, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_22)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_22) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_22, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_22) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_22, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_22) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_22, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_22) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_22, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_22) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_22, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_22) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_22, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_KEEP_WALL_23)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_23) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_23, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_23) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_23, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_23) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_23, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_23) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_23, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_23) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_23, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_KEEP_WALL_23) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_KEEP_WALL_23, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_WORKSHOP_E)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_E_FORTRESS_WORKSHOP, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_WORKSHOP_W)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP, 7)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP, 6)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_W_FORTRESS_WORKSHOP, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_FW_TOWER)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_FW_TOWER) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_FW_TOWER, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_FW_TOWER) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_FW_TOWER, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_FW_TOWER) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_FW_TOWER, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_FW_TOWER) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_FW_TOWER, 7)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_FW_TOWER) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_FW_TOWER, 6)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_FW_TOWER) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_FW_TOWER, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_WE_TOWER)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_WE_TOWER) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_WE_TOWER, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_WE_TOWER) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_WE_TOWER, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_WE_TOWER) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_WE_TOWER, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_WE_TOWER) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_WE_TOWER, 7)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_WE_TOWER) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_WE_TOWER, 6)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_WE_TOWER) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_WE_TOWER, 9)
		end
	elseif(v:GetEntry() == GO_WINTERGRASP_SS_TOWER)then
		if(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_SS_TOWER) ~= 5)then
			v:SetWorldStateForZone(WG_STATE_SS_TOWER, 5)
		elseif(v:GetHP() <= v:GetMaxHP()/2 and v:GetHP() > 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_SS_TOWER) ~= 8)then
			v:SetWorldStateForZone(WG_STATE_SS_TOWER, 8)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 1 and v:GetWorldStateForZone(WG_STATE_SS_TOWER) ~= 4)then
			v:SetWorldStateForZone(WG_STATE_SS_TOWER, 4)
		elseif(v:GetHP() > v:GetMaxHP()/2 and controll == 2 and v:GetWorldStateForZone(WG_STATE_SS_TOWER) ~= 7)then
			v:SetWorldStateForZone(WG_STATE_SS_TOWER, 7)
		elseif(v:GetHP() == 0 and controll == 1 and v:GetWorldStateForZone(WG_STATE_SS_TOWER) ~= 6)then
			v:SetWorldStateForZone(WG_STATE_SS_TOWER, 6)
		elseif(v:GetHP() == 0 and controll == 2 and v:GetWorldStateForZone(WG_STATE_SS_TOWER) ~= 9)then
			v:SetWorldStateForZone(WG_STATE_SS_TOWER, 9)
		end
	end
	if(v:GetUInt32Value(GAMEOBJECT_FACTION) ~= FACTION_HORDE and battle == 1 and controll == 2 and v:GetAreaId() == AREA_FORTRESS)then -- this changes the faction of the objects but for some reason they can not be damaged as they should by the vehicles.
		v:SetUInt32Value(GAMEOBJECT_FACTION,FACTION_HORDE)
	elseif(battle == 1 and v:GetUInt32Value(GAMEOBJECT_FACTION) ~= FACTION_NEUTRAL)then
		v:SetUInt32Value(GAMEOBJECT_FACTION,FACTION_NEUTRAL)
	elseif(v:GetUInt32Value(GAMEOBJECT_FACTION) ~= FACTION_ALLIANCE and battle == 1 and controll == 1 and v:GetAreaId() == AREA_FORTRESS)then
		v:SetUInt32Value(GAMEOBJECT_FACTION,FACTION_ALLIANCE)
	elseif((v:GetAreaId() == AREA_FLAMEWATCH_T or v:GetAreaId() == AREA_WINTERSEDGE_T or v:GetAreaId() == AREA_SHADOWSIGHT_T))then
		if(battle == 1 and controll == 2 and v:GetUInt32Value(GAMEOBJECT_FACTION) ~= FACTION_ALLIANCE)then
			v:SetUInt32Value(GAMEOBJECT_FACTION,FACTION_ALLIANCE)
		elseif(battle == 1 and controll == 1 and v:GetUInt32Value(GAMEOBJECT_FACTION) ~= FACTION_HORDE)then
			v:SetUInt32Value(GAMEOBJECT_FACTION,FACTION_HORDE)
		elseif(battle == 0 and v:GetUInt32Value(GAMEOBJECT_FACTION) ~= FACTION_NEUTRAL)then
			v:SetUInt32Value(GAMEOBJECT_FACTION,FACTION_NEUTRAL)
		end
	end
end
end
if(pUnit:GetEntry() == NPC_NOT_IMMUNE_PC_NPC)then
local XT = pUnit:GetX()
local YT = pUnit:GetY()
	if(XT >= 5245.92 and XT <= 5247.92 and YT >= 2977.32 and YT <= 2979.32)then
		pUnit:TeleportCreature(5316.25,2977.04,409.274)
	elseif(XT >= 5248.89 and XT <= 5250.89 and YT >= 2702.11 and YT <= 2704.11)then
		pUnit:TeleportCreature(5314.51,2703.11,409.275)
	elseif(XT >= 5400.92 and XT <= 5402.92 and YT >= 2828.91 and YT <= 2830.91)then
		pUnit:TeleportCreature(5391.28,2828.09,418.675)
	elseif(XT >= 5391.81 and XT <= 5393.81 and YT >= 2853.02 and YT <= 2855.02)then
		pUnit:TeleportCreature(5401.63,2853.67,418.675)
	end
end
if(C_BAR_CAPTURE >= 1 and battle == 1)then
	if(pUnit:GetAreaId() == AREA_EASTSPARK)then
	local esshop = pUnit:GetGameObjectNearestCoords(pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),GO_WINTERGRASP_WORKSHOP_ES)
	if(esshop ~= nil)then
		if(esshop:GetHP() ~= nil)then
			if(esshop:GetHP() > esshop:GetMaxHP()/2)then
				if(eastspark_progress > C_BAR_CAPTURE + C_BAR_NEUTRAL and pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) ~= 7)then
					pUnit:SetWorldStateForZone(WG_STATE_ES_WORKSHOP,7)
				elseif(eastspark_progress < C_BAR_CAPTURE + C_BAR_NEUTRAL and eastspark_progress > C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) ~= 1)then
					pUnit:SetWorldStateForZone(WG_STATE_ES_WORKSHOP,1)
				elseif(eastspark_progress < C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) ~= 4)then
					pUnit:SetWorldStateForZone(WG_STATE_ES_WORKSHOP,4)
				end
			elseif(esshop:GetHP() < esshop:GetMaxHP()/2 and esshop:GetHP() > 0)then
				if(eastspark_progress > C_BAR_CAPTURE + C_BAR_NEUTRAL  and pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) ~= 8)then
					pUnit:SetWorldStateForZone(WG_STATE_ES_WORKSHOP,8)
				elseif(eastspark_progress < C_BAR_CAPTURE + C_BAR_NEUTRAL and eastspark_progress > C_BAR_CAPTURE  and pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) ~= 2)then
					pUnit:SetWorldStateForZone(WG_STATE_ES_WORKSHOP,2)
				elseif(eastspark_progress < C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) ~= 5)then
					pUnit:SetWorldStateForZone(WG_STATE_ES_WORKSHOP,5)
				end
			elseif(esshop:GetHP() == 0)then
				if(eastspark_progress > C_BAR_CAPTURE + C_BAR_NEUTRAL and pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) ~= 9)then
					pUnit:SetWorldStateForZone(WG_STATE_ES_WORKSHOP,9)
				elseif(eastspark_progress < C_BAR_CAPTURE + C_BAR_NEUTRAL and eastspark_progress > C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) ~= 3)then
					pUnit:SetWorldStateForZone(WG_STATE_ES_WORKSHOP,3)
				elseif(eastspark_progress < C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_ES_WORKSHOP) ~= 6)then
					pUnit:SetWorldStateForZone(WG_STATE_ES_WORKSHOP,6)
				end
			end
		end
	end
	elseif(pUnit:GetAreaId() == AREA_WESTSPARK)then
	local wsshop = pUnit:GetGameObjectNearestCoords(pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),GO_WINTERGRASP_WORKSHOP_WS)
	if(wsshop ~= nil)then
		if(wsshop:GetHP() ~= nil)then
			if(wsshop:GetHP() > wsshop:GetMaxHP()/2)then
				if(westspark_progress > C_BAR_CAPTURE + C_BAR_NEUTRAL and pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) ~= 7)then
					pUnit:SetWorldStateForZone(WG_STATE_WS_WORKSHOP,7)
				elseif(westspark_progress < C_BAR_CAPTURE + C_BAR_NEUTRAL and westspark_progress > C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) ~= 1)then
					pUnit:SetWorldStateForZone(WG_STATE_WS_WORKSHOP,1)
				elseif(westspark_progress < C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) ~= 4)then
					pUnit:SetWorldStateForZone(WG_STATE_WS_WORKSHOP,4)
				end
			elseif(wsshop:GetHP() < wsshop:GetMaxHP()/2 and wsshop:GetHP() > 0)then
				if(westspark_progress > C_BAR_CAPTURE + C_BAR_NEUTRAL and pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) ~= 8)then
					pUnit:SetWorldStateForZone(WG_STATE_WS_WORKSHOP,8)
				elseif(westspark_progress < C_BAR_CAPTURE + C_BAR_NEUTRAL and westspark_progress > C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) ~= 2)then
					pUnit:SetWorldStateForZone(WG_STATE_WS_WORKSHOP,2)
				elseif(westspark_progress < C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) ~= 5)then
					pUnit:SetWorldStateForZone(WG_STATE_WS_WORKSHOP,5)
				end
			elseif(wsshop:GetHP() == 0)then
				if(westspark_progress > C_BAR_CAPTURE + C_BAR_NEUTRAL and pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) ~= 9)then
					pUnit:SetWorldStateForZone(WG_STATE_WS_WORKSHOP,9)
				elseif(westspark_progress < C_BAR_CAPTURE + C_BAR_NEUTRAL and westspark_progress > C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) ~= 3)then
					pUnit:SetWorldStateForZone(WG_STATE_WS_WORKSHOP,3)
				elseif(westspark_progress < C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_WS_WORKSHOP) ~= 6)then
					pUnit:SetWorldStateForZone(WG_STATE_WS_WORKSHOP,6)
				end
			end
		end
	end
	elseif(pUnit:GetAreaId() == AREA_SUNKENRING)then
	local srshop = pUnit:GetGameObjectNearestCoords(pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),GO_WINTERGRASP_WORKSHOP_SR)
	if(srshop ~= nil)then
		if(srshop:GetHP() ~= nil)then
			if(srshop:GetHP() > srshop:GetMaxHP()/2)then
				if(sunkenring_progress > C_BAR_CAPTURE + C_BAR_NEUTRAL and pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) ~= 7)then
					pUnit:SetWorldStateForZone(WG_STATE_SR_WORKSHOP,7)
				elseif(sunkenring_progress < C_BAR_CAPTURE + C_BAR_NEUTRAL and sunkenring_progress > C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) ~= 1)then
					pUnit:SetWorldStateForZone(WG_STATE_SR_WORKSHOP,1)
				elseif(sunkenring_progress < C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) ~= 4)then
					pUnit:SetWorldStateForZone(WG_STATE_SR_WORKSHOP,4)
				end
			elseif(srshop:GetHP() < srshop:GetMaxHP()/2 and srshop:GetHP() > 0)then
				if(sunkenring_progress > C_BAR_CAPTURE + C_BAR_NEUTRAL and pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) ~= 8)then
					pUnit:SetWorldStateForZone(WG_STATE_SR_WORKSHOP,8)
				elseif(sunkenring_progress < C_BAR_CAPTURE + C_BAR_NEUTRAL and sunkenring_progress > C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) ~= 2)then
					pUnit:SetWorldStateForZone(WG_STATE_SR_WORKSHOP,2)
				elseif(sunkenring_progress < C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) ~= 5)then
					pUnit:SetWorldStateForZone(WG_STATE_SR_WORKSHOP,5)
				end
			elseif(srshop:GetHP() == 0)then
				if(sunkenring_progress > C_BAR_CAPTURE + C_BAR_NEUTRAL and pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) ~= 9)then
					pUnit:SetWorldStateForZone(WG_STATE_SR_WORKSHOP,9)
				elseif(sunkenring_progress < C_BAR_CAPTURE + C_BAR_NEUTRAL and sunkenring_progress > C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) ~= 3)then
					pUnit:SetWorldStateForZone(WG_STATE_SR_WORKSHOP,3)
				elseif(sunkenring_progress < C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_SR_WORKSHOP) ~= 6)then
					pUnit:SetWorldStateForZone(WG_STATE_SR_WORKSHOP,6)
				end
			end
		end
	end
	elseif(pUnit:GetAreaId() == AREA_BROKENTEMPLE)then
	local srshop = pUnit:GetGameObjectNearestCoords(pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),GO_WINTERGRASP_WORKSHOP_BT)
	if(srshop ~= nil)then
		if(srshop:GetHP() ~= nil)then
			if(srshop:GetHP() > srshop:GetMaxHP()/2)then
				if(brokentemple_progres > C_BAR_CAPTURE + C_BAR_NEUTRAL and pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) ~= 7)then
					pUnit:SetWorldStateForZone(WG_STATE_BT_WORKSHOP,7)
				elseif(brokentemple_progres < C_BAR_CAPTURE + C_BAR_NEUTRAL and brokentemple_progres > C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) ~= 1)then
					pUnit:SetWorldStateForZone(WG_STATE_BT_WORKSHOP,1)
				elseif(brokentemple_progres < C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) ~= 4)then
					pUnit:SetWorldStateForZone(WG_STATE_BT_WORKSHOP,4)
				end
			elseif(srshop:GetHP() < srshop:GetMaxHP()/2 and srshop:GetHP() > 0)then
				if(brokentemple_progres > C_BAR_CAPTURE + C_BAR_NEUTRAL and pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) ~= 8)then
					pUnit:SetWorldStateForZone(WG_STATE_BT_WORKSHOP,8)
				elseif(brokentemple_progres < C_BAR_CAPTURE + C_BAR_NEUTRAL and brokentemple_progres > C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) ~= 2)then
					pUnit:SetWorldStateForZone(WG_STATE_BT_WORKSHOP,2)
				elseif(brokentemple_progres < C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) ~= 5)then
					pUnit:SetWorldStateForZone(WG_STATE_BT_WORKSHOP,5)
				end
			elseif(srshop:GetHP() == 0)then
				if(brokentemple_progres > C_BAR_CAPTURE + C_BAR_NEUTRAL and pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) ~= 9)then
					pUnit:SetWorldStateForZone(WG_STATE_BT_WORKSHOP,9)
				elseif(brokentemple_progres < C_BAR_CAPTURE + C_BAR_NEUTRAL and brokentemple_progres > C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) ~= 3)then
					pUnit:SetWorldStateForZone(WG_STATE_BT_WORKSHOP,3)
				elseif(brokentemple_progres < C_BAR_CAPTURE and pUnit:GetWorldStateForZone(WG_STATE_BT_WORKSHOP) ~= 6)then
					pUnit:SetWorldStateForZone(WG_STATE_BT_WORKSHOP,6)
				end
			end
		end
	end
	end
end
end

function TitanRelickOnUse(pGO, event, pPlayer)
if(battle == 1)then
local timebattle = os.time() - starttimer
	if(controll == 1 and pPlayer:GetTeam() == 1 and pGO:GetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY) == 9)then
		timer_battle = 0
		timer_nextbattle = os.time() + TIME_TO_BATTLE
		battle = 0
		controll = 2
		states = 0
		pGO:Despawn(1,0)
		stateuiset = 0
		starttimer = 0
		south_towers = 3
		for k,v in pairs (GetPlayersInZone(ZONE_WG))do
		v:SendAreaTriggerMessage("The Wintergrasp fortress has been captured by the Horde!")
		local packetseound = LuaPacket:CreatePacket(SMSG_PLAY_SOUND, 4)
		packetseound:WriteULong(8454)
		v:SendPacketToPlayer(packetseound)
			if(v:GetTeam() == 1)then
				v:CastSpell(SPELL_VICTORY_REWARD)
				v:CastSpell(SPELL_VICTORY_AURA)
				if(timebattle <= 600)then
					if(v:HasAchievement(ACHIEVEMENT_WIN_OUR_GRASP) == false)then
						v:AddAchievement(ACHIEVEMENT_WIN_OUR_GRASP)
					end
				end
				if(v:HasQuest(QUEST_WG_VICTORY_H) and v:GetQuestObjectiveCompletion(QUEST_WG_VICTORY_H, 0) == 0)then
					v:AdvanceQuestObjective(QUEST_WG_VICTORY_H, 0)
				end
			elseif(v:GetTeam() == 0)then
				v:CastSpell(SPELL_DEFEAT_REWARD)
			end
		end
		end
	if(controll == 2 and pPlayer:GetTeam() == 0 and pGO:GetWorldStateForZone(WG_STATE_KEEP_GATE_ANDGY) == 6)then
		timer_battle = 0
		timer_nextbattle = os.time() + TIME_TO_BATTLE
		battle = 0
		controll = 1
		states = 0
		pGO:Despawn(1,0)
		stateuiset = 0
		starttimer = 0
		south_towers = 3
		for k,v in pairs (GetPlayersInZone(ZONE_WG))do
		v:SendAreaTriggerMessage("The Wintergrasp fortress has been captured by the Alliance!")
		local packetseound = LuaPacket:CreatePacket(SMSG_PLAY_SOUND, 4)
		packetseound:WriteULong(8455)
		v:SendPacketToPlayer(packetseound)
			if(v:GetTeam() == 0)then
				v:CastSpell(SPELL_VICTORY_REWARD)
				v:CastSpell(SPELL_VICTORY_AURA)
				if(timebattle <= 600)then
					if(v:HasAchievement(ACHIEVEMENT_WIN_OUR_GRASP) == false)then
						v:AddAchievement(ACHIEVEMENT_WIN_OUR_GRASP)
					end
				end
				if(v:HasQuest(QUEST_WG_VICTORY_A) and v:GetQuestObjectiveCompletion(QUEST_WG_VICTORY_A, 0) == 0)then
					v:AdvanceQuestObjective(QUEST_WG_VICTORY_A, 0)
				end
			elseif(v:GetTeam() == 1)then
				v:CastSpell(SPELL_DEFEAT_REWARD)
			end
		end
	end
end
end

function DebugWG(event, pPlayer, message, type, language)
if(pPlayer:IsGm() and pPlayer:GetZoneId() == ZONE_WG and battle == 0)then
	if(message == "#debug WG")then
		timer_nextbattle = os.time() + 10
		for k,v in pairs(GetPlayersInWorld())do
		v:SendBroadcastMessage("Wintergrasp battle starts after 10 sec. Battlefield started by GM "..pPlayer:GetName()..".|r")
		end
		pPlayer:SetWorldStateForZone(WG_STATE_NEXT_BATTLE_TIME, timer_nextbattle)
	end
end
end

function PortalOnUse(pGO, event, pPlayer)
if(pGO:GetMapId() == MAP_NORTHREND)then
	if(pPlayer:HasAura(SPELL_TELEPORT_DEFENDER) == false)then
		local teleportunit = pGO:GetCreatureNearestCoords(pGO:GetX(),pGO:GetY(),pGO:GetZ(),NPC_NOT_IMMUNE_PC_NPC)
		if(teleportunit ~= nil)then
			local xu,yu,zu,ou = teleportunit:GetSpawnLocation()
			pPlayer:Teleport(MAP_NORTHREND,xu,yu,zu,ou)
			pPlayer:CastSpell(SPELL_TELEPORT_DEFENDER)
		end
	else
		pPlayer:SendAreaTriggerMessage("You can't do that yet!")
	end
else
	pPlayer:CastSpell(54640)
end
end

function OnLoadVehicleTeleporter(pGO)
pGO:RegisterAIUpdateEvent(1000)
end

function OnAIUpdateVehicleTeleporter(pGO)
if(pGO == nil)then
	pGO:RemoveAIUpdateEvent()
end
for k,v in pairs(pGO:GetInRangeUnits()) do
if(v:IsCreature())then
	if(pGO:GetDistance(v) < 10 and battle == 1)then
		if((v:GetFaction() == FACTION_ALLIANCE and controll == 1) or (v:GetFaction() == FACTION_HORDE and controll == 2))then
			if(v:HasAura(SPELL_TELEPORT_VEHICLE) == false)then
				if(v:GetEntry() == NPC_VEHICLE_CATAPULT or v:GetEntry() == NPC_VEHICLE_DEMOLISHER or v:GetEntry() == NPC_VEHICLE_SIEGE_ENGINE_H or v:GetEntry() == NPC_VEHICLE_SIEGE_ENGINE_A)then
					local teleportunit = pGO:GetCreatureNearestCoords(pGO:GetX(),pGO:GetY(),pGO:GetZ(),NPC_NOT_IMMUNE_PC_NPC)
					if(teleportunit ~= nil)then
						local xu,yu,zu = teleportunit:GetSpawnLocation()
						v:TeleportCreature(xu,yu,zu)
						v:CastSpell(SPELL_TELEPORT_VEHICLE)
					end
				end
			end
		end
	end
end
end
end

function OnSP_Cpoint(pGO)
pGO:RegisterAIUpdateEvent(1500)
end

function AIUpdate_Cpoint(pGO)
if(battle == 1)then
ES_P = 0
WS_P = 0
SR_P = 0
BT_P = 0
if(pGO == nil)then
	pGO:RemoveAIUpdateEvent()
end
for k,m in pairs(pGO:GetInRangePlayers())do
if(battle == 1 and m:IsPvPFlagged() and m:IsStealthed() == false and m:IsAlive())then
	if(m:GetAreaId() == AREA_EASTSPARK and pGO:GetDistance(m) <= 5500)then
		ES_A = 0
		ES_H = 0
		if(m:GetTeam() == 0)then
			ES_A = ES_A + 1
		elseif(m:GetTeam() == 1)then
			ES_H = ES_H + 1
		end
		ES_P = ES_A - ES_H
		if(eastspark_progress < 100 and eastspark_progress > 0)then
			if(ES_P < 0)then
				eastspark_progress = eastspark_progress - 1
			elseif(ES_P > 0)then
				eastspark_progress = eastspark_progress + 1
			end
		elseif(eastspark_progress == 0)then
			if(ES_P > 0)then
				eastspark_progress = eastspark_progress + 1
			end
		elseif(eastspark_progress == 100)then
			if(ES_P < 0)then
				eastspark_progress = eastspark_progress - 1
			end
		end
		m:SetWorldStateForPlayer(WG_STATE_SOUTH_SHOW,1)
		m:SetWorldStateForPlayer(WG_STATE_SOUTH_PROGRESS,eastspark_progress)
		m:SetWorldStateForPlayer(WG_STATE_SOUTH_NEUTRAL,C_BAR_NEUTRAL)
	elseif(m:GetAreaId() == AREA_WESTSPARK and pGO:GetDistance(m) <= 5500)then
		WS_A = 0
		WS_H = 0
		if(m:GetTeam() == 0)then
			WS_A = WS_A + 1
		elseif(m:GetTeam() == 1)then
			WS_H = WS_H + 1
		end
		WS_P = WS_A - WS_H
		if(westspark_progress < 100 and westspark_progress > 0)then
			if(WS_P < 0)then
				westspark_progress = westspark_progress - 1
			elseif(WS_P > 0)then
				westspark_progress = westspark_progress + 1
			end
		elseif(westspark_progress == 0)then
			if(WS_P > 0)then
				westspark_progress = westspark_progress + 1
			end
		elseif(westspark_progress == 100)then
			if(WS_P < 0)then
				westspark_progress = westspark_progress - 1
			end
		end
		m:SetWorldStateForPlayer(WG_STATE_SOUTH_SHOW,1)
		m:SetWorldStateForPlayer(WG_STATE_SOUTH_PROGRESS,westspark_progress)
		m:SetWorldStateForPlayer(WG_STATE_SOUTH_NEUTRAL,C_BAR_NEUTRAL)
	else
		m:SetWorldStateForPlayer(WG_STATE_SOUTH_SHOW,0)
		m:SetWorldStateForPlayer(WG_STATE_SOUTH_PROGRESS,0)
		m:SetWorldStateForPlayer(WG_STATE_SOUTH_NEUTRAL,0)
	end
	if(m:GetAreaId() == AREA_SUNKENRING and pGO:GetDistance(m) <= 5500)then
		SR_A = 0
		SR_H = 0
		if(m:GetTeam() == 0)then
			SR_A = SR_A + 1
		elseif(m:GetTeam() == 1)then
			SR_H = SR_H + 1
		end
		SR_P = SR_A - SR_H
		if(sunkenring_progress < 100 and sunkenring_progress > 0)then
			if(SR_P < 0)then
				sunkenring_progress = sunkenring_progress - 1
			elseif(SR_P > 0)then
				sunkenring_progress = sunkenring_progress + 1
			end
		elseif(sunkenring_progress == 0)then
			if(SR_P > 0)then
				sunkenring_progress = sunkenring_progress + 1
			end
		elseif(sunkenring_progress == 100)then
			if(SR_P < 0)then
				sunkenring_progress = sunkenring_progress - 1
			end
		end
		m:SetWorldStateForPlayer(WG_STATE_NORTH_SHOW,1)
		m:SetWorldStateForPlayer(WG_STATE_NORTH_PROGRESS,sunkenring_progress)
		m:SetWorldStateForPlayer(WG_STATE_NORTH_NEUTRAL,C_BAR_NEUTRAL)
	elseif(m:GetAreaId() == AREA_BROKENTEMPLE and pGO:GetDistance(m) <= 5500)then
		BT_A = 0
		BT_H = 0
		if(m:GetTeam() == 0)then
			BT_A = BT_A + 1
		elseif(m:GetTeam() == 1)then
			BT_H = BT_H + 1
		end
		BT_P = BT_A - BT_H
		if(brokentemple_progres < 100 and brokentemple_progres > 0)then
			if(BT_P < 0)then
				brokentemple_progres = brokentemple_progres - 1
			elseif(BT_P > 0)then
				brokentemple_progres = brokentemple_progres + 1
			end
		elseif(brokentemple_progres == 0)then
			if(BT_P > 0)then
				brokentemple_progres = brokentemple_progres + 1
			end
		elseif(brokentemple_progres == 100)then
			if(BT_P < 0)then
				brokentemple_progres = brokentemple_progres - 1
			end
		end
		m:SetWorldStateForPlayer(WG_STATE_NORTH_SHOW,1)
		m:SetWorldStateForPlayer(WG_STATE_NORTH_PROGRESS,brokentemple_progres)
		m:SetWorldStateForPlayer(WG_STATE_NORTH_NEUTRAL,C_BAR_NEUTRAL)
	else
		m:SetWorldStateForPlayer(WG_STATE_NORTH_SHOW,0)
		m:SetWorldStateForPlayer(WG_STATE_NORTH_PROGRESS,0)
		m:SetWorldStateForPlayer(WG_STATE_NORTH_NEUTRAL,0)
	end
else
	m:SetWorldStateForPlayer(WG_STATE_NORTH_SHOW,0)
	m:SetWorldStateForPlayer(WG_STATE_NORTH_PROGRESS,0)
	m:SetWorldStateForPlayer(WG_STATE_NORTH_NEUTRAL,0)
	m:SetWorldStateForPlayer(WG_STATE_SOUTH_SHOW,0)
	m:SetWorldStateForPlayer(WG_STATE_SOUTH_PROGRESS,0)
	m:SetWorldStateForPlayer(WG_STATE_SOUTH_NEUTRAL,0)
end
end
end
end

function KillCreature(pUnit, event, pLastTarget)
	if(battle == 1)then
		for k,v in pairs(pUnit:GetInRangePlayers())do
			if(v:IsPlayer())then
				if(v:HasAura(SPELL_RECRUIT))then
					if(v:GetAuraStackCount(SPELL_RECRUIT) < 5)then
						v:CastSpell(SPELL_RECRUIT)
					else
						pUnit:SendChatMessageToPlayer(42, 0, "You have reached Rank 1: Corporal", v)
						v:RemoveAura(SPELL_RECRUIT)
						v:RemoveAura(SPELL_RECRUIT)
						v:RemoveAura(SPELL_RECRUIT)
						v:RemoveAura(SPELL_RECRUIT)
						v:RemoveAura(SPELL_RECRUIT)
						v:RemoveAura(SPELL_RECRUIT)
						v:CastSpell(SPELL_CORPORAL)
					end
				elseif(v:HasAura(SPELL_CORPORAL))then
					if(v:GetAuraStackCount(SPELL_CORPORAL) < 5)then
						v:CastSpell(SPELL_CORPORAL)
					else
						pUnit:SendChatMessageToPlayer(42, 0, "You have reached Rank 2: Lieutenant", v)
						v:RemoveAura(SPELL_CORPORAL)
						v:RemoveAura(SPELL_CORPORAL)
						v:RemoveAura(SPELL_CORPORAL)
						v:RemoveAura(SPELL_CORPORAL)
						v:RemoveAura(SPELL_CORPORAL)
						v:RemoveAura(SPELL_CORPORAL)
						v:AddAura(SPELL_LIEUTENANT,0)
					end
				end
			end
		end
	end
end

function KillPlayer(event, pKiller, pVictim)
if(battle == 1)then
	for k,v in pairs(pVictim:GetInRangePlayers())do
		if(pVictim:GetTeam() ~= v:GetTeam())then
			if(v:HasAura(SPELL_RECRUIT))then
					if(v:GetAuraStackCount(SPELL_RECRUIT) < 5)then
						v:CastSpell(SPELL_RECRUIT)
					else
						v:SendAreaTriggerMessage("You have reached Rank 1: Corporal")
						v:RemoveAura(SPELL_RECRUIT)
						v:RemoveAura(SPELL_RECRUIT)
						v:RemoveAura(SPELL_RECRUIT)
						v:RemoveAura(SPELL_RECRUIT)
						v:RemoveAura(SPELL_RECRUIT)
						v:RemoveAura(SPELL_RECRUIT)
						v:CastSpell(SPELL_CORPORAL)
					end
				elseif(v:HasAura(SPELL_CORPORAL))then
					if(v:GetAuraStackCount(SPELL_CORPORAL) < 5)then
						v:CastSpell(SPELL_CORPORAL)
					else
						v:SendAreaTriggerMessage("You have reached Rank 2: Lieutenant")
						v:RemoveAura(SPELL_CORPORAL)
						v:RemoveAura(SPELL_CORPORAL)
						v:RemoveAura(SPELL_CORPORAL)
						v:RemoveAura(SPELL_CORPORAL)
						v:RemoveAura(SPELL_CORPORAL)
						v:RemoveAura(SPELL_CORPORAL)
						v:AddAura(SPELL_LIEUTENANT,0)
					end
				end
		end
	end
end
end

function AGengineerOnGossip(pUnit, event, pPlayer)
if(pUnit:GetWorldStateForZone(WG_STATE_MAX_A_VEHICLES) > pUnit:GetWorldStateForZone(WG_STATE_CURRENT_A_VEHICLES))then
	if(pPlayer:HasAura(SPELL_CORPORAL) or pPlayer:HasAura(SPELL_LIEUTENANT) and battle == 1)then
		if(pPlayer:HasAura(SPELL_CORPORAL))then
			pUnit:GossipCreateMenu(13798, pPlayer, 0)
			pUnit:GossipMenuAddItem(0, "I'd like to build a catapult.", 1, 0)
			pUnit:GossipSendMenu(pPlayer)
		elseif(pPlayer:HasAura(SPELL_LIEUTENANT) and battle == 1)then
			pUnit:GossipCreateMenu(13798, pPlayer, 0)
			pUnit:GossipMenuAddItem(0, "I'd like to build a catapult.", 1, 0)
			pUnit:GossipMenuAddItem(0, "I'd like to build a demolisher.", 2, 0)
			pUnit:GossipMenuAddItem(0, "I'd like to build a siege engine.", 3, 0)
			pUnit:GossipSendMenu(pPlayer)
		else
			pUnit:GossipCreateMenu(14172, pPlayer, 0)
			pUnit:GossipSendMenu(pPlayer)
		end
	end
else
	pUnit:GossipCreateMenu(14172, pPlayer, 0)
	pUnit:GossipSendMenu(pPlayer)
end
end

function AOnSelect(pUnit, event, pPlayer, id, intid, code)
if(pUnit:GetWorldStateForZone(WG_STATE_MAX_A_VEHICLES) > pUnit:GetWorldStateForZone(WG_STATE_CURRENT_A_VEHICLES))then
	if(intid == 1)then
		pPlayer:FullCastSpell(SPELL_BUILD_CATAPULT)
		pPlayer:GossipComplete()
	elseif(intid == 2)then
		pPlayer:FullCastSpell(SPELL_BUILD_DEMOLISHER)
		pPlayer:GossipComplete()
	elseif(intid == 3)then
		pPlayer:FullCastSpell(SPELL_BUILD_ENGINE_A)
		pPlayer:GossipComplete()
	end
end
end

function HGengineerOnGossip(pUnit, event, pPlayer)
if(pUnit:GetWorldStateForZone(WG_STATE_MAX_H_VEHICLES) > pUnit:GetWorldStateForZone(WG_STATE_CURRENT_H_VEHICLES))then
	if(pPlayer:HasAura(SPELL_CORPORAL) or pPlayer:HasAura(SPELL_LIEUTENANT) and battle == 1)then
		if(pPlayer:HasAura(SPELL_CORPORAL))then
			pUnit:GossipCreateMenu(13798, pPlayer, 0)
			pUnit:GossipMenuAddItem(0, "I'd like to build a catapult.", 1, 0)
			pUnit:GossipSendMenu(pPlayer)
		elseif(pPlayer:HasAura(SPELL_LIEUTENANT) and battle == 1)then
			pUnit:GossipCreateMenu(13798, pPlayer, 0)
			pUnit:GossipMenuAddItem(0, "I'd like to build a catapult.", 1, 0)
			pUnit:GossipMenuAddItem(0, "I'd like to build a demolisher.", 2, 0)
			pUnit:GossipMenuAddItem(0, "I'd like to build a siege engine.", 3, 0)
			pUnit:GossipSendMenu(pPlayer)
		else
			pUnit:GossipCreateMenu(14172, pPlayer, 0)
			pUnit:GossipSendMenu(pPlayer)
		end
	end
else
	pUnit:GossipCreateMenu(14172, pPlayer, 0)
	pUnit:GossipSendMenu(pPlayer)
end
end

function HOnSelect(pUnit, event, pPlayer, id, intid, code)
if(pUnit:GetWorldStateForZone(WG_STATE_MAX_H_VEHICLES) > pUnit:GetWorldStateForZone(WG_STATE_CURRENT_H_VEHICLES))then
	if(intid == 1)then
		pPlayer:FullCastSpell(SPELL_BUILD_CATAPULT)
		pPlayer:GossipComplete()
	elseif(intid == 2)then
		pPlayer:FullCastSpell(SPELL_BUILD_DEMOLISHER)
		pPlayer:GossipComplete()
	elseif(intid == 3)then
		pPlayer:FullCastSpell(SPELL_BUILD_ENGINE_H)
		pPlayer:GossipComplete()
	end
end
end

function OnDestroy(pGO)
for k,g in pairs(pGO:GetInRangePlayers())do
	if(pGO:GetEntry() == GO_WINTERGRASP_SS_TOWER or pGO:GetEntry() == GO_WINTERGRASP_WE_TOWER or pGO:GetEntry() == GO_WINTERGRASP_FW_TOWER)then
		if(DEFENDER == "Alliance")then
			if(g:GetTeam() == 0)then
				if not(g:HasAchievement(ACHIEVEMENT_LEANING_T))then
					g:AddAchievement(ACHIEVEMENT_LEANING_T)
				end
				if(g:HasQuest(QUEST_WG_SOUTHEN_SABOTAGE) and g:GetQuestObjectiveCompletion(QUEST_WG_SOUTHEN_SABOTAGE, 0) == 0)then
					g:AdvanceQuestObjective(QUEST_WG_SOUTHEN_SABOTAGE, 0)
				end
			end
		elseif(DEFENDER == "Horde")then
			if(g:GetTeam() == 1)then
				if not(g:HasAchievement(ACHIEVEMENT_LEANING_T))then
					g:AddAchievement(ACHIEVEMENT_LEANING_T)
				end
				if(g:HasQuest(QUEST_WG_TOPPING_TOWERS) and g:GetQuestObjectiveCompletion(QUEST_WG_TOPPING_TOWERS, 0) == 0)then
					g:AdvanceQuestObjective(QUEST_WG_TOPPING_TOWERS, 0)
				end
			end
		end
	elseif(pGO:GetEntry() == GO_WINTERGRASP_SE_TOWER or pGO:GetEntry() == GO_WINTERGRASP_NE_TOWER or pGO:GetEntry() == GO_WINTERGRASP_SW_TOWER or pGO:GetEntry() == GO_WINTERGRASP_NW_TOWER)then
		if(DEFENDER == "Horde")then
			if(g:GetTeam() == 0)then
				if not(g:HasAchievement(ACHIEVEMENT_LEANING_T))then
					g:AddAchievement(ACHIEVEMENT_LEANING_T)
				end
			end
		elseif(DEFENDER == "Alliance")then
			if(g:GetTeam() == 1)then
				if not(g:HasAchievement(ACHIEVEMENT_LEANING_T))then
					g:AddAchievement(ACHIEVEMENT_LEANING_T)
				end
			end
		end
	end
end
for k,v in pairs(GetPlayersInZone(ZONE_WG))do
	if(pGO:GetEntry() == GO_WINTERGRASP_SS_TOWER)then
		south_towers = south_towers - 1
		for k,g in pairs(GetPlayersInZone(ZONE_WG))do
			g:SendBroadcastMessage("The Shadowsight Tower was destroyed by the "..DEFENDER.."!")
			g:SendAreaTriggerMessage("The Shadowsight Tower was destroyed by the "..DEFENDER.."!")
		end
	elseif(pGO:GetEntry() == GO_WINTERGRASP_WE_TOWER)then
		south_towers = south_towers - 1
		for k,g in pairs(GetPlayersInZone(ZONE_WG))do
			g:SendBroadcastMessage("The Winter's Edge Tower was destroyed by the "..DEFENDER.."!")
			g:SendAreaTriggerMessage("The Winter's Edge Tower was destroyed by the "..DEFENDER.."!")
		end
	elseif(pGO:GetEntry() == GO_WINTERGRASP_FW_TOWER)then
		south_towers = south_towers - 1
		for k,g in pairs(GetPlayersInZone(ZONE_WG))do
			g:SendBroadcastMessage("The Flamewatch Tower was destroyed by the "..DEFENDER.."!")
			g:SendAreaTriggerMessage("The Flamewatch Tower was destroyed by the "..DEFENDER.."!")
		end
	end
end
end

RegisterGameObjectEvent(GO_WINTERGRASP_SE_TOWER,8,OnDestroy)
RegisterGameObjectEvent(GO_WINTERGRASP_NE_TOWER,8,OnDestroy)
RegisterGameObjectEvent(GO_WINTERGRASP_SW_TOWER,8,OnDestroy)
RegisterGameObjectEvent(GO_WINTERGRASP_NW_TOWER,8,OnDestroy)
RegisterGameObjectEvent(GO_WINTERGRASP_SS_TOWER,8,OnDestroy)
RegisterGameObjectEvent(GO_WINTERGRASP_WE_TOWER,8,OnDestroy)
RegisterGameObjectEvent(GO_WINTERGRASP_FW_TOWER,8,OnDestroy)
RegisterUnitGossipEvent(NPC_GOBLIN_ENGINEER,2,HOnSelect)
RegisterUnitGossipEvent(NPC_GOBLIN_ENGINEER,1,HGengineerOnGossip)
RegisterUnitGossipEvent(NPC_GNOME_ENGINEER,2,AOnSelect)
RegisterUnitGossipEvent(NPC_GNOME_ENGINEER,1,AGengineerOnGossip)
RegisterGameObjectEvent(GO_WINTERGRASP_CAPTUREPOINT_WS_100,5,AIUpdate_Cpoint)
RegisterGameObjectEvent(GO_WINTERGRASP_CAPTUREPOINT_WS_100,2,OnSP_Cpoint)
RegisterGameObjectEvent(GO_WINTERGRASP_CAPTUREPOINT_ES_100,5,AIUpdate_Cpoint)
RegisterGameObjectEvent(GO_WINTERGRASP_CAPTUREPOINT_ES_100,2,OnSP_Cpoint)
RegisterGameObjectEvent(GO_WINTERGRASP_CAPTUREPOINT_BT_100,5,AIUpdate_Cpoint)
RegisterGameObjectEvent(GO_WINTERGRASP_CAPTUREPOINT_BT_100,2,OnSP_Cpoint)
RegisterGameObjectEvent(GO_WINTERGRASP_CAPTUREPOINT_SR_100,5,AIUpdate_Cpoint)
RegisterGameObjectEvent(GO_WINTERGRASP_CAPTUREPOINT_SR_100,2,OnSP_Cpoint)
RegisterGameObjectEvent(GO_WINTERGRASP_VEHICLE_TELEPORTER,5,OnAIUpdateVehicleTeleporter)
RegisterGameObjectEvent(GO_WINTERGRASP_VEHICLE_TELEPORTER,2,OnLoadVehicleTeleporter)
RegisterGameObjectEvent(GO_WINTERGRASP_DEFENDER_A,4,PortalOnUse)
RegisterGameObjectEvent(GO_WINTERGRASP_DEFENDER_H,4,PortalOnUse)
RegisterGameObjectEvent(GO_WINTERGRASP_DEFENDER_N,4,PortalOnUse)
RegisterGameObjectEvent(GO_WINTERGRASP_TITAN_RELIC,4,TitanRelickOnUse)
RegisterUnitEvent(NPC_DETECTION_UNIT,18,DetectionUnitOnSpawn)
RegisterUnitEvent(NPC_DETECTION_UNIT,21,DetectionUnitAIUpdate)
RegisterUnitEvent(NPC_NOT_IMMUNE_PC_NPC,18,DetectionUnitOnSpawn)
RegisterUnitEvent(NPC_NOT_IMMUNE_PC_NPC,21,DetectionUnitAIUpdate)
RegisterTimedEvent("WGUpdate", 1000, 0)
RegisterTimedEvent("Aura", 1000, 0)
RegisterServerHook(16, "DebugWG")
RegisterServerHook(2,KillPlayer)
RegisterUnitEvent(30739,4,KillCreature)
RegisterUnitEvent(30740,4,KillCreature)
