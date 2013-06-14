--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: LUA++; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

math.randomseed(os.time())

function RammsteinTheGorger_Trample(pUnit)
    pUnit:FullCastSpell(15550)
end

function RammsteinTheGorger_Knockout(pUnit)
    if(pUnit:GetMainTank() ~= nil) then
	    pUnit:FullCastSpellOnTarget(17307, pUnit:GetMainTank())
	end
end

function RammsteinTheGorger_OnCombat(pUnit)
	pUnit:SendChatMEssage(12, 0, "Ramstein hunger for flesh!")
    pUnit:RegisterEvent("RammsteinTheGorger_Trample", math.random(10000,13000), 0)
	pUnit:RegisterEvent("RammsteinTheGorger_Knockout", math.random(18000,23000), 0)
end

function RammsteinTheGorger_LeaveCombat(pUnit)
    pUnit:RemoveEvents()
end

function RammsteinTheGorger_OnDied(pUnit)
    pUnit:RemoveEvents()
	pUnit:GetGameObjectNearestCoords(4033.708740, -3392.695068, 119.738738, 175405):ActivateGameObject()
	pUnit:GetGameObjectNearestCoords(4032.716064, -3365.038330, 115.056511, 175796):ActivateGameObject()
end

RegisterUnitEvent(10439, 1, "RammsteinTheGorger_OnCombat")
RegisterUnitEvent(10439, 2, "RammsteinTheGorger_LeaveCombat")
RegisterUnitEvent(10439, 4, "RammsteinTheGorger_OnDied")