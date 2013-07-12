--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Performer, GregPohlod
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

--[[Nalorakk yells: Da Amani gonna rule again!
Nalorakk yells: Get da move on, guards! It be killin' time!
Nalorakk yells: Guards, go already! Who you more afraid of, dem... or me?
Nalorakk yells: I be losin' me patience! Go on: make dem wish dey was never born!
Nalorakk yells: I bring da pain!
Nalorakk yells: I smell you, strangers. Don't be delayin' your fate. Come to me now. I make your sacrifice quick.
Nalorakk yells: Mua-ha-ha!
Nalorakk yells: Ride now! Ride out dere and bring me back some heads!
Nalorakk yells: What could be better than servin' da bear spirit for eternity? Come closer now. Bring your souls to me!]]

function Nalorakk_OnCombat(Unit, event, miscUnit, misc)
	Unit:SendChatMessage(14, 0, "You be dead soon enough!")
	Unit:RegisterEvent("Nalorakk_Bear", 68000, 1)
	Unit:RegisterEvent("Nalorakk_Troll", 168000, 1)
	Unit:RegisterEvent("Nalorakk_Bear2", 291000, 1)
	Unit:RegisterEvent("Nalorakk_Troll2", 378000, 1)
	Unit:RegisterEvent("Nalorakk_Bear3", 487000, 1)
	Unit:RegisterEvent("Nalorakk_Troll3", 554000, 1)
	Unit:RegisterEvent("Nalorakk_Brutal_Swipe", 13000, 4)
	Unit:RegisterEvent("Nalorakk_Mangle", 29000, 2)
	Unit:RegisterEvent("Nalorakk_Surge", 21000, 3)
end

function Nalorakk_Bear(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Nalorakk_Lacerating_Slash", 28000, 3)
	Unit:RegisterEvent("Nalorakk_Rend_Flesh", 18000, 5)
	Unit:RegisterEvent("Nalorakk_Deafening_Roar", 24000, 4)
	Unit:SendChatMessage(14, 0, "You call on da beast, you gonna get more dan you bargain for!!")
	Unit:SetModel(21635)
	Unit:SetScale(2)
end

function Nalorakk_Bear2(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Nalorakk_Lacerating_Slash", 28000, 3)
	Unit:RegisterEvent("Nalorakk_Rend_Flesh", 18000, 4)
	Unit:RegisterEvent("Nalorakk_Deafening_Roar", 24000, 3)
	Unit:SendChatMessage(14, 0, "You call on da beast, you gonna get more dan you bargain for!!")
	Unit:SetModel(21635)
	Unit:SetScale(2)
end

function Nalorakk_Bear3(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Nalorakk_Lacerating_Slash", 28000, 2)
	Unit:RegisterEvent("Nalorakk_Rend_Flesh", 18000, 3)
	Unit:RegisterEvent("Nalorakk_Deafening_Roar", 24000, 2)
	Unit:SendChatMessage(14, 0, "You call on da beast, you gonna get more dan you bargain for!!")
	Unit:SetModel(21635)
	Unit:SetScale(2)
end

function Nalorakk_Troll(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Nalorakk_Brutal_Swipe", 13000, 9)
	Unit:RegisterEvent("Nalorakk_Mangle", 29000, 4)
	Unit:RegisterEvent("Nalorakk_Surge", 21000, 6)
	Unit:SendChatMessage(14, 0, "Make way for da Nalorakk!")
	Unit:SetModel(21631)
	Unit:SetScale(1)
end

function Nalorakk_Troll2(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Nalorakk_Brutal_Swipe", 13000, 8)
	Unit:RegisterEvent("Nalorakk_Mangle", 27000, 4)
	Unit:RegisterEvent("Nalorakk_Surge", 21000, 5)
	Unit:SendChatMessage(14, 0, "Make way for da Nalorakk!")
	Unit:SetModel(21631)
	Unit:SetScale(1)
end

function Nalorakk_Troll3(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Nalorakk_Brutal_Swipe", 13000, 0)
	Unit:RegisterEvent("Nalorakk_Mangle", 29000, 0)
	Unit:RegisterEvent("Nalorakk_Surge", 21000, 0)
	Unit:SendChatMessage(14, 0, "Make way for da Nalorakk!")
	Unit:SetModel(21631)
	Unit:SetScale(1)
end

function Nalorakk_Brutal_Swipe(pUnit, event, miscUnit, misc)
	pUnit:FullCastSpellOnTarget(42384, pUnit:GetMainTank())
end

function Nalorakk_Mangle(pUnit, event, miscUnit, misc)
	pUnit:FullCastSpellOnTarget(33987, pUnit:GetMainTank())
end

function Nalorakk_Surge(pUnit, event, miscUnit, misc)
	pUnit:FullCastSpellOnTarget(42402, pUnit:GetRandomPlayer(0))
end

function Nalorakk_Lacerating_Slash(pUnit, event, miscUnit, misc)
	pUnit:FullCastSpellOnTarget(42395, pUnit:GetMainTank())
end

function Nalorakk_Rend_Flesh(pUnit, event, miscUnit, misc)
	pUnit:FullCastSpellOnTarget(42397, pUnit:GetMainTank())
end

function Nalorakk_Deafening_Roar(pUnit, event, miscUnit, misc)
	pUnit:CastSpell(42398, pUnit:GetMainTank())
end

function Nalorakk_OnLeaveCombat(Unit, event, miscUnit, misc)
	Unit:RemoveEvents()
	Unit:SetModel(21631)
end

function Nalorakk_OnDied(Unit, event, miscUnit, misc)
	Unit:RemoveEvents()
	Unit:SendChatMessage(14, 0, "I... be waitin' on da udda side....")
end

function Nalorakk_OnKilledTarget(Unit, event, miscUnit, misc)
	Unit:SendChatMessage(14, 0, "Now whatchoo got to say?")
end

RegisterUnitEvent(23576, 1, "Nalorakk_OnCombat")
RegisterUnitEvent(23576, 2, "Nalorakk_OnLeaveCombat")
RegisterUnitEvent(23576, 3, "Nalorakk_OnKilledTarget")
RegisterUnitEvent(23576, 4, "Nalorakk_OnDied")