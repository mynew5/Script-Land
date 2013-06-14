--[[ WoTD License - 
This software is provided as free and open source by the
team of The WoTD Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Thank: WoTD Team; for the Script
~~End of License... Please Stand By...
-- WoTD Team, Janurary 19, 2010. ]]

function Malygos_OnCombat(Unit, Event)
	Unit:SendChatMessage(14, 0, "Lesser beings, intruding here! A shame that your excess courage does not compensate for your stupidity!")
	Unit:SendChatMessage(14, 0, "None but the blue dragonflight are welcome here! Perhaps this is the work of Alexstrasza? Well then, she has sent you to your deaths!")
	Unit:SendChatMessage(14, 0, "What could you hope to accomplish? To storm brazenly into my domain... to employ magic... against ME? <Laughs>")
	Unit:SendChatMessage(14, 0, "I am without limits here... the rules of your cherished reality do not apply... in this realm, I am in control...")
	Unit:SendChatMessage(14, 0, "I give you one chance. Pledge fealty to me, and perhaps I won't slaughter you for your insolence!")
	Unit:RegisterEvent("Malygos_Phase1", 1000, 0)
end

RegisterUnitEvent(28859, 1, "Malygos_OnCombat")

function Malygos_OnDead(Unit, Event)
	Unit:RemoveEvents()
	Unit:SendChatMessage(14, 0, "UNTHINKABLE! The mortals will destroy... everything... my sister... what have you...")
	Unit:SpawnCreature(32295, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), 0, 0, 600000)
	Unit:RegisterEvent("Alextraza_AfterMalygosDead", 1000, 0)
end

function Alextraza_AfterMalygosDead(Unit, Event)
	Unit:SendChatMessage(14, 0, "I did what I had to, brother. You gave me no alternative." )
	Unit:SendChatMessage(14, 0, "And so ends the Nexus war.")
	Unit:SendChatMessage(14, 0, "This resolution pains me deeply, but the destruction - the monumental loss of life - had to end. Regardless of Malygos's recent transgressions, I will mourn his loss. He was once a guardian, a protector. This day, one of the world's mightiests, has fallen.")
	Unit:SendChatMessage(14, 0, "The Red Dragonflight will take on the burden of mending the devastation brought on Azeroth. Return home to your people and rest. Tomorrow will bring you new challenges, and you must be ready to face them. Life, goes on.")
end

RegisterUnitEvent(28859, 4, "Malygos_OnDead")
RegisterUnitEvent(32295, 1, "Alextraza_AfterMalygosDead")

function Malygos_OnLeave(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(28859, 2, "Malygos_OnLeave")

function Malygos_OnPlayerDeath(Unit, Event)
	Unit:RemoveEvent()
	local vchoice = math.random(1,3)
	if(vchoice == 1) then
		Unit:SendChatMessage(14, 0, "Alexstrasza! Another of your brood falls!")
		Unit:SendChatMessage(14, 0, "Little more then gnats!")
		Unit:SendChatMessage(14, 0, "Your red allies will share your fate...")
	elseif(vchoice == 2) then
		Unit:SendChatMessage(14, 0, "Your energy will be put to good use!")
		Unit:SendChatMessage(14, 0, "I am the spell-weaver! My power is infinite!")
		Unit:SendChatMessage(14, 0, "Your spirit will linger here forever!")
	elseif(vchoice == 3) then
		Unit:SendChatMessage(14, 0, "Your stupidity has finally caught up to you!")
		Unit:SendChatMessage(14, 0, "More artifacts to confiscate...")
		Unit:SendChatMessage(14, 0, "Laughs> How very... naïve...") -- Need to add emote
	end
end

RegisterUnitEvent(28859, 3, "Malygos_OnPlayerDeath")

function Malygos_Vortex(Unit, Event)
	Unit:CastSpellOnTarget(56105, Unit:GetRandomPlayer(0))
end

function Malygos_ArcanePulse(Unit, Event)
	Unit:SendChatMessage(14, 0, "Watch helplessly as your hopes are swept away...")
	Unit:CastSpellOnTarget(57432, Unit:GetRandomPlayer(0))
end

function Malygos_ArcaneBreath(Unit, Event)
	Unit:SendChatMessage(42, 0, "Malygos takes a deep breath...")
	Unit:SendChatMessage(14, 0, "YOU WILL NOT SUCCEED WHILE I DRAW BREATH!")
	Unit:CastSpellOnTarget(56272, Unit:GetRandomPlayer(0))
end

function Malygos_ArcaneStorm(Unit, Event)
	Unit:CastSpellOnTarget(61693, Unit:GetMainTank())
end

function Malygos_StaticField(Unit, Event)
	Unit:CastSpellOnTarget(57430, Unit:GetRandomPlayer(0))
end

function Malygos_SurgeOfPower(Unit, Event)
	Unit:SendChatMessage(14, 0, "The powers at work here exceed anything you could possibly imagine!")
	Unit:CastSpellOnTarget(56505, Unit:GetRandomPlayer(0))
end

function Malygos_PowerSpark(Unit, Event)
	Unit:SpawnCreature(30084, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), 2, 60000)
	Unit:SpawnCreature(30084, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), 2, 60000)
end

function Malygos_NexusLord(Unit, Event)
	Unit:SpawnCreature(30245, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), 2, 60000)
	Unit:SpawnCreature(30245, Unit:GetX(), Unit:GetY(), Unit:GetZ(), Unit:GetO(), 2, 60000)
end

function Malygos_Phase1(Unit, Event)
	if(Unit:GetHealtPct() <= 98) then
		Unit:SendChatMessage(14, 0, "My patience has reached its limit, I will be rid of you!")
		Unit:RegisterEvent("Malygos_ArcaneBreath", 5000, 0)
		Unit:RegisterEvent("Malygos_PowerSpark", 60000, 0)
		Unit:RegisterEvent("Malygos_Vortex", 50000, 1)
		Unit:RegisterEvent("I had hoped to end your lives quickly, but you have proven more...resilient then I had anticipated. Nonetheless, your efforts are in vain, it is you reckless, careless mortals who are to blame for this war! I do what I must...And if it means your...extinction...THEN SO BE IT!")
		Unit:RegisterEvent("Malygos_Phase2", 1000, 0)
	end
end

function Malygos_Phase2(Unit, Event)
	if(Unit:GetHealthPct() <= 50) then
	Unit:SendChatMessage(14, 0, "Few have experienced the pain I will now inflict upon you!")
	Unit:RegisterEvent("Malygos_ArcanePulse", 10000, 0)
	Unit:RegisterEvent("Malygos_NexusLord", 60000, 2)
	Unit:RegisterEvent("Malygos_ArcaneStorm", 25000, 0)
	Unit:RegisterEvent("ENOUGH! If you intend to reclaim Azeroth's magic, then you shall have it...")
	Unit:RegisterEvent("Malygos_Phase3", 1000, 0)
	end
end

function Malygos_Phase3(Unit, Event)
	if(Unit:GetHealthPct() <= 10) then
	Unit:SendChatMessage(14, 0, "Now your benefactors make their appearance...But they are too late. The powers contained here are sufficient to destroy the world ten times over! What do you think they will do to you?")
	Unit:SendChatMessage(14, 0, "SUBMIT!")
	Unit:RegisterEvent("Malygos_ArcanePulse", 10000, 0)
	Unit:RegisterEvent("Malygos_StaticField", 10000, 0)
	Unit:RegisterEvent("Malygos_SurgeOfPower", 10000, 0)
	end
end