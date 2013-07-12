--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--[[ Sound ID's
Sound\Creature\PrinceKaelthasSunstrider [12413] name=A_MTERRACE_BROKENKAELAGGRO file1=BROKENKAELAGGRO.wav 
Sound\Creature\PrinceKaelthasSunstrider [12415] name=A_MTERRACE_BROKENKAELPHOENIX 
Sound\Creature\PrinceKaelthasSunstrider [12417] name=A_MTERRACE_BROKENKAELFLAMESTRIK 
Sound\Creature\PrinceKaelthasSunstrider [12418] name=A_MTERRACE_BROKENKAELPHASE2 
Sound\Creature\PrinceKaelthasSunstrider [12419] name=A_MTERRACE_BROKENKAELWEAKENED 
Sound\Creature\PrinceKaelthasSunstrider [12420] name=A_MTERRACE_BROKENKAELMOREAIR 
Sound\Creature\PrinceKaelthasSunstrider [12421] name=A_MTERRACE_BROKENKAELDEATH 

Spells:
Alternative for FlameStrike : 37428 (Summoned Dummy/Trigger will cast it after 5 seconds,  only 3k damage so it wiill repeat it self for heroic 3x times for normal mode 2x.
]]

--Defines
local OBJECT_END =	0x006
local Unit_FIELD_FLAGS = OBJECT_END + 0x028
local Unit_FLAG_NOT_ATTACKABLE_9 = 0x00000100
local Unit_FLAG_NOT_SELECTABLE = 0x02000000

function Kael_OnEnterCombat(pUnit,Event)
    pUnit:Root()
	pUnit:SendChatMessage(14, 0, "Don't look so smug! I know what you're thinking, but Tempest Keep was merely a set back. Did you honestly believe I would trust the future to some blind, half-night elf mongrel? Hahahaha... Oh no, no, no, he was merely an instrument, a stepping stone to a much larger plan! It has all led to this...and this time, you will not interfere!")
	pUnit:PlaySoundToSet(12413)
	pUnit:SetUInt32Value(Unit_FIELD_FLAGS, Unit_FLAG_NOT_SELECTABLE+Unit_FLAG_NOT_ATTACKABLE_9)	
	pUnit:RegisterEvent("Kael_Phase1", 38000, 1)
end

function Kael_Phase1(pUnit,Event)
	pUnit:RemoveEvents()
    pUnit:Root()
	pUnit:RegisterEvent("Kael_FireBolt", 2500, 0)
	pUnit:RegisterEvent("Kael_PhoenixSummon", 25000, 2)
	pUnit:RegisterEvent("Kael_FlameStrike", 21000, 0)	
	if(pUnit:GetHealthPct() > 50) then
		pUnit:RegisterEvent("Kael_Gravity", 1000, 0)
	end
end

function Kael_Fireball(pUnit,Event)
	pUnit:FullCastSpellOnTarget(46164,pUnit:GetMainTank())
end

function Kael_PhoenixSummon(pUnit,Event)
	pUnit:SendChatMessage(14, 0,"Vengeance burns!")
	pUnit:PlaySoundToSet(12415)
	local player = pUnit:GetRandomPlayer(7)
    if(type(player) == "userdata") then
		pUnit:SpawnCreature(24674 , player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 0) 
	end
end

function Kael_FlameStrike(pUnit,Event)
	pUnit:SendChatMessage(14, 0,"Felomin ashal!")
	pUnit:PlaySoundToSet(12417)
	local player = pUnit:GetRandomPlayer(3)
	if(type(player) == "userdata") then
		pUnit:SpawnCreature(24666 , player:GetX(), player:GetY(), player:GetZ(), player:GetO(), 14, 5)
	end
end	

function Kael_Gravity(pUnit,Event)
	pUnit:RemoveEvents()
	pUnit:Root()
	pUnit:SendChatMessage(14, 0,"I'll turn your world...upside...down.")
	pUnit:PlaySoundToSet(12418)
	pUnit:FullCastSpell(44224)
	pUnit:RegisterEvent("Kael_Week", 30000, 1)
end

function Kael_Week(pUnit,Event)
	pUnit:Root()
	pUnit:SendChatMessage(14, 0,"Master, grant me strength.")
	pUnit:PlaySoundToSet(12419)
	pUnit:FullCastSpell(36185)
	pUnit:RegisterEvent("Kael_Again", 10000, 1)
end

function Kael_Again(pUnit,Event) 
	pUnit:RemoveEvents()
    pUnit:Root()
	pUnit:SendChatMessage(14, 0,"Do not get...too comfortable.")
	pUnit:PlaySoundToSet(12420)
	pUnit:FullCastSpell(44224)
	pUnit:RegisterEvent("Kael_Week", 30000, 1)
end

function Kael_OnDied(pUnit, event, player)
	pUnit:SendChatMessage(14, 0,"My demise accomplishes nothing! The Master will have you! You will drown in your own blood! The world shall burn! Aaaghh!")
	pUnit:PlaySoundToSet(12421)
	pUnit:RemoveEvents()
end

function Kael_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()	
end

RegisterUnitEvent(24664, 1, "Kael_OnEnterCombat")
RegisterUnitEvent(24664, 2, "Kael_OnLeaveCombat")
RegisterUnitEvent(24664, 4, "Kael_OnDied")

function Phoenix_OnEnterCombat(pUnit,Event)
	pUnit:RegisterEvent("Phoenix_HellFire", 2500, 0)
end

function Phoenix_HellFire(pUnit,Event)
	pUnit:FullCastSpell(44199)
end
	
function Phoenix_OnDied(pUnit, event, player)
	local x,y,z,o = pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),pUnit:GetO()
	pUnit:SpawnCreature(24675 , x, y, z, o, 14, 10000)
	pUnit:RemoveEvents()
end

function Phoenix_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()	
end

RegisterUnitEvent(24674, 1, "Phoenix_OnEnterCombat")
RegisterUnitEvent(24674, 2, "Phoenix_OnLeaveCombat")
RegisterUnitEvent(24674, 4, "Phoenix_OnDied")

function Egg_OnEnterCombat(pUnit,Event)
    pUnit:Root()
	local x,y,z,o = pUnit:GetX(),pUnit:GetY(),pUnit:GetZ(),pUnit:GetO()
	pUnit:SpawnCreature(24674 , x, y, z, o, 14, 0)
end
	
function Egg_OnDied(pUnit, event, player)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(24675, 1, "Egg_OnEnterCombat")
RegisterUnitEvent(24675, 4, "Egg_OnDied")

function FS_OnEnterCombat(pUnit,Event)
    pUnit:Root()
	pUnit:SetUInt32Value(Unit_FIELD_FLAGS, Unit_FLAG_NOT_SELECTABLE+Unit_FLAG_NOT_ATTACKABLE_9)
	pUnit:RegisterEvent("FS_Cast", 4500, 1)
	pUnit:RegisterEvent("FS_Cast2", 5000, 1)
end
	
function FS_Cast(pUnit,Event)
	pUnit:FullCastSpell(37428) 
end

function FS_Cast2(pUnit,Event)
	pUnit:FullCastSpell(37428) 
	pUnit:RemoveFromWorld()
end

RegisterUnitEvent(24666, 1, "FS_OnEnterCombat")