--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: DARKI
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

function Traitor_end(Unit, Event)
	Unit:SendChatMessage(11, 0, "Tell your master that this is where Van Cleef is hiding. I'm outta here!")
	Unit:Despawn(5000,1000)
	Unit:DestroyCustomWaypointMap();
end

function Traitor_OnStart(Unit, Event)
	Unit:CreateCustomWaypointMap();
	Unit:CreateWaypoint(-10521.876953, 1064.410278, 54.820744, 3.220135, 0, 256, 0);
	Unit:CreateWaypoint(-10548.616211, 1072.964111, 49.694920, 3.345799, 0, 256, 0);
	Unit:CreateWaypoint(-10596.891602, 1057.281982, 38.864330, 3.451828, 0, 256, 0);
	Unit:CreateWaypoint(-10663.427734, 1030.475952, 32.725643, 3.098398, 0, 256, 0);
	Unit:CreateWaypoint(-10715.894531, 1030.825317, 33.473114, 3.165157, 0, 256, 0);
	Unit:CreateWaypoint(-10754.050781, 1016.978821, 32.843971, 3.443188, 0, 256, 0);
	Unit:CreateWaypoint(-10917.114258, 997.355408, 35.466064, 3.314383, 0, 256, 0);
	Unit:CreateWaypoint(-10937.306641, 1020.598755, 36.644848, 1.488332, 0, 256, 0);
	Unit:CreateWaypoint(-10933.578125, 1058.460571, 36.027996, 1.472624, 0, 256, 0);
	Unit:CreateWaypoint(-10958.590820, 1105.329224, 36.635437, 2.076595, 0, 256, 0);
	Unit:CreateWaypoint(-10895.253906, 1248.348877, 33.385048, 1.176529, 0, 256, 0);
	Unit:CreateWaypoint(-10958.590820, 1105.329224, 36.635437, 2.076595, 0, 256, 0);
	Unit:CreateWaypoint(-10895.253906, 1248.348877, 33.385048, 1.176529, 0, 256, 0);
	Unit:CreateWaypoint(-10890.806641, 1297.475708, 34.488716, 1.698819, 0, 256, 0);
	Unit:CreateWaypoint(-10917.052734, 1419.003296, 42.823147, 1.804847, 0, 256, 0);
	Unit:CreateWaypoint(-10989.025391, 1410.501953, 42.863670, 2.673498, 0, 256, 0);
	Unit:CreateWaypoint(-10989.025391, 1410.501953, 42.863670, 2.673498, 0, 256, 0);
	Unit:CreateWaypoint(-11024.154297, 1488.091064, 43.177536, 1.566087, 0, 256, 0);
	Unit:CreateWaypoint(-11048.541992, 1513.367798, 43.154915, 2.369550, 0, 256, 0);
	Unit:CreateWaypoint(-11065.412109, 1526.429321, 43.328102, 3.068554, 0, 256, 0);
	Unit:SetMovementType(11)
	Unit:SetCombatCapable(0)
	Unit:StopMovement(3000)
	Unit:SendChatMessage(11, 0, "Okay let's do this, you gotta protect me and stuff, I can't fight on my own!");
	Unit:SetNPCFlags(0);
	RegisterEvent(Traitor_End, 1, 10000)
end

