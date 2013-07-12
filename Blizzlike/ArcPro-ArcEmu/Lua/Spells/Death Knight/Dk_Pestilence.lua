--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Holystone Productions
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Dk_Pestilence_Fixe(event, player, spellid)
local Target = player
local FriendTarget = Target:GetInRangeFriends()
	if(spellid == 50842) then
		Target = player:GetSelection()
	elseif(Target ~= nil) then
		Target:AddAura(55078, 21000)
		Target:AddAura(55095, 21000)
	elseif(FriendTarget:GetDistanceYards(Target) < 10) then
		FriendTarget:AddAura(55078, 21000)
		FriendTarget:AddAura(55095, 21000)
	end
end

RegisterServerHook(10, "Dk_Pestilence_Fixe")