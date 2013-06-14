--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Grimton1337; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2011 - 2013. ]]

local Romogg = nil

Romogg = {}
function Romogg_OnSpawn(pUnit, event)
Romogg = pUnit
end

RegisterUnitEvent(39665, 18, "Romogg_OnSpawn")

function Romogg_OnCombat(pUnit, event)
Romogg:SendChatMessage(14, 0, "Boss Cho'gall not gonna be happy 'bout dis!")
Romogg:PlaySoundToSet(18925)
Romogg:RegisterEvent(Quake, math.random(20000, 38500), 0)
Romogg:RegisterEvent(WoundingStrike, math.random(15000, 36000), 0)
Romogg:RegisterEvent(CallForHelp, math.random(27000, 40000), 0)
Romogg:RegisterEvent(ChainsOfWoe, 1, 0) -- Why? Because his health needs to be 66% in order to do this. More Information at line: 35 :)
end

RegisterUnitEvent(39665, 1, "Romogg_OnCombat")

function Quake(pUnit, event)
Romogg:FullCastSpell(75272)
Romogg:Root()
Romogg:RegisterEvent(UnRootCrap, 3000, 1) -- 3 seconds, because the casting is 3 seconds + 2 seconds to unleash the Angered Earth. ^^
end

function UnRootCrap(pUnit, event)
Romogg:UnRoot()
end

function WoundingStrike(pUnit, event)
local tank = Romogg:GetMainTank()
Romogg:FullCastSpellOnTarget(69651, tank)
end

function CallForHelp(pUnit, event)
Romogg:FullCastSpell(82137)
end

function ChainsOfWoe(pUnit, event)
if(Romogg:GetHealthPct() <= 66) then
Romogg:RemoveEvents() -- Back to line 14, this is why :-)!
Romogg:FullCastSpell(75539)
Romogg:Root() -- If the players are scumbags and move away from him, he might bug sometimes, so... Root ^^!
Romogg:RegisterEvent(UnRootShit, 2000, 1) -- 2 seconds, because the casting of the spell is 2 seconds. :P
end
end

function UnRootShit(pUnit, event)
Romogg:UnRoot()
Romogg:FullCastSpell(75543)
Romogg:SendChatMessage(42, 0, "Rom'ogg Bonecrusher prepares to unleash The Skullcracker on nearby enemies!")
Romogg:SendChatMessage(14, 0, "Stand still! Rom'ogg crack your skulls!")
Romogg:PlaySoundToSet(18927)
Romogg:RegisterEvent(Quake1, math.random(20000, 38500), 0)
Romogg:RegisterEvent(WoundingStrike1, math.random(15000, 36000), 0)
Romogg:RegisterEvent(CallForHelp1, math.random(27000, 40000), 0)
Romogg:RegisterEvent(ChainsOfWoe1, 1, 0)
end

function Quake1(pUnit, event)
Romogg:FullCastSpell(75272)
Romogg:Root()
Romogg:RegisterEvent(UnRootCrap1, 3000, 1) -- 3 seconds, because the casting is 3 seconds + 2 seconds to unleash the Angered Earth. ^^
end

function UnRootCrap1(pUnit, event)
Romogg:UnRoot()
end

function WoundingStrike1(pUnit, event)
local tank = Romogg:GetMainTank()
Romogg:FullCastSpellOnTarget(69651, tank)
end

function CallForHelp1(pUnit, event)
Romogg:FullCastSpell(82137)
end

function ChainsOfWoe1(pUnit, event)
if(Romogg:GetHealthPct() <= 33) then
Romogg:RemoveEvents()
Romogg:FullCastSpell(75539)
Romogg:Root()
Romogg:RegisterEvent(UnRootShit1, 2000, 1)
end
end

function UnRootShit1(pUnit, event)
Romogg:UnRoot()
Romogg:FullCastSpell(75543)
Romogg:SendChatMessage(42, 0, "Rom'ogg Bonecrusher prepares to unleash The Skullcracker on nearby enemies!")
Romogg:SendChatMessage(14, 0, "Stand still! Rom'ogg crack your skulls!")
Romogg:PlaySoundToSet(???)
Romogg:RegisterEvent(Quake2, math.random(20000, 38500), 0)
Romogg:RegisterEvent(WoundingStrike2, math.random(15000, 36000), 0)
Romogg:RegisterEvent(CallForHelp2, math.random(27000, 40000), 0)
end

function Quake2(pUnit, event)
Romogg:FullCastSpell(75272)
Romogg:Root()
Romogg:RegisterEvent(UnRootCrap2, 3000, 1) -- 3 seconds, because the casting is 3 seconds + 2 seconds to unleash the Angered Earth. ^^
end

function UnRootCrap2(pUnit, event)
Romogg:UnRoot()
end

function WoundingStrike2(pUnit, event)
local tank = Romogg:GetMainTank()
Romogg:FullCastSpellOnTarget(69651, tank)
end

function CallForHelp2(pUnit, event)
Romogg:FullCastSpell(82137)
end

function Romogg_OnKilledPlayer(pUnit, event)
Romogg:SendChatMessage(14, 0, "That what you get! Nothing!")
Romogg:PlaySoundToSet(18926)
end

RegisterUnitEvent(39665, 3, "Romogg_OnKilledPlayer")

function Romogg_OnDeath(pUnit, event)
Romogg:SendChatMessage(14, 0, "Rom'ogg...sorry...")
Romogg:PlaySoundToSet(18928)
end

RegisterUnitEvent(39665, 4, "Romogg_OnDeath")