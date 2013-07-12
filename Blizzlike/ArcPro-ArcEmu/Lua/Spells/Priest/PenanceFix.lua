--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Mathix
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function PriestPenanceFix1(event, plr, spellid)
	if(spellid == 47666) then
		local target = plr:GetSelection()
		local distance = plr:GetDistanceYards(target)
		if((target:IsFriendly() == true) and (distance <= 40) and (target:IsPlayer() == true)) then
			local Health = target:GetHealth()
			local HealAmount = math.random(650,756)
			target:SetHealth(Health+HealAmount)
			plr:RegisterEvent(PenanceHeal2, 1000, 1)
		elseif((target:IsFriendly() == false) and (distance <= 30)) then
			plr:DealDamage(target, 240, 47666)
			plr:RegisterEvent(PenanceDamage2, 1000, 1)
		end
	end
end

function PenanceDamage2(event, plr, spellid)
	plr:DealDamage(target, 240, 47666)
	plr:RegisterEvent(PenanceDamage3, 1000, 1)
end

function PenanceDamage3(event, plr, spellid)
	plr:DealDamage(target, 240, 47666)
end

function PenanceHeal2(event, plr, spellid)
	local HealAmount = math.random(650,756)
	target:SetHealth(Health+HealAmount)
	plr:RegisterEvent(PenanceHeal3, 1000, 1)
end

function PenanceHeal3(event, plr, spellid)
	local HealAmount = math.random(650,756)
	target:SetHealth(Health+HealAmount)
end

RegisterServerHook(10, "PriestPenanceFix1")

function PriestPenanceFix2(event, plr, spellid)
	if(spellid == 52983) then
		local target = plr:GetSelection()
		local distance = plr:GetDistanceYards(target)
		if((target:IsFriendly() == true) and (distance <= 40) and (target:IsPlayer() == true)) then
			local Health = target:GetHealth()
			local HealAmount = math.random(805,909)
			target:SetHealth(Health+HealAmount)
			plr:RegisterEvent(PenanceHeal2, 1000, 1)
		elseif((target:IsFriendly() == false) and (distance <= 30)) then
			plr:DealDamage(target, 292, 47666)
			plr:RegisterEvent(PenanceDamage2, 1000, 1)
		end
	end
end

function PenanceDamage2(event, plr, spellid)
	plr:DealDamage(target, 292, 47666)
	plr:RegisterEvent(PenanceDamage3, 1000, 1)
end

function PenanceDamage3(event, plr, spellid)
	plr:DealDamage(target, 292, 47666)
end

function PenanceHeal2(event, plr, spellid)
	local HealAmount = math.random(805,909)
	target:SetHealth(Health+HealAmount)
	plr:RegisterEvent(PenanceHeal3, 1000, 1)
end

function PenanceHeal3(event, plr, spellid)
	local HealAmount = math.random(805,909)
	target:SetHealth(Health+HealAmount)
end

RegisterServerHook(10, "PriestPenanceFix2")

function PriestPenanceFix3(event, plr, spellid)
	if(spellid == 52984) then
		local target = plr:GetSelection()
		local distance = plr:GetDistanceYards(target)
		if((target:IsFriendly() == true) and (distance <= 40) and (target:IsPlayer() == true)) then
			local Health = target:GetHealth()
			local HealAmount = math.random(1278, 1442)
			target:SetHealth(Health+HealAmount)
			plr:RegisterEvent(PenanceHeal2, 1000, 1)
		elseif((target:IsFriendly() == false) and (distance <= 30)) then
			plr:DealDamage(target, 333, 47666)
			plr:RegisterEvent(PenanceDamage2, 1000, 1)
		end
	end
end

function PenanceDamage2(event, plr, spellid)
	plr:DealDamage(target, 333, 47666)
	plr:RegisterEvent(PenanceDamage3, 1000, 1)
end

function PenanceDamage3(event, plr, spellid)
	plr:DealDamage(target, 333, 47666)
end

function PenanceHeal2(event, plr, spellid)
	local HealAmount = math.random(1278,1442)
	target:SetHealth(Health+HealAmount)
	plr:RegisterEvent(PenanceHeal3, 1000, 1)
end

function PenanceHeal3(event, plr, spellid)
	local HealAmount = math.random(1278,1442)
	target:SetHealth(Health+HealAmount)
end

RegisterServerHook(10, "PriestPenanceFix3")

function PriestPenanceFix4(event, plr, spellid)
	if(spellid == 52985) then
		local target = plr:GetSelection()
		local distance = plr:GetDistanceYards(target)
		if((target:IsFriendly() == true) and (distance <= 40) and (target:IsPlayer() == true)) then
			local Health = target:GetHealth()
			local HealAmount = math.random(1484,1676)
			target:SetHealth(Health+HealAmount)
			plr:RegisterEvent(PenanceHeal2, 1000, 1)
		elseif((target:IsFriendly() == false) and (distance <= 30)) then
			plr:DealDamage(target, 375, 47666)
			plr:RegisterEvent(PenanceDamage2, 1000, 1)
		end
	end
end

function PenanceDamage2(event, plr, spellid)
	plr:DealDamage(target, 375, 47666)
	plr:RegisterEvent(PenanceDamage3, 1000, 1)
end

function PenanceDamage3(event, plr, spellid)
	plr:DealDamage(target, 375, 47666)
end

function PenanceHeal2(event, plr, spellid)
	local HealAmount = math.random(1484,1676)
	target:SetHealth(Health+HealAmount)
	plr:RegisterEvent(PenanceHeal3, 1000, 1)
end

function PenanceHeal3(event, plr, spellid)
	local HealAmount = math.random(1484,1676)
	target:SetHealth(Health+HealAmount)
end

RegisterServerHook(10, "PriestPenanceFix4")