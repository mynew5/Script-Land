--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function PSR_OnSpawn(pUnit, Event)
local chance = math.random(1,4)
	if(chance == 1) then
		pUnit:SendChatMessage(12, 0, "Drink up! There's more where that came from!")
	elseif(chance == 2) then
		pUnit:SendChatMessage(12, 0, "Enjoy! You won't find better ale anywhere!")
	elseif(chance == 3) then
		pUnit:SendChatMessage(12, 0, "Have you tried the Dark Iron Ale? Its the best!")
	else
		pUnit:SendChatMessage(12, 0, "Try the boar! It's my new recipe!")
	end
end

function PSR_OnCombat(pUnit, Event)
local chance = math.random(1,7)
	if(chance == 1) then
		pUnit:SendChatMessage(14, 0, "That's it! No more beer until this mess is sorted out!")
	elseif(chance == 2) then
		pUnit:SendChatMessage(14, 0, "That's it! You're going down!")
	elseif(chance == 3) then
		pUnit:SendChatMessage(14, 0, "What are you doing over there?")
	elseif(chance == 4) then
		pUnit:SendChatMessage(14, 0, "No Stealing the goods!")
	elseif(chance == 5) then
		pUnit:SendChatMessage(14, 0, "Hey, my pockets were picked!")
	elseif(chance == 6) then
		pUnit:SendChatMessage(14, 0, "Hey! Stop that!")
	else
		pUnit:SendChatMessage(14, 0, "Hey! Get away from that!")
	end
	pUnit:RegisterEvent("CurseofTongues", 7000, 0)
	pUnit:RegisterEvent("DemonArmor", 14000, 0)
	pUnit:RegisterEvent("ShadowBolt", 21000, 0)
	pUnit:RegisterEvent("Immolate", 28000, 0)
	pUnit:RegisterEvent("Banish", 35000, 0)
end

function CurseofTongues(pUnit, Event)
	pUnit:CastSpellOnTarget(13338)
end

function Banish(pUnit, Event)
	pUnit:FullCastSpellonTarget(8994)
end

function DemonArmor(pUnit, Event)
	pUnit:CastSpell(13787)
end

function Immolate(pUnit, Event)
	pUnit:FullCastSpellonTarget(12742)
end

function ShadowBolt(pUnit, Event)
	pUnit:FullCastSpellonTarget(12739)
end

function PSR_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function PSR_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9499, 1, "PSR_OnCombat")
RegisterUnitEvent(9499, 2, "PSR_OnLeaveCombat")
RegisterUnitEvent(9499, 4, "PSR_OnDeath")
RegisterUnitEvent(9499, 5, "PSR_OnSpawn")