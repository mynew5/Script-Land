--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Holystone Productions; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function DeathspeakerHighPriest_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("DeathspeakerHighPriest_AuraofDarkness", 15000, 1)
end

function DeathspeakerHighPriest_AuraofDarkness(pUnit, Event)
    if(pUnit:GetClosestPlayer() ~= nil) then
		pUnit:GetClosestPlayer():AddAura(69491, 60000)
		pUnit:RegisterEvent("DeathspeakerHighPriest_DarkReckoning", 5000, 1)
	end
end

function DeathspeakerHighPriest_DarkReckoning(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:FullCastSpellOnTarget(69483, pUnit:GetRandomPlayer(0))
		pUnit:RegisterEvent("DeathspeakerHighPriest_AuraofDarkness", 8000, 1)
	end
end

function DeathspeakerHighPriest_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(36829, 1, "DeathspeakerHighPriest_OnCombat")
RegisterUnitEvent(36829, 2, "DeathspeakerHighPriest_OnLeaveCombat")