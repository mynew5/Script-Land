--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Holystone Productions
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

dkenchants = {53341, 53343}

function DonkeyKong_Runeforging(event, plr, spellid)
	if(plr:HasQuest(12842) == true) then
		if(questcomplete[plr:GetName()] == nil) then
			questcomplete[plr:GetName()] = 0;
		elseif(questcomplete[plr:GetName()] == 1) then 
			return
		elseif((spellid == dkenchants[1]) or (spellid == dkenchants[2])) then
			questcomplete[plr:GetName()] = 1;
			plr:AdvanceQuestObjective(12842, 1)
		end
	end
end

RegisterServerHook(10, "DonkeyKong_Runeforging")