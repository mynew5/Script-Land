--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function bloodbah_Entercombat (pUnit, Event)
	pUnit:SendChatMessage (0, 0, "Naw you can't do that to me im a legitimate mage.")
end

RegisterUnitEvent (98668, 1, "bloodbah_Entercombat")

function OnCombatScale(pUnit, Event)
    pUnit:SetScale(1.10);
end

RegisterUnitEvent(98668,1,"OnCombatScale")

function jueloa_Entercombat (pUnit, Event)
	pUnit:SendChatMessage (0, 0, "F*cking A!")
end

RegisterUnitEvent (98669, 1, "bloodbah_Entercombat")

function jueloa_Entercombat (pUnit, Event)
	pUnit:SendChatMessage (0, 0, "F*cking A!")
end

RegisterUnitEvent (98669, 4, "bloodbah_Entercombat")

function jueloa_Entercombat (pUnit, Event)
	pUnit:SendChatMessage (0, 0, "F*cking A!")
end

RegisterUnitEvent (98668, 4, "bloodbah_Entercombat")
