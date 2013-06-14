--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DDPeon_Spell(Unit, Event)
	Unit:RemoveEvents()
	Unit:CastSpell(40732)
	Unit:RegisterEvent("DDPeon_Spell2", 10000, 0)
end

function DDPeon_Spell2(Unit, Event)
	Unit:RemoveEvents()
	Unit:CastSpell(40735)
	Unit:RegisterEvent("DDPeon_Spell3", 20000, 0)
end

function DDPeon_Spell3(Unit, Event)
	Unit:RemoveEvents()
	Unit:CastSpell(40714)
	Unit:RegisterEvent("DDPeon_Spell1", 30000, 0)
end

function DDPeon_Start(Unit, Event)
	Unit:RegisterEvent("DDPeon_Spell", 1000, 0)
end

RegisterUnitEvent(21316, 6, "DDPeon_Start")