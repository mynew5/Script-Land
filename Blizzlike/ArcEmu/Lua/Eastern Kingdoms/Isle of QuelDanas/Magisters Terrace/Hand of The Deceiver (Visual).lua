--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BrantX; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function HandOfDeceiverVisual_OnSpawn(Unit,Event)
	Unit:FullCastSpell(51795)
	Unit:RegisterEvent("HandOfDeceiverVisual_Channel", 10000, 0)
end

function HandOfDeceiverVisual_Channel(Unit,Event)
	Unit:FullCastSpell(51795)
end

RegisterUnitEvent(25955, 18, "HandOfDeceiverVisual_OnSpawn")