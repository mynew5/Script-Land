--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Grimton1337; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2011 - 2013. ]]

local Karsh = nil

Karsh = {}
function Karsh_OnSpawn(pUnit, event)
Karsh = pUnit
end

RegisterUnitEvent(39698, 18, "Karsh_OnSpawn")

function Karsh_OnCombat(pUnit, event)
Karsh:SendChatMessage(14, 0, "Bodies to test my armaments upon!")
Karsh:PlaySoundToSet(18852)
Karsh:RegisterEvent(BurningMetal, math.random(25000, 40000), 0)
Karsh:RegisterEvent(HeatWave, math.random(18000, 32510), 0)
Karsh:RegisterEvent(QuicksilverArmor, math.random(22000, 33000), 0)
Karsh:RegisterEvent(SuperHeatedQuicksilverArmor, math.random(30000, 50000), 0)
Karsh:RegisterEvent(Cleave, math.random(15000, 31000), 0)
Karsh:RegisterEvent(LavaSpout, math.random(40000, 50000), 0)
end

RegisterUnitEvent(39698, 1, "Karsh_OnCombat")

function BurningMetal(pUnit, event)
local tank = Karsh:GetMainTank()
Karsh:FullCastSpellOnTarget(76002, tank)
end

function HeatWave(pUnit, event)
Karsh:FullCastSpell(63677)
end

function QuickSilverArmor(pUnit, event)
Karsh:FullCastSpell(75842)
end

function SuperHeatedQuicksilverArmor(pUnit, event)
Karsh:SendChatMessage(14, 0, "Feel the burn!")
Karsh:PlaySoundToSet(18854)
Karsh:FullCastSpell(75846)
end

function Cleave(pUnit, event)
Karsh:FullCastSpell(845)
end

function LavaSpout(pUnit, event)
Karsh:FullCastSpell(76007)
end

function Karsh_OnKilledPlayer(pUnit, event)
Karsh:SendChatMessage(14, 0, "Merely an impurity in the compound!")
Karsh:PlaySoundToSet(18853)
end

RegisterUnitEvent(39698, 3, "Karsh_OnKilledPlayer")

function Karsh_OnDeath(pUnit, event)
Karsh:RemoveEvents() -- Stop Repeating, Jesper. :P
Karsh:SendChatMessage(14, 0, "We number in the millions! Your efforts are wasted...")
Karsh:PlaySoundToSet(18855)
end

RegisterUnitEvent(39698, 4, "Karsh_OnKilledPlayer")