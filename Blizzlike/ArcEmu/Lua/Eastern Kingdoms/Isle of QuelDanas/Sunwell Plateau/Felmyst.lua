--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: BrantX; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Felmyst_OnEnterCombat(Unit,Event)
	Unit:Land()
	Unit:RegisterEvent("Felmyst_Cleave", 20000, 0)
	Unit:RegisterEvent("Felmyst_Corrosion", 36000, 0)
	Unit:RegisterEvent("Felmyst_GasNova", 30000, 0)
	Unit:RegisterEvent("Felmyst_NoxiousFumes", 27000, 0)
	Unit:RegisterEvent("Felmyst_Encapsulate", 45000, 0)
	--Unit:RegisterEvent("Felmyst_FogofCorruption", 000, 0)
	Unit:RegisterEvent("Felmyst_Enrage", 600000, 0)
	Unit:RegisterEvent("Felmyst_Phase2", 75000, 0)
end

function Felmyst_OnSpawn(Unit,Event)
	Unit:SetFlying()
	--Unit:MoveTo(X,Y,Z) She needs to move to the raid, Flys in and then lands.
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Glory to Kil'jaeden! Death to all who oppose!")
end

function Felmyst_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Felmyst_OnDied(Unit,Event)
	Unit:RemoveEvents()
	--Unit:SpawnCreature(ID,X,Y,Z,O,Faction,0)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Kil'jaeden... will... prevail...")
end

function Felmyst_OnKilledPlayer(Unit,Event)
	local Choice = math.random(1, 2)
	if(Choice == 1) then
		pUnit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "I kill for the master!")
	elseif(Choice == 2) then
		pUnit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL, LangField.LANG_UNIVERSAL, "The end has come!")
	end
end

function Felmyst_Phase2(Unit,Event)
	Unit:SetFlying()
	Unit:RegisterEvent("Felmyst_DemonicVapor",000,0)
	Unit:RegisterEvent("Felmyst_Land",000,0)
end

RegisterUnitEvent(25038, 1, "Felmyst_OnEnterCombat")
RegisterUnitEvent(25038, 2, "Felmyst_OnLeaveCombat")
RegisterUnitEvent(25038, 3, "Felmyst_OnKilledPlayer")
RegisterUnitEvent(25038, 4, "Felmyst_OnDied")