--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--[[Prince Malchezaar yells: All realities, all dimensions are open to me!
Prince Malchezaar yells: How can you hope to stand against such overwhelming power?
Prince Malchezaar yells: I refuse to concede defeat! I am a prince of the Eredar! I... am...
Prince Malchezaar yells: Madness has brought you here to me. I shall be your undoing!
Prince Malchezaar yells: Simple fools! Time is the fire in which you'll burn!
Prince Malchezaar yells: You are but a plaything. Unfit even to amuse.
Prince Malchezaar yells: You face not Malchezaar alone, but the legions I command!
Prince Malchezaar yells: Your greed, your foolishness has brought you to this end.]]

function Malchezaar_Hellfire(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(43465, Unit:GetClosestPlayer())
end

function Malchezaar_Thrash(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(21919)
end

function Malchezaar_Parry(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(13668)
end

function Malchezaar_Sunder_Armor(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30901, Unit:GetClosestPlayer())
end

function Malchezaar_Cleave(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(39174, Unit:GetClosestPlayer())
end

function Malchezaar_Amplify(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(39095, Unit:GetRandomPlayer())
end


function Malchezaar_Flying_Axes(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(17650)
end

function Malchezaar_Shadow_Word_Pain(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30854, Unit:GetClosestPlayer())
end

function Malchezaar_Shadow_Word_Pain2(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30854, Unit:GetRandomPlayer())
end

function Malchezaar_Summon_Infernal(Unit, event, miscUnit, misc)
    Unit:SpawnCreature(17646, -10924.5, -1974.66, 275.522, 0, 18, 180000);
end

function Malchezaar_Enfeeble(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30843, Unit:GetRandomPlayer())
	Unit:FullCastSpellOnTarget(30843, Unit:GetRandomPlayer())
	Unit:FullCastSpellOnTarget(30843, Unit:GetRandomPlayer())
	Unit:FullCastSpellOnTarget(30843, Unit:GetRandomPlayer())
	Unit:FullCastSpellOnTarget(30843, Unit:GetRandomPlayer())
end

function Malchezaar_Shadow_Nova(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30852, Unit:GetClosestPlayer())
end

function Malchezaar(Unit, event, miscUnit, misc)
	if((Unit:GetHealthPct() < 100) and (Didthat == 0)) then
		Unit:SendAreaTriggerMessage("PHASE 1")
		Unit:RegisterEvent("Malchezaar_Hellfire", 2000, 0)
		Unit:RegisterEvent("Malchezaar_Shadow_Word_Pain", 25000, 0)
		Unit:RegisterEvent("Malchezaar_Summon_Infernal", 35000, 0)
		Unit:RegisterEvent("Malchezaar_Enfeeble", 45000, 0)
		Unit:RegisterEvent("Malchezaar_Shadow_Nova", 47000, 0)
		Didthat = 1
	else
	end
	if((Unit:GetHealthPct() < 60) and (Didthat == 1)) then
		Unit:SendAreaTriggerMessage("PHASE 2")
		Unit:RegisterEvent("Malchezaar_Hellfire", 2000, 0)
		Unit:RegisterEvent("Malchezaar_Thrash", 5000, 0)
		Unit:RegisterEvent("Malchezaar_Parry", 6000, 0)
		Unit:RegisterEvent("Malchezaar_Sunder_Armor", 7000, 0)
		Unit:RegisterEvent("Malchezaar_Cleave", 8000, 0)
		Unit:RegisterEvent("Malchezaar_Summon_Infernal", 45000, 0)
		Unit:RegisterEvent("Malchezaar_Enfeeble", 46000, 0)
		Unit:RegisterEvent("Malchezaar_Shadow_Nova", 47000, 0)
		Didthat = 2
	else
	end
	if((Unit:GetHealthPct() < 30) and (Didthat == 2)) then
		Unit:SendAreaTriggerMessage("PHASE 3")
		Unit:RegisterEvent("Malchezaar_Hellfire", 2000, 0)
		Unit:RegisterEvent("Malchezaar_Amplify", 10000, 0)
		Unit:RegisterEvent("Malchezaar_Summon_Infernal", 15000, 0)
		Unit:RegisterEvent("Malchezaar_Shadow_Word_Pain2", 25000, 0)
		Unit:RegisterEvent("Malchezaar_Flying_Axes", 17000, 0)
		Unit:RegisterEvent("Malchezaar_Shadow_Nova", 47000, 0)
		Didthat = 3
	else
	end
end

function Malchezaar_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Malchezaar_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(15690, 2, "Malchezaar_OnLeaveCombat")
RegisterUnitEvent(15690, 4, "Malchezaar_OnDeath")
RegisterUnitEvent(15690, 1, "Malchezaar")