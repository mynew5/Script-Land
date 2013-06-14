--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Mager; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AuchenaiDeathSpeaker_ShadowBolt(Unit)
	Unit:FullCastSpellOnTarget(9613)
end

function AuchenaiDeathSpeaker_OnEnterCombat(Unit, Event)
	Unit:RegisterEvent("AuchenaiDeathSpeaker_ShadowBolt", math.random(3500,5600), 0)
	Unit:CastSpell(13787)
end

RegisterUnitEvent(21242, 1, "AuchenaiDeathSpeaker_OnEnterCombat")