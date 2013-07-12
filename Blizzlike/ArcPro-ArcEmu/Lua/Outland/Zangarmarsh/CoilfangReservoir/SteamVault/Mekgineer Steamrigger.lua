--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Steamrigger(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Steamrigger_healtA", 1000, 1)
	Unit:RegisterEvent("Steamrigger_healtB", 1000, 1)
	Unit:RegisterEvent("Steamrigger_healtC", 1000, 1)
	Unit:RegisterEvent("Steamrigger_Shrink", 7000, 0)
	Unit:RegisterEvent("Steamrigger_Blade", 14000, 0)
	Unit:RegisterEvent("Steamrigger_Net", 210000, 0)
end

function Steamrigger_healtA(Unit)
	if((Unit:GetHealthPct() < 75) and (Didthat == 0)) then
		Unit:SpawnCreature(17951, -339.8, -137.7, 6.9, 0, 0, 18, 36000000);
		Unit:SpawnCreature(17951, -327.5, -136.1, 8.2, 0, 0, 18, 36000000);
		Unit:SpawnCreature(17951, -312, -118.7, 8, 0, 0, 18, 36000000);
		Didthat = 1
	else
	end
end

function Steamrigger_healtB(Unit)
	if((Unit:GetHealthPct() < 50) and (Didthat == 1)) then
		Unit:SpawnCreature(17951, -339.8, -137.7, 6.9, 0, 0, 18, 36000000);
		Unit:SpawnCreature(17951, -327.5, -136.1, 8.2, 0, 0, 18, 36000000);
		Unit:SpawnCreature(17951, -312, -118.7, 8, 0, 0, 18, 36000000);
		Didthat = 2
	else
	end
end

function Steamrigger_healtC(Unit)
	if((Unit:GetHealthPct() < 25) and (Didthat == 2)) then
		Unit:SpawnCreature(17951, -339.8, -137.7, 6.9, 0, 0, 18, 36000000);
		Unit:SpawnCreature(17951, -327.5, -136.1, 8.2, 0, 0, 18, 36000000);
		Unit:SpawnCreature(17951, -312, -118.7, 8, 0, 0, 18, 36000000);
		Didthat = 3
	else
	end
end

function Steamrigger_Shrink(Unit)
	Unit:FullCastSpell(31485)
	Unit:SendChatMessage(11, 0, "You can do better then that...")
end

function Steamrigger_Blade(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(37123, Unit:GetRandomPlayer())
	Unit:SendChatMessage(11, 0, "Taste my blade...")
end

function Steamrigger_Net(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(35107, Unit:GetClosestPlaye())
	Unit:SendChatMessage(11, 0, "Let's go...")
end

RegisterUnitEvent(17796, 1, "Steamrigger")