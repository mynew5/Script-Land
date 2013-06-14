--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]
--[[Grand Warlock Nethekurse yells: Ah, what a waste... next!
Grand Warlock Nethekurse yells: Beg for your pitiful life!
Grand Warlock Nethekurse yells: Come on, show me a real fight!
Grand Warlock Nethekurse yells: Don't waste your time on that one, he's weak!
Grand Warlock Nethekurse yells: I had more fun torturing the peons!
Grand Warlock Nethekurse yells: I was going to kill him anyway!
Grand Warlock Nethekurse yells: I'm already bored!
Grand Warlock Nethekurse yells: Oh, just die!
Grand Warlock Nethekurse yells: One pitiful wretch down. Go on, take another one!
Grand Warlock Nethekurse yells: Run, coward, run!
Grand Warlock Nethekurse yells: Thank you for saving me the trouble. Now it's my turn to have some fun!
Grand Warlock Nethekurse yells: What... a shame.
Grand Warlock Nethekurse yells: Yes, beat him mercilessly! His skull is as thick as an ogre's!
Grand Warlock Nethekurse yells: You can have that one, I no longer need him!
Grand Warlock Nethekurse yells: You lose.
Grand Warlock Nethekurse yells: You want him? Very well, take him!
Grand Warlock Nethekurse yells: You wish to fight us all at once? This should be amusing!
Grand Warlock Nethekurse yells: Your pain amuses me!]]

local Didthat = 0

function Nethekurse(Unit, Event, MiscUnit, Misc)
	Unit:RegisterEvent("Nethekurse_Dark_Spin", 1000, 0)
	Unit:RegisterEvent("Nethekurse_Void_Zones", 10000, 0)
	Unit:RegisterEvent("Nethekurse_Burning_Nova", 21000, 0)
end

function Nethekurse_Dark_Spin(Unit)
	if((Unit:GetHealthPct() < 20) and (Didthat == 0)) then
		Unit:FullCastSpellOnTarget(30502, Unit:GetClosestPlayer())
		Didthat = 1
	else
	end
end

function Nethekurse_Void_Zones(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(30533, Unit:GetRandomPlayer())
end

function Nethekurse_Burning_Nova(Unit, Event, MiscUnit, Misc)
	Unit:FullCastSpellOnTarget(30500, Unit:GetRandomPlayer())
end

RegisterUnitEvent(16807, 1, "Nethekurse")