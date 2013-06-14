--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: Mathix; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function FireNova9(event, player, spellid)
	if(spellid == 61657) then
		if(player:GetDistanceYards(player:GetInRangeEnemies()) <= 10) then
			local damage = math.random(893,997)
			player:DealDamage(player:GetInRangeEnemies(), damage, 61657)
		end
	end
end

RegisterServerHook(10, "FireNova9")

function FireNova8(event, player, spellid)
	if(spellid == 61649) then
		if(player:GetDistanceYards(player:GetInRangeEnemies()) <= 10) then
			local damage = math.random(755,843)
			player:DealDamage(player:GetInRangeEnemies(), damage, 61649)
		end
	end
end

RegisterServerHook(10, "FireNova8")

function FireNova7(event, player, spellid)
	if(spellid == 25547) then
		if(player:GetDistanceYards(player:GetInRangeEnemies()) <= 10) then
			local damage = math.random(727,813)
			player:DealDamage(player:GetInRangeEnemies(), damage, 25547)
		end
	end
end

RegisterServerHook(10, "FireNova7")

function FireNova6(event, player, spellid)
	if(spellid == 25546) then
		if(player:GetDistanceYards(player:GetInRangeEnemies()) <= 10) then
			local damage = math.random(518,578)
			player:DealDamage(player:GetInRangeEnemies(), damage, 25546)
		end
	end
end

RegisterServerHook(10, "FireNova6")

function FireNova5(event, player, spellid)
	if(spellid == 11315) then
		if(player:GetDistanceYards(player:GetInRangeEnemies()) <= 10) then
			local damage = math.random(396,442)
			player:DealDamage(player:GetInRangeEnemies(), damage, 11315)
		end
	end
end

RegisterServerHook(10, "FireNova5")

function FireNova4(event, player, spellid)
	if(spellid == 11314) then
		if(player:GetDistanceYards(player:GetInRangeEnemies()) <= 10) then
			local damage = math.random(281,317)
			player:DealDamage(player:GetInRangeEnemies(), damage, 11314)
		end
	end
end

RegisterServerHook(10, "FireNova4")

function FireNova3(event, player, spellid)
	if(spellid == 8499) then
		if(player:GetDistanceYards(player:GetInRangeEnemies()) <= 10) then
			local damage = math.random(184,208)
			player:DealDamage(player:GetInRangeEnemies(), damage, 8499)
		end
	end
end

RegisterServerHook(10, "FireNova3")

function FireNova2(event, player, spellid)
	if(spellid == 8498) then
		if(player:GetDistanceYards(player:GetInRangeEnemies()) <= 10) then
			local damage = math.random(102,116)
			player:DealDamage(player:GetInRangeEnemies(), damage, 8498)
		end
	end
end

RegisterServerHook(10, "FireNova2")

function FireNova1(event, player, spellid)
	if(spellid == 1535) then
		if(player:GetDistanceYards(player:GetInRangeEnemies()) <= 10) then
			local damage = math.random(48,56)
			player:DealDamage(player:GetInRangeEnemies(), damage, 1535)
		end
	end
end

RegisterServerHook(10, "FireNova1")