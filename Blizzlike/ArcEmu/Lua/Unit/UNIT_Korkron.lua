--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Recon; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Kor'kron Defender yells: If I see any lazy peons here, I'll load them into a catapult and launch them off to the Black Temple!
Kor'kron Defender yells: Keep up the pace!
Kor'kron Defender yells: Salvage what you need from the broken catapults!
Kor'kron Defender yells: Work faster! We need these catapults ready for an attack!
Kor'kron Defender says: For the Warchief!]]

function Korkron_Died(Unit, event, player)
	Unit:RemoveEvents()
end

function Korkron(Unit, event, player)
	Unit:RegisterEvent("Korkron_Say", 69000, 0)
end

function Korkron_Say(Unit, event, player)
	Unit:SendChatMessage(14, 0, "Any time any of you peons want to take a break, the graveyard is right over there.")
end

RegisterUnitEvent(19362, 18, "Korkron")
RegisterUnitEvent(19362, 4, "Korkron_Died")