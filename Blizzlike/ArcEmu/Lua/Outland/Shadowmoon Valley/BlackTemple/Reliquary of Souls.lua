--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: DARKI; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Essence_AngerOnCombat(pUnit, event)
	setvars(pUnit, {dup=0,qtick=0,qactive=0});
	pUnit:SendChatMessage(14, 0, "Beware: I live!")
	pUnit:RegisterEvent("Ess_Aura",1000,0)
	pUnit:RegisterEvent("Rand_Quotes",10000, 0)
	pUnit:RegisterEvent("Rand_Quotespeech",10000, 0)
	pUnit:RegisterEvent("Ess_Seethe",15000, 3)
	pUnit:RegisterEvent("Ess_Spells",35000, 0)
end

function Ess_Aura(pUnit, event)
	pUnit:CastSpell(41337)
end

function Rand_Quotes(pUnit, event)
	local args = getvars(pUnit);
	local HealthCheck = pUnit:GetHealthPct()
	if(HealthCheck <= 95) then
		args.qactive = 1;
		args.qtick = 1;
	end
	setvars(pUnit, args);
end

function Rand_Quotespeech(pUnit, event)
--	math randies might be inserted in here
	local args = getvars(pUnit);
	if (args.qactive == 1 and args.qtick == 1) then
		args.qtick = args.qtick + 1;
		if(args.qtick == 35 ) then
			pUnit:SendChatMessage(14, 0, "So.. foolish.");
		end
		--[[if(args.qtick == 75 ) then
			pUnit:SendChatMessage(14, 0, "I won't be ignored!");
		end
		if(args.qtick == 115) then
			pUnit:SendChatMessage(14, 0, "On your knees!");
		end]]
		if(args.qtick == 145) then
			args.qtick = 1;
		end
	end
	setvars(pUnit, args);
end

function Ess_Seethe(pUnit, event)
	pUnit:CastSpell(41520)
end

function Ess_Spells(pUnit, event)
	local RandSpellz = math.random(1,2)
	if(RandSpellz == 1) then
		if(pUnit:GetMainTank(0) ~= nil) then
			pUnit:CastSpellOnTarget(41545, pUnit:GetMainTank(0))
		end
	elseif(RandzSpellz == 2) then
		if(pUnit:GetRandomPlayer(0) ~= nil) then
			pUnit:FullCastSpellOnTarget(41377, pUnit:GetRandomPlayer(0))
		end
	end
end

function Essence_Killed(pUnit, event)
--local EssChat = math.random(1,2)
--	if(EssChat == 1) then
		pUnit:SendChatMessage(14, 0, "Enough! No more!")
--[[elseif(EssChat == 2) then
		pUnit:SendChatMessage(16, 0, "*Maniacal cackle*")
	end]]
end

function Essence_LeaveCombat(pUnit, event)
	local args = getvars(pUnit);
	args.dup = 1;
	setvars(pUnit, args);
end

function Essence_Death(pUnit, event)
	local args = getvars(pUnit);
	pUnit:SendChatMessage(14, 0, "Beware, coward!")
	args.dup = 1;
	setvars(pUnit, args);
end

RegisterUnitEvent(23420, 1, "Essence_AngerOnCombat")
RegisterUnitEvent(23420, 3, "Essence_Killed")
RegisterUnitEvent(23420, 2, "Essence_LeaveCombat")
RegisterUnitEvent(23420, 4, "Essence_Death")