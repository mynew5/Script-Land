--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

--Notes     : Below is a query to insert the column of fire npc into your db if you don't have it, be sure to check and add it if it isn't there.
--Known Bugs: During Phase 3 (Eagle Phase) Zul'jin should add a debuff on players called energy storm, it seems that spell doesn't work.
--            Although this debuff should go onto the entire raid, we can use GetInRangePlayers to run through the whole raid group to
--            do the same effect and cast the zap spell on them when they cast, but I am not sure how GetCurrentSpell or GetCurrentSpellId
--            works, so that part of his phase doesn't work.
--          : The feather vortexes does a knockback spell, not sure which spell it is as I was not able to find any information on it, so I
--            used a spell that does the same, but it has a small cyclone animation with the spell which I have not seen in any screenshots
--            or movies I have watched, so it might not be the correct spell.
--          : The Flame wall doesn't go up, don't see a way to activate game objects.
--Sql Qeury : insert into `creature_proto` values(24187,70,70,14,80000,85000,1000,1,0,1600,0,500,800,0,0,0,0,0,0,0,0,0,0,0,0,0,1800000,6807,0,0,0,0,0,0,1,0,'0',0,0,0,0,2.5,8,14,0,0,0,0,0,0)

function npc_zuljin_addphase( phase, maxhp, minhp, combat, spell, sound, phrase )
	return { phase = phase, maxhp = maxhp, minhp = minhp, combat = combat, spell = spell, sound = sound, phrase = phrase }
end

local npc_zuljin_phases = {
	npc_zuljin_addphase( 1, 100, 81, 0, nil, nil, nil ),
	npc_zuljin_addphase( 2,  80, 61, 0, 42594, 12092, "Got me some new tricks...like me bruddah bear!" ),
	npc_zuljin_addphase( 3,  60, 41, 1, 42606, 12093, "Dere be no hidin' from da eagle!" ),
	npc_zuljin_addphase( 4,  40, 21, 0, 42607, 12094, "Let me introduce to you my new bruddahs: fang and claw!" ),
	npc_zuljin_addphase( 5,  20,  1, 0, 42608, 12095, "Ya don' have to look to da sky to see da dragonhawk!" )
}

function npc_zuljin_addspell( phase, timer, spell, counter, cooldown )
  return { phase = phase, timer = timer, spell = spell, counter = counter, cooldown = cooldown }
end

local npc_zuljin_spells = {
	npc_zuljin_addspell( 1, -1, 17207, -1,  2 ),
	npc_zuljin_addspell( 1, -1, 43093, -1,  3 ),
	npc_zuljin_addspell( 2, -1, 43095, -1, -1 ),
	npc_zuljin_addspell( 4, -1, 43150, 12, 10 ),
	npc_zuljin_addspell( 4, -1, 43153,  9, 16 ),
	npc_zuljin_addspell( 5, -1, 43213, -1,  2 ),
	npc_zuljin_addspell( 5, -1, 43215, -1,  2 ),
	npc_zuljin_addspell( 5, -1, 43216, -1, -1 )
}

function npc_zuljin_event_combatenter(Unit, Event)
  local vars = getvars(Unit)
	
	vars.npc_zuljin.phase   = 0
	vars.npc_zuljin.cancast = true
	vars.npc_zuljin.target  = nil
	vars.npc_zuljin.tank    = nil
	
	Unit:SendChatMessage( 14, 0, "Nobody badduh dan me." )
	Unit:PlaySoundToSet( 12091 )
 	Unit:RegisterEvent( "npc_zuljin_event_updatepulse", 250, 1 )
end

function npc_zuljin_event_combatleave(Unit, Event)
 	Unit:RemoveEvents()
	
	--remove times, the updatepulse will add new ones
	for k, v in pairs( npc_zuljin_spells ) do
	  v.timer = -1
	end

	--remove all add's, the updatepulse will spawn new ones
	local friends =	Unit:GetInRangeFriends()
	for i, j in pairs( friends ) do
		if j:GetEntry() == 24136 or j:GetEntry() == 24187 then
			j:Despawn( 1, 0 )
		end
	end
	
	--remove form, the updatepulse will set it again
	for i, j in pairs( npc_zuljin_phases ) do
		if j.spell ~= nil and	Unit:HasAura( j.spell ) then
			Unit:RemoveAura( j.spell )
		end
	end
end

function npc_zuljin_event_combatkills(Unit, Event)
  if math.random( 1, 2 ) == 1 then
	 	Unit:SendChatMessage( 14, 0, "Da Amani de chuka!" )
		Unit:PlaySoundToSet( 12098 )
	else
	 	Unit:SendChatMessage( 14, 0, "Lot more gonna fall like you!" )
		Unit:PlaySoundToSet( 12099 )
	end
end

function npc_zuljin_event_combatdying(Unit, Event)	
	Unit:SendChatMessage( 14, 0, "Mebbe me fall...but da Amani empire...never gonna die..." )
	Unit:PlaySoundToSet( 12100 )
end

function npc_zuljin_event_combatdodge(Unit, Event)
  local vars = getvars(Unit)
	
	if vars.npc_zuljin.phase == 2 then
  	local target =	Unit:GetMainTank()
		
		if target ~= nil then
			Unit:FullCastSpellOnTarget( 43456, target )
		end
	end
end

function npc_zuljin_event_Unitspawned(Unit, Event)
  setvars( Unit, { npc_zuljin = { owner = Unit, phase = 0, cancast = true, tank = nil, target = nil, counter = 0 } } )
end

function npc_zuljin_event_updatepulse(Unit, Event)
  local vars = getvars(Unit)
  --update zuljin's phase
  npc_zuljin_event_updatephase(Unit)
	--update zuljin's spells
	if vars.npc_zuljin.cancast == true then
		npc_zuljin_event_updatespell(Unit)
	end
	--update for the zap spells to players in phase 3, no way to see if players is casting yet
	npc_zuljin_event_updatestorm(Unit)
	
	--update to check cheaters, since arcemu doesn't support check for x amount of people in a raid, we have him check, you can uncomment this if you want
	npc_zuljin_event_updatecheat(Unit)
  
 	Unit:RegisterEvent( "npc_zuljin_event_updatepulse", 250, 1 )
end

function npc_zuljin_event_updatephase(Unit)
  local vars = getvars(Unit)
  for k, v in pairs( npc_zuljin_phases ) do
    if	Unit:GetHealthPct() <= v.maxhp and	Unit:GetHealthPct() >= v.minhp and vars.npc_zuljin.phase ~= v.phase then
		  local friends =	Unit:GetInRangeFriends()
		  --remove any old shapes
		  for i, j in pairs( npc_zuljin_phases ) do
		    if j.spell ~= nil and	Unit:HasAura( j.spell ) then
					Unit:RemoveAura( j.spell )
				end
		  end
		  if v.sound ~= nil and v.phrase ~= nil then
		   	Unit:SendChatMessage( 14, 0, v.phrase )
				Unit:PlaySoundToSet( v.sound )
		  end
		  if v.spell ~= nil then	Unit:FullCastSpell( v.spell ) end
		  vars.npc_zuljin.phase = v.phase
			Unit:SetCombatCapable( v.combat )
			Unit:ClearThreatList()
			if v.phase == 1 then
				npc_zuljin_spells[1].timer = os.time() + math.random( 5, 7 )
				npc_zuljin_spells[2].timer = os.time() + math.random( 7, 9 )
			end
			if v.phase == 2 then
				npc_zuljin_spells[3].timer = os.time() + math.random( 15, 20 )
			end
			if v.phase == 4 then
				npc_zuljin_spells[4].timer = os.time() + math.random( 10, 12 )
				npc_zuljin_spells[5].timer = os.time() + math.random( 14, 18 )
			end
			if v.phase == 5 then
			  npc_zuljin_spells[6].timer = os.time() + math.random( 15, 20 )
				npc_zuljin_spells[7].timer = os.time() + math.random(  8, 10 )
				npc_zuljin_spells[8].timer = os.time() + math.random(  2,  4 )
			end
			if v.phase == 3 then
		   	Unit:MoveTo(120.244835, 706.617249, 45.111404, 1.656406)
		   	Unit:FullCastSpell(43983)
				Unit:FullCastSpell(43112)
				friends = Unit:GetInRangeFriends()
				for i, j in pairs(friends) do
				  if j:GetEntry() == 24136 then
					  j:SetTauntedBy(j:GetRandomPlayer(0))
					end
				end
			end
			
			if v.phase == 4 then
			  for i, j in pairs( friends) do
			    if j:GetEntry() == 24136 then
						j:Despawn(1, 0)
					end
			  end
			end
		  setvars(Unit, vars)
		  return
		end
  end
end

function npc_zuljin_event_updatespell(Unit)
  local vars = getvars(Unit)
	
	for k, v in pairs( npc_zuljin_spells ) do
	  if os.time() > v.timer and v.timer ~= -1 and vars.npc_zuljin.phase == v.phase then
		  if v.spell == 17207 then
			 	Unit:FullCastSpell( v.spell )
				v.timer = os.time() + math.random( 5, 7 )
			end
			
			if v.spell == 43093 then
			  local target =	Unit:GetRandomPlayer( 0 )
				
				if target ~= nil then
					Unit:FullCastSpellOnTarget( v.spell, target )
				end
				v.timer = os.time() + math.random( 7, 9 )
			end
			
			if v.spell == 43095 then
				Unit:FullCastSpell( v.spell )
				Unit:RegisterEvent( "npc_zuljin_event_updateparal", 4500, 1 )
				v.timer = os.time() + math.random( 15, 20 )
			end
			
			if v.spell == 43150 then
			  vars.npc_zuljin.tank =	Unit:GetMainTank()
			  vars.npc_zuljin.target =	Unit:GetRandomPlayer( 7 )
				vars.npc_zuljin.counter = 0
				if vars.npc_zuljin.target == nil then vars.npc_zuljin.target =	Unit:GetRandomPlayer( 0 ) end
				Unit:ModifyRunSpeed( 15 )
				Unit:MoveTo( vars.npc_zuljin.target:GetX() - 3, vars.npc_zuljin.target:GetY() - 3, vars.npc_zuljin.target:GetZ(), vars.npc_zuljin.target:GetO() )
				Unit:SetTauntedBy( vars.npc_zuljin.target )
				vars.npc_zuljin.cancast = false
				Unit:RegisterEvent( "npc_zuljin_event_updateclaws", 500, v.counter )
				setvars( Unit, vars )
			end
			if(v.spell == 43153) then
			  vars.npc_zuljin.tank =	Unit:GetMainTank()
			  vars.npc_zuljin.target =	Unit:GetRandomPlayer(0)
				vars.npc_zuljin.counter = 0
				if(vars.npc_zuljin.target == nil) then vars.npc_zuljin.target = Unit:GetRandomPlayer(0) end
				Unit:ModifyRunSpeed(18)
				Unit:MoveTo(vars.npc_zuljin.target:GetX() - 3, vars.npc_zuljin.target:GetY() - 3, vars.npc_zuljin.target:GetZ(), vars.npc_zuljin.target:GetO())
				Unit:SetTauntedBy(vars.npc_zuljin.target)
				vars.npc_zuljin.cancast = false
				Unit:RegisterEvent("npc_zuljin_event_updatecharge", 750, v.counter)
				setvars(Unit, vars)
			end
			if(v.spell == 43213) then
			 	Unit:FullCastSpell(17207)
				Unit:FullCastSpell(v.spell)
				v.timer = os.time() + math.random(12, 17)
			end
			if(v.spell == 43215) then
			 	Unit:FullCastSpell(v.spell)
				v.timer = os.time() + math.random(8, 9)
			end
			if(v.spell == 43216) then
			  local friends = Unit:GetInRangeFriends()
				local count = 0
				local target =	Unit:GetRandomPlayer(0)
				
				for i, j in pairs(friends) do
				  if(j:GetEntry() == 24187) then count = count + 1 end
				end
				if(count < 3) then
					Unit:SpawnCreature(24187, target:GetX(), target:GetY(), target:GetZ(), target:GetO(), 1890, 10000)
				end
				v.timer = os.time() + math.random(2, 4)
			end
			for i, j in pairs(npc_zuljin_spells) do
				if((j.phase == vars.npc_zuljin.phase) and (j.timer ~= -1) and (v.cooldown ~= -1)) then
					j.timer = j.timer + v.cooldown
				end
			end
			if((v.spell == 43150) or (v.spell == 43153)) then
			  return
			end
		end
	end
end

--[[function npc_zuljin_event_updatestorm(Unit)
 local vars = getvars(Unit)
	if vars.npc_zuljin.phase == 3 then
	  local targets =	Unit:GetInRangePlayers()
		for k, v in pairs( targets ) do
		  if	Unit:GetCurrentSpell( v ) ~= nil then
				Unit:FullCastSpellOnTarget( 43137, v )			
			end
		end
	end
end]]

function npc_zuljin_event_updatecheat(Unit)
  local targets =	Unit:GetInRangePlayers()
	if table.getn( targets ) > 10 then
	 	Unit:SendChatMessage( 14, 0, "I do not fight cheaters. Zul'Aman is a 10-man raid only." )
		for k, v in pairs( targets ) do
		 	Unit:SetTauntedBy( v )
			Unit:WipeCurrentTarget()
		end
	end
end

function npc_zuljin_event_updateparal(Unit, Event)
  local targets = Unit:GetInRangePlayers()
	for k, v in pairs(targets) do
	  if v:HasAura(43095) then
		  v:RemoveAura(43095)
			v:FullCastSpell(43437)
		end
	end
end

function npc_zuljin_event_updateclaws(Unit, Event)
  local vars = getvars(Unit)
	if vars.npc_zuljin.target == nil then
	  vars.npc_zuljin.target =	Unit:GetClosestPlayer()
	end
	if vars.npc_zuljin.target ~= nil then
		if	Unit:GetDistance(vars.npc_zuljin.target) > 25 then
		 	Unit:MoveTo(vars.npc_zuljin.target:GetX() - 3, vars.npc_zuljin.target:GetY() - 3, vars.npc_zuljin.target:GetZ(), vars.npc_zuljin.target:GetO())
		end
		Unit:FullCastSpellOnTarget(43150, vars.npc_zuljin.target)
	else
	  vars.npc_zuljin.target = Unit:GetClosestPlayer()
	end
	vars.npc_zuljin.counter = vars.npc_zuljin.counter + 1
	if vars.npc_zuljin.counter == npc_zuljin_spells[4].counter then
	 	Unit:ModifyRunSpeed(8)
		vars.npc_zuljin.cancast = true
		Unit:SetTauntedBy( vars.npc_zuljin.tank )
		npc_zuljin_spells[4].timer = os.time() + math.random(10, 12)
	end
	setvars(Unit, vars)
end

function npc_zuljin_event_updatecharge(Unit, Event)
	local vars = getvars(Unit)
	if vars.npc_zuljin.target ~= nil then
	 	Unit:FullCastSpellOnTarget(43153, vars.npc_zuljin.target)
		vars.npc_zuljin.target = Unit:GetRandomPlayer(0)
		Unit:MoveTo(vars.npc_zuljin.target:GetX() - 3, vars.npc_zuljin.target:GetY() - 3, vars.npc_zuljin.target:GetZ(), vars.npc_zuljin.target:GetO())
		Unit:SetTauntedBy(vars.npc_zuljin.target)
	end
	vars.npc_zuljin.counter = vars.npc_zuljin.counter + 1
	if vars.npc_zuljin.counter == npc_zuljin_spells[5].counter then
	 	Unit:ModifyRunSpeed(8)
		vars.npc_zuljin.cancast = true
		Unit:SetTauntedBy(vars.npc_zuljin.tank)
		npc_zuljin_spells[5].timer = os.time() + math.random(14, 18)
	end
	setvars(Unit, vars)
end

RegisterUnitEvent(23863,  1, "npc_zuljin_event_combatenter")
RegisterUnitEvent(23863,  2, "npc_zuljin_event_combatleave")
RegisterUnitEvent(23863,  3, "npc_zuljin_event_combatkills")
RegisterUnitEvent(23863,  4, "npc_zuljin_event_combatdying")
RegisterUnitEvent(23863,  6, "npc_zuljin_event_combatdodge")
RegisterUnitEvent(23863, 18, "npc_zuljin_event_Unitspawned")

function npc_pillar_event_combatenter(Unit, Event)
 	Unit:RegisterEvent("npc_pillar_event_updatepulse", 250, 1)
end

function npc_pillar_event_combatleave(Unit, Event)
 	Unit:RemoveEvents()
end

function npc_pillar_event_Unitspawned(Unit, Event)
 	Unit:FullCastSpell(43218)
	Unit:SetCombatCapable(1)
	Unit:RegisterEvent("npc_pillar_event_updatepulse", 250, 1)
end

function npc_pillar_event_updatepulse(Unit, Event)
	Unit:SetHealth(Unit:GetMaxHealth())
end

RegisterUnitEvent(24187,  1, "npc_pillar_event_combatenter")
RegisterUnitEvent(24187,  2, "npc_pillar_event_combatleave")
RegisterUnitEvent(24187, 18, "npc_pillar_event_Unitspawned")

function npc_vortex_event_combatleave(Unit, Event)
 	Unit:RemoveEvents()
	Unit:Despawn(1, 0)
end

function npc_vortex_event_Unitspawned(Unit, Event)
 	Unit:FullCastSpell(36178)
 	Unit:RegisterEvent("npc_vortex_event_updatepulse", 1000, 1)
end

function npc_vortex_event_updatepulse(Unit, Event)
  local target = Unit:GetRandomPlayer(0)
	Unit:SetHealth(Unit:GetMaxHealth())
	if((math.random(100) < 20) and (target ~= nil)) then
	 	Unit:SetTauntedBy(target)
		Unit:MoveTo(target:GetX() - 3, target:GetY() - 3, target:GetZ(), target:GetO())
	else	
		target = Unit:GetMainTank()
		if(target == nil) then
		 	Unit:SetTauntedBy(Unit:GetRandomPlayer(0))
			Unit:MoveTo(target:GetX() - 3, target:GetY() - 3, target:GetZ(), target:GetO())
		end
	end
	target = Unit:GetMainTank()
	if((Unit:GetDistance(target) <= 10) and (target ~= nil)) then
	 	Unit:CastSpellOnTarget(42495, target)
		return
	end
	Unit:RegisterEvent("npc_vortex_event_updatepulse", 1000, 1)
end

RegisterUnitEvent(24136, 2, "npc_vortex_event_combatleave")
RegisterUnitEvent(24136, 18, "npc_vortex_event_Unitspawned")