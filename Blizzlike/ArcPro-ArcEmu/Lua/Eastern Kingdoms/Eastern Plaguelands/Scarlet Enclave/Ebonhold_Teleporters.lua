--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: BrantX
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function TeleportDown_AI(Unit,Event)
	Unit:RegsiterEvent("TeleportDown_DownFront", 1000, 0)
	Unit:RegsiterEvent("TeleportDown_DownBack", 1000, 0)
end

function TeleportDown_DownFront(Unit,Event)
	if(Unit:IsInFront()) then
		Unit:Teleport(609, 2389.989990, -5640.930176, 377.266998)
	end
end

function TeleportDown_DownBack(Unit,Event)
	if(Unit:IsInBack()) then
		Unit:Teleport(609, 2389.989990, -5640.930176, 377.266998)
	end
end

RegisterUnitEvent(29581, 10, "TeleportDown_AI")

function TeleportUp_AI(Unit,Event)
	Unit:RegsiterEvent("TeleportDown_UpFront", 1000, 0)
	Unit:RegsiterEvent("TeleportDown_UpBack", 1000, 0)
end

function TeleportUp_UpFront(Unit,Event)
	if(Unit:IsInFront()) then
		Unit:Teleport(609, 2383.649902, -5645.240234, 420.880005)
	end
end

function TeleportUp_UpBack(Unit,Event)
	if(Unit:IsInBack()) then
		Unit:Teleport(609, 2383.649902, -5645.240234, 420.880005)
	end
end

RegisterUnitEvent(29580, 10, "TeleportUp_AI")