--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

local healing_ward = 14987
local powerful_healing = 24311
local hexxer = 11380
local delusions = 24306
local hexxer_hex = 17172
local shade = 14986
local shade_shock = 24458
local shade_visual = 24313
local coords = {
{x =-11582.373047, y=-1257.175781, z = 77.547829},
{x =-11585.643555, y=-1255.902100, z = 77.547829},
{x =-11587.205078, y=-1251.681641, z = 77.547829},
{x =-11586.676758, y=-1248.007202, z = 77.547829},
{x =-11579.822266, y=-1246.633545, z = 77.547424},
{x =-11578.796875, y=-1252.417603, z = 77.547424},
{x =-11580.839844, y=-1256.166626, z = 77.547699},
{x =-11584.952148, y=-1255.456299, z = 77.547699}
}

function Hexxer_OnCombat(Unit, Event)
	setvars(Unit,{shades = {},skeles = {}})
	Unit:RegisterEvent("Hexxer_HealingWard", 5000, 1)
	Unit:RegisterEvent("Hexxer_Hex", 15000, 1)
	Unit:RegisterEvent("Hexxer_Delusions", 10000, 1)
	Unit:RegisterEvent("Hexxer_Teleport", 30000, 1)
	Unit:RegisterEvent("Hexxer_SpawnTrolls", 500, 8)
end

function Hexxer_SpawnTrolls(Unit, Event)
	Unit:SpawnCreature(14826,coords[x],coords[y],coords[z], 0, 16, 30000)
end

function Hexxer_OnWipe(Unit, Event)
	Unit:RemoveEvents()
	local args = getvars(Unit)
	for k,v in pairs(args.shades) do
		v:RemoveFromWorld()
	end
	for k,v in pairs(args.skeles) do
		v:RemoveFromWorld()
	end
end

function Hexxer_OnDied(Unit, Event)
	Unit:RemoveEvents()
	local args = getvars(Unit)
	for k,v in pairs(args.shades) do
		v:RemoveFromWorld()
	end
	for k,v in pairs(args.skeles) do
		v:RemoveFromWorld()
	end
end


RegisterUnitEvent(hexxer, 1, "Hexxer_OnCombat")
RegisterUnitEvent(hexxer, 2, "Hexxer_OnWipe")
RegisterUnitEvent(hexxer, 4, "Hexxer_OnDied")

-------------------------------------------------------------------------------
------------------------HOOKED EVENTS END--------------------------------------
-------------------------------------------------------------------------------

function Hexxer_HealingWard(Unit, Event)
	Unit:FullCastSpell(24309)
	Unit:RegisterEvent("Hexxer_HealingWard", 5000, 1)
end
function Hexxer_Hex(Unit, Event)
	local tank = Unit:GetMainTank()
	local offtank = Unit:GetAddTank()
	if tank ~= nil and offtank ~= nil then
		Unit:FullCastSpellOnTarget(hexxer_hex,tank)
		Unit:SetNextTarget(offtank)
	end
	Unit:RegisterEvent("Hexxer_Hex", 15000, 1)
end
function Hexxer_Delusions(Unit, Event)
	local args = getvars(Unit)
	local plr = Unit:GetRandomPlayer(0)
	if plr ~= nil then
		Unit:FullCastSpellOnTarget(delusions, plr)
		table.insert(args.shades, Unit:SpawnCreature(shade, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), Unit:GetUInt32Value(UNIT_FIELD_FACTIONTEMPLATE), 0))
	end
	Unit:RegisterEvent("Hexxer_Delusions", 10000, 1)
end
function Hexxer_Teleport(Unit, Event)
	local plr = Unit:GetRandomPlayer(0)
	if plr ~= nil then
		Unit:FullCastSpellOnTarget(24466, plr)
		plr:Teleport(309, -11583.710938, -1250.584717, 77.546814)
	end
	Unit:RegisterEvent("Hexxer_Teleport", 30000, 1)
end
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------

function healing_wardspawn(Unit, Event)
	Unit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FIELD_NOT_ATTACKBLE_2)
	Unit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FIELD_NOT_SELECTABLE)
	Unit:SetCombatCapable(1)
	Unit:Root()
	Unit:RegisterEvent("healing_wardtick", 3000, 1)
end
function healing_wardtick(Unit, Event)
	local tbl = Unit:GetInRangeFriends()
	for k,v in pairs(tbl) do
		if v ~= nil then
			if v:GetEntry() == hexxer then
				Unit:FullCastSpelOnTarget(powerful_healing, v)
			end
		end
		break
	end
	Unit:RegisterEvent("healing_wardtick", 3000, 1)
end
function healing_warddeath(Unit, Event)
	Unit:RemoveEvents()
	Unit:RemoveFromWorld()
end

RegisterUnitEvent(healing_ward, 18, "healing_wardspawn")
RegisterUnitEvent(healing_ward, 4, "healing_warddeath")

-------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------

function Shade_OnSpawn(Unit, Event)
	Unit:CastSpell(shade_visual)
	Unit:SetUInt32Value(UNIT_FIELD_MINDAMAGE, 1)
	Unit:SetUInt32Value(UNIT_FIELD_MAXDAMAGE, 1)
	Unit:RegisterEvent("ShadeUpdate", 20000, 1)
end
function ShadeUpdate(Unit, Event)
	Unit:WipeCurrentTarget()
	Unit:RegisterEvent("ShadeUpdate", 20000,1)
end
function Shade_Interrupt(Unit, Event, pMisc)
	if pMisc:GetCurrentSpellId() ~= nil then
		pMisc:InterruptSpell()
	end
	if math.random(0,10) == 1 then
		Unit:FullCastSpellOnTarget(shade_shock, pMisc)
	end
end
function Shade_OnDeath(Unit, Event)
	local args = getvars(Unit)
	for k,v in pairs(args.shades) do
		if v~= nil and v == Unit then
			table.remove(args.shades, v)
		end
		break
	end
end

RegisterUnitEvent(shade, 18, "Shade_OnSpawn")
RegisterUnitEvent(shade, 4, "Shade_OnDeath")
RegisterUnitEvent(shade, 13, "Shade_Interrupt")