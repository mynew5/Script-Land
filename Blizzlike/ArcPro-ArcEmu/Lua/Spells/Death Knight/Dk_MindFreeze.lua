--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Holystone Productions
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Dk_MindFreeze_Fixe(event, plr, spellid)
	if(spellid == 47528) then
		Target = plr:GetSelection()
		Target:InterruptSpell()
		Target:AddAura(53550, 4000)
	end
end

RegisterServerHook(10, "Dk_MindFreeze_Fixe")