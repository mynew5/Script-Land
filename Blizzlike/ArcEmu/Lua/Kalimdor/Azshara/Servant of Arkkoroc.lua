--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: zdroid9770; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function ServantofArkkoroc_OnCombat(Unit, Event)
	Unit:RegisterEvent("ServantofArkkoroc_Trample", 5000, 0)
end

function ServantofArkkoroc_Trample(pUnit, Event) 
	pUnit:CastSpell(5568) 
end

function ServantofArkkoroc_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ServantofArkkoroc_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6143, 1, "ServantofArkkoroc_OnCombat")
RegisterUnitEvent(6143, 2, "ServantofArkkoroc_OnLeaveCombat")
RegisterUnitEvent(6143, 4, "ServantofArkkoroc_OnDied")