--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Recon; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Melris_Died(Unit, event, player)
	Unit:RemoveEvents()
end

function Melris(Unit, event, player)
	Unit:RegisterEvent("Melris_Say",48000, 0)
end

function Melris_Say(Unit, event, player)
	Unit:SendChatMessage(12, 0, "Highlord Bolvar is looking for able bodied people, around level 56, for a job. Head up to the Stormwind Keep and speak with him if you qualify!")
end

RegisterUnitEvent(12480, 18, "Melris")
RegisterUnitEvent(12480, 4, "Melris_Died")