--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Shorts; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--[[Brutallus yells: Bagh! Your magic is weak!
Brutallus yells: Come try your luck!
Brutallus yells: Puny lizard! Death is the only answer you'll find here!
Brutallus yells: That was fun, but I still await a true challenge!]]

function Brut_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Ah, more lambs to the slaughter!")
	pUnit:PlaySoundToSet(12463)
	pUnit:RegisterEvent("Combat_Talk", 30000, 0)
	--pUnit:RegisterEvent("Meteor_Slash", 60000, 0)
	pUnit:RegisterEvent("Burn", 70000, 0)
	pUnit:RegisterEvent("Stomp", 45000, 0)
	pUnit:RegisterEvent("Enrage", 360000, 1)
end

function Brut_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()	
end

function Brut_OnKilledTarget (pUnit, Event)
	local Choice = math.random(1, 3)
	if(Choice == 1) then
		pUnit:SendChatMessage(14, 0, "Perish, insect!")
		pUnit:PlaySoundToSet(12464)
	elseif(Choice == 2) then
		pUnit:SendChatMessage(14, 0, "You are meat!")
		pUnit:PlaySoundToSet(12465)
	elseif(Choice == 3) then
		pUnit:SendChatMessage(14, 0, "Too easy!")
		pUnit:PlaySoundToSet(12466)
	end
end

function Brut_OnDied(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Agghh! Well done! Now this gets... interesting...")
	pUnit:PlaySoundToSet(12471)
	pUnit:RemoveEvents()	
end


function Enrage(pUnit, Event)
	pUnit:CastSpell(26662)
	pUnit:SendChatMessage(14, 0, "So much for a real challenge. Die!")
	pUnit:PlaySoundToSet(12470)
end

function Stomp(pUnit, Event)
	local stomptarget = pUnit:GetMainTank();
	pUnit:FullCastSpellOnTarget(45185, stomptarget)
	stomptarget:RemoveAura(46394)	
end

function Burn(pUnit, Event)
	pUnit:CastSpellOnTarget(46394, pUnit:GetRandomPlayer(0))	
end

--[[function Meteor_Slash(pUnit, Event)
	pUnit:FullCastSpell(45150)
end]]

function Combat_Talk(pUnit, Event)
	local Choice = math.random(1, 3)
	if(Choice == 1) then
		pUnit:SendChatMessage(14, 0, "I will crush you!")
		pUnit:PlaySoundToSet(12467)
	elseif(Choice == 2) then
		pUnit:SendChatMessage(14, 0, "Another day, another glorious battle!")
		pUnit:PlaySoundToSet(12468)
	elseif(Choice == 3) then
		pUnit:SendChatMessage(14, 0, "I live for this!")
		pUnit:PlaySoundToSet(12469)
	end	
end

RegisterUnitEvent(24882, 1, "Brut_OnCombat")
RegisterUnitEvent(24882, 2, "Brut_OnLeaveCombat")
RegisterUnitEvent(24882, 3, "Brut_OnKilledTarget")
RegisterUnitEvent(24882, 4, "Brut_OnDied")