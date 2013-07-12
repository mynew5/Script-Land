--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function NerubarSkyDarkener_OnCombat(Unit, Event)
	Unit:RegisterEvent("NerubarSkyDarkener_VenomSpit", 8000, 0)
	Unit:RegisterEvent("NerubarSkyDarkener_WebBolt", 10000, 0)
end

function NerubarSkyDarkener_VenomSpit(Unit, Event) 
	Unit:FullCastSpellOnTarget(45577, Unit:GetMainTank()) 
end

function NerubarSkyDarkener_WebBolt(Unit, Event) 
	Unit:FullCastSpellOnTarget(45587, Unit:GetMainTank()) 
end

function NerubarSkyDarkener_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function NerubarSkyDarkener_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(25451, 1, "NerubarSkyDarkener_OnCombat")
RegisterUnitEvent(25451, 2, "NerubarSkyDarkener_OnLeaveCombat")
RegisterUnitEvent(25451, 4, "NerubarSkyDarkener_OnDied")