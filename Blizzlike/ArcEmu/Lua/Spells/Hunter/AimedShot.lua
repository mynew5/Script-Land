--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Mathix; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function AimedShotFix(event, player, spellid)
	if((spellid == 49050) and (IsPlayerMoving() == true)) then
		player:CastSpellOnTarget(49050, player:GetSelection())
	elseif((spellid == 49049) and (IsPlayerMoving() == true)) then
		player:CastSpellOnTarget(49049, player:GetSelection())
	elseif((spellid == 27065) and (IsPlayerMoving() == true)) then
		player:CastSpellOnTarget(27065, player:GetSelection())
	elseif((spellid == 20904) and (IsPlayerMoving() == true)) then
		player:CastSpellOnTarget(20904, player:GetSelection())
	elseif((spellid == 20903) and (IsPlayerMoving() == true)) then
		player:CastSpellOnTarget(20903, player:GetSelection())
	elseif((spellid == 20902) and (IsPlayerMoving() == true)) then
		player:CastSpellOnTarget(20902, player:GetSelection())
	elseif((spellid == 20901) and (IsPlayerMoving() == true)) then
		player:CastSpellOnTarget(20901, player:GetSelection())
	elseif((spellid == 20900) and (IsPlayerMoving() == true)) then
		player:CastSpellOnTarget(20900, player:GetSelection())
	elseif((spellid == 19434) and (IsPlayerMoving() == true)) then
		player:CastSpellOnTarget(19434, player:GetSelection())
	end
end

RegisterServerHook(10, "AimedShotFix")