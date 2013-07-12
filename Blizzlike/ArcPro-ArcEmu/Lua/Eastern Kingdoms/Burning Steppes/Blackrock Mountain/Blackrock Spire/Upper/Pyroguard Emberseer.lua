--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

math.randomseed(os.time());

local blackhand = 10316
local pyroguard = 9816
local encage_pyro = 15281
local encaged_pyro = 15282
local encage = 16045
local altar = 175706
local grow_emberseer = 16049
local emberseer_complete = 16052
local emberseer_lightning = 16078
local door1 = 175244
local door2 = 175153

function Pyroguard_Event(Unit, Event)
        local go =  Unit:GetGameObjectNearestCoords(114.407143, -258.893585, 91.548134, door2)
		if(go ~= nil) then
            go:SetUInt32Value(GAMEOBJECT_FLAGS, GAMEOBJECT_UNCLICKABLE)
        end
        local pyro = Unit:GetCreatureNearestCoords(144.401993, -258.036987, 96.323303, pyroguard)
        if(pyro ~= nil) then
                setvars(pyro,{warlocks = {},plrs = {}})
                local tbl = pyro:GetInRangeFriends()
                local args = getvars(pyro)
                --for i = 1,3 do Create blank entries
                        --args.plrs[i]= 1
                --end
                for k,v in pairs(tbl) do
            if(v~= nil) then
                if(v:GetEntry() == blackhand) then
					table.insert(args.warlocks, v)
                    v:SetUInt32Value(UNIT_FIELD_CHANNEL_OBJECT, pyro:GetGUID())
                    v:SetUInt32Value(UNIT_CHANNEL_SPELL, encage_pyro)
                    v:Root()
                    v:SetCombatCapable(1)
                end
            end
        end
        pyro:SetCombatCapable(1)
        pyro:Root()
        pyro:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_2)
        pyro:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE)
        pyro:CastSpell(encaged_pyro)
    end
end

function Altar_Activate(Unit, Event, pMisc) 
    local pyro = Unit:GetCreatureNearestCoords(144.401993, -258.036987, 96.323303, pyroguard)
    local args = getvars(pyro)
    table.insert(args.plrs, pMisc)
    pMisc:SetUInt32Value(UNIT_FIELD_CHANNEL_OBJECT, Unit:GetGUID())
    pMisc:SetUInt32Value(UNIT_CHANNEL_SPELL, 16532)
    if((table.getn(args.plrs) ~= nil) and (table.getn(args.plrs) >= 1)) then
		for k,v in pairs(args.warlocks) do
			v:SetUInt32Value(UNIT_FIELD_CHANNEL_OBJECT, 0)-- stop channeling
			v:SetUInt32Value(UNIT_CHANNEL_SPELL, 0)
			v:Unroot()
			v:SetCombatCapable(0)
			v:RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_2)
			v:AttackReaction(args.plrs[math.random(1, table.getn(args.plrs))], 1, 0)
		end
		local pyro = Unit:GetCreatureNearestCoords(144.401993, -258.036987, 96.323303, pyroguard)
		if(pyro ~= nil) then
			pyro:RemoveAura(encaged_pyro)
		end
	end
    Unit:RemoveFromWorld()
    pMisc:SetUInt32Value(UNIT_FIELD_CHANNEL_OBJECT, 0)
    pMisc:SetUInt32Value(UNIT_CHANNEL_SPELL, 0)
end

function blackhandwarlock_oncombat(Unit, Event)
    Unit:SetUInt32Value(UNIT_FIELD_FLAGS, 0)
    Unit:RegisterEvent("blackhandwarlock_spells", 10000, 1)
end

function blackhandwarlock_spells(Unit, Event)
	local rand = math.random(1,2)
	local tank = Unit:GetMainTank()
    if(Unit:GetCurrentSpellId() ~= nil) then
        if((rand == 1) and (tank ~= nil)) then
            Unit:FullCastSpellOnTarget(15580, tank)
            Unit:RegisterEvent("blackhandwarlock_spells", 5000, 1)
        elseif(rand == 2) then
            if(math.random(1,3) == 1) then
                Unit:FullCastSpell(encage,tank)
                Unit:RegisterEvent("blackhandwarlock_spells", 10000, 1)
            end
        end
    end
end

function blackhandwarlock_ondeath(Unit, Event)
        Unit:RemoveEvents()
        local args = getvars(Unit)
        for k,v in pairs(args.warlocks) do
        if(v == Unit) then
            table.remove(args.warlocks, k)
        end
    end
    if((table.getn(args.warlocks) ~= nil) and (table.getn(args.warlocks) == 0)) then
        local pyro = Unit:GetCreatureNearestCoords(144.401993, -258.036987, 96.323303, pyroguard)
        if(pyro ~= nil) then
            pyro:SendChatMessage(16, 0, pyro:GetName().." grows stronger!..")
            pyro:AttackReaction(pyro:GetRandomPlayer(0), 1, 0)
        end
    end
end

function PyroGuard_Engaged(Unit, Event)
    Unit:CastSpell(emberseer_lightning)
    Unit:SetFloatValue(OBJECT_FIELD_SCALE_X, (Unit:GetFloatValue(OBJECT_FIELD_SCALE_X))+1)
    Unit:WipeThreatList()
    Unit:RegisterEvent("PyroGuard_Complete", 20000, 1)
end

function PyroGuard_Complete(Unit, Event)
    Unit:CastSpell(emberseer_complete)
    Unit:RegisterEvent("PyroGuard_Attack", 3000, 1)
end

function PyroGuard_Attack(Unit, Event)
    Unit:RemoveEvents()
    Unit:SetUInt32Value(UNIT_FIELD_FLAGS, 0)
    Unit:WipeThreatList()
    Unit:Unroot()
    Unit:SetCombatCapable(0)
    Unit:RegisterEvent("PyroGuard_Spells", 5000, 1)
end

function PyroGuard_OnWipe(Unit, Event)
    Unit:RemoveEvents()
    local args = getvars(Unit)
    for k,v in pairs(args.warlocks) do
		if(v ~= nil) then
			v:RemoveFromWorld()
		end
    end
    Unit:Despawn(0,0)
end

function PyroGuard_Spells(Unit, Event)
    local rand = math.random(1,2)
    if(Unit:GetRandomPlayer(0) ~= nil) then
        if(rand == 1) then
            Unit:FullCastSpell(16079)
        elseif(rand == 2) then
            Unit:FullCastSpellOnTarget(16536, Unit:GetRandomPlayer(0))
        end
    end
    Unit:RegisterEvent("PyroGuard_Spells", 10000, 1)
end

function PyroGuard_Death(Unit, Event)
    local go =  Unit:GetGameObjectNearestCoords(114.407143, -258.893585,91.548134, door2)
    Unit:SpawnCreature(16082, 158.484741, -412.313080, 110.862953, Unit:GetO(), 14, 0)
    if(go ~= nil) then
        go:SetUInt32Value(GAMEOBJECT_STATE, 0)
    end
end

RegisterGameObjectEvent(door1, 4, "Pyroguard_Event")
RegisterGameObjectEvent(altar, 4, "Altar_Activate")
RegisterUnitEvent(blackhand, 1, "blackhandwarlock_oncombat")
RegisterUnitEvent(blackhand, 4, "blackhandwarlock_ondeath")
RegisterUnitEvent(pyroguard, 1, "PyroGuard_Engaged")
RegisterUnitEvent(pyroguard, 4, "PyroGuard_Death")
RegisterUnitEvent(pyroguard, 2, "PyroGuard_OnWipe")