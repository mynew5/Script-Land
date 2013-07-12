--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Spawning:
	The Windreaver causes a gale to sweep across the land, the sound of his mindless fury coming from the northwest.
Defeat:
	The Windreaver dissipates into the ether, his howling winds still ringing in your ears.]]

function TheWindreaver_OnCombat(Unit, Event)
	Unit:RegisterEvent("TheWindreaver_ChainLightning", 8000, 0)
	Unit:RegisterEvent("TheWindreaver_EnvelopingWinds", 12000, 0)
	Unit:RegisterEvent("TheWindreaver_LightningCloud", 6000, 0)
	Unit:RegisterEvent("TheWindreaver_Shock", 4000, 0)
end

function TheWindreaver_ChainLightning(Unit, Event) 
	Unit:FullCastSpellOnTarget(23106, Unit:GetMainTank()) 
end

function TheWindreaver_EnvelopingWinds(Unit, Event) 
	Unit:FullCastSpellOnTarget(23103, Unit:GetRandomPlayer(0)) 
end

function TheWindreaver_LightningCloud(Unit, Event) 
	Unit:CastSpell(23105) 
end

function TheWindreaver_Shock(Unit, Event) 
	Unit:FullCastSpellOnTarget(23104, Unit:GetMainTank()) 
end

function TheWindreaver_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TheWindreaver_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14454, 1, "TheWindreaver_OnCombat")
RegisterUnitEvent(14454, 2, "TheWindreaver_OnLeaveCombat")
RegisterUnitEvent(14454, 4, "TheWindreaver_OnDied")