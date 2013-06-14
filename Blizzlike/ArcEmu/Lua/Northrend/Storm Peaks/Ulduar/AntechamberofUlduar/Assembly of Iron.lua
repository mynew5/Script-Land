--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Steelbreaker_OnEnterCombat(Unit, Event)
	Unit:PlaySoundToSet(15674)
	Unit:SendChatMessage(14, 0, "You will not defeat the Assembly of Iron so easily, invaders!")
	Unit:RegisterEvent("Steelbreaker_Highvoltage", 30000, 4)
	Unit:RegisterEvent("Steelbreaker_Fusion", 30000, 2)
	Unit:RegisterEvent("Steelbreaker_Meltdown", 25000, 4)
	Unit:RegisterEvent("Steelbreaker_Phase1", 60000, 0)
	Unit:RegisterEvent("Steelbreaker_Phase2", 1000, 1)
	Unit:RegisterEvent("Steelbreaker_Phase3", 1000, 1)
end
 
function Steelbreaker_Highvoltage(Unit, Event)
	Unit:PlaySoundToSet(15675)
	Unit:SendChatMessage("So fragile and weak!")
	Unit:CastSpell(61890)
end
 
function Steelbreaker_Fusion(Unit,event)
	Unit:PlaySoundToSet(15677)
	Unit:SendChatMessage(14, 0, "You seek the secrets of Ulduar? Then take them!")
	Unit:CastSpellOnTarger(61902, Unit:GetMainTank())
end
 
function Steelbreaker_Phase1(Unit, Event)
	if(Unit:GetHealthPct() <= 95) then
		if(math.random(1, 2) == 1) then
			Unit:CastSpellOnTarget(61903)
		else
		end
	end
end

function Steelbreaker_Meltdown(Unit, Event)
	if(math.random(1, 2) == 1) then
		Unit:CastSpell(61889)
	else
	end
end
 
function Steelbreaker_Phase2(Unit, Event)
	if(Unit:GetHealthPct() <= 40) then
		Unit:CastSpellOnTarget(63494, Unit:GetRandomPlayer(2))
	end
end
 
function Steelbreaker_Phase3(Unit, Event)
	if(Unit:GetHealthPct() <= 35) then
		Unit:CastSpellOnTarget(61889, Unit:GetRandomPlayer(0))
	end
end
 
function Steelbreaker_OnKilledTarget(Unit, Event)
	Unit:SendChatMessage(14, 0, "Flesh, HAH! Such a hindrence!")
	Unit:PlaySoundToSet(15676)
end
 
function Steelbreaker_OnLeaveCombat(Unit, Event)
	Unit:SendChatMessage(14, 0, "This meeting of the Assembly of Iron is adjourned!")
	Unit:PlaySoundToSet(15680)
	Unit:RemoveEvents()
end
 
function Steelbreaker_OnDeath(Unit, Event)
	Unit:SendChatMessage(14, 0, "My death only serves to hasten your demise.")
	Unit:PlaySoundToSet(15678)
	Unit:CastSpell(61920)
end
 
RegisterUnitEvent(32867, 1, "Steelbreaker_OnEnterCombat")
RegisterUnitEvent(32867, 2, "Steelbreaker_OnLeaveCombat")
RegisterUnitEvent(32867, 3, "Steelbreaker_OnKilledTarget")
RegisterUnitEvent(32867, 4, "Steelbreaker_OnDeath")
 
function StormcallerBrundir_OnEnterCombat(Unit, Event)
    Unit:SendChatMessage(14, 0, "Whether the world's greatest gnats or the world's greatest heroes, you're still only mortal!")
    Unit:PlaySoundToSet(15684)
    Unit:RegisterEvent("StormcallerBrundir_ChainLightning", 30000, 0)
    Unit:RegisterEvent("StormcallerBrundir_LightningWhirl", 25000, 0)
    Unit:RegisterEvent("StormcallerBrundir_LightningTendrils", 15000, 0)
    Unit:RegisterEvent("StormcallerBrundir", 60000, 0)
    Unit:RegisterEvent("StormcallerBrundir", 60000, 0)
end
 
function StormcallerBrundir_ChainLightning(Unit, Event)
    Unit:SendChatMessage(14, 0, "A merciful kill!")
    Unit:PlaySoundToSet(15685)
    Unit:CastSpellOnTarget(63479, Unit:GetRandomPlayer(0))
end
 
 
--Choice=math.random(1, 2)
function StormcallerBrundir_Phase1(Unit, Event)
    if(Unit:GetHealthPct() <= 90) then
		if(math.random(1, 2) == 1) then
			Unit:CastSpell(63481)
		else
		end
	end
end

function StormcallerBrundir_LightningWhirl(Unit, Event)
	Unit:SendChatMessage(14, 0, "HAH")
	Unit:PlaySoundToSet(15686)
    if(math.random(1, 2) == 1) then
		Unit:CastSpellOnTarget(63483, Unit:GetRandomPlayer(0))
	else
	end
end

function StormcallerBrundir_Phase2(Unit, Event)
    if(Unit:GetHealthPct() <= 50) then
		Unit:SendChatMessage(14, 0, "Stand still and stare into the light!")
		Unit:PlaySoundToSet(15687)
		Unit:CastSpell(64187)
	end
end
 
function StormcallerBrundir_LightningTendrils(Unit, Event)
    if(math.random(1, 2) == 1) then
		Unit:CastSpellOnTarget(63485, Unit:GetRandomPlayer(4))
		Unit:SendChatMessage(14, 0, "Let the storm clouds rise and rain down death from above!")
		Unit:PlaySoundToSet(15688)
	else
	end
end
 
function StormcallerBrundir_OnLeaveCombat(Unit, Event)
	Unit:SendChatMessage(14, 0, "The power of the storm lives on...")
	Unit:PlaySoundToSet(15689)
	Unit:RemoveEvents()
end
 
function StormcallerBrundir_Death(Unit, Event) 
	Unit:SendChatMessage(14, 0, "You rush headlong into the maw of madness!")
	Unit:PlaySoundToSet(15690)
	Unit:RemoveEvents()
end
 
RegisterUnitEvent(32857, 1, "StormcallerBrundir_OnEnterCombat")
RegisterUnitEvent(32857, 2, "StormcallerBrundir_OnLeaveCombat")
RegisterUnitEvent(32857, 4, "StormcallerBrundir_Death")
 
function RunemasterMolgein_OnEnterCombat(Unit, Event)
	Unit:SendChatMessage(12, 0, "Nothing short of total decimation will suffice")
	Unit:PlaySoundToSet(15657)
	Unit:RegisterEvent("RunemasterMolgein_Shieldofrunes", 1000, 1)
	Unit:RegisterEvent("RunemasterMolgein_Elemental", 10, 20000)
	Unit:RegisterEvent("RunemasterMolgein_LightningBlast", 1000, 1)
end
 
function RunemasterMolgein_Shieldofrunes(Unit, Event)
	Unit:CastSpell(63489)
end

function RunemasterMolgein_Phase1(Unit, Event)
	if(Unit:GetHealthPct() <= 90) then
		if(math.random(1, 4) == 1) then
			Unit:CastSpell(61974)
			Unit:SendChatMessage(14, 0, "The world suffers yet another insignificant loss.")
			Unit:PlaySoundToSet(15658)
		end
	end
end

function RunemasterMolgein_Runeofdeath(Unit, Event)
	if(math.random(1, 4) == 1) then
		Unit:CastSpell(63490)
		Unit:PlaySoundToSet(15660)
		Unit:SendChatMessage(14, 0, "Decipher this!")
	end
end

function RunemasterMolgein_Elemental(Unit, Event)
	if(Unit:GetHealthPct() <= 70) then
		Unit:SpawnCreature(34147, x, y, z, o, 10, 20000)
		Unit:SendChatMessage(14, 0, "Face the lightning surge!")
		Unit:PlaySoundToSet(15661)
	end
end
 
function RunemasterMolgein_LightningBlast(Unit, Event)
	if(Unit:GetHealthPct() <= 10) then
		Unit:CastSpell(63491)
		Unit:SendChatMessage(14, 0, "This meeting of the Assembly of Iron is adjourned!")
		Unit:PlaySoundToSet(15664)
	end
end
 
function RunemasterMolgein_OnLeaveCombat(Unit, Event)
	Unit:SendChatMessage(14, 0, "The legacy of storms shall not be undone.")
	Unit:PlaySoundToSet(15662)
	Unit:Despawn(1000, 0)
	Unit:RemoveEvents()
end
 
function RunemasterMolgein_Death(Unit, Event)
	Unit:SendChatMessage(14, 0, "What have you gained from my defeat? You are no less doomed, mortals!")
	Unit:PlaySoundToSet(15663)
	Unit:Despawn(1000, 0)
	Unit:RemoveEvents()
end
 
RegisterUnitEvent(32927, 1, "RunemasterMolgein_OnEnterCombat")
RegisterUnitEvent(32927, 2, "RunemasterMolgein_OnLeaveCombat")
RegisterUnitEvent(32927, 4, "RunemasterMolgein_Death")