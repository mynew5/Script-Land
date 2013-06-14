local main_npcid = 570000 	-- Main NPC EntryID
local k_A_npcid = 570001	-- Candidate A NPC EntryID
local k_B_npcid = 570002	-- Candidate B NPC EntryID
local k_C_npcid = 570003	-- Candidate C NPC EntryID
local k_D_npcid = 570004	-- Candidate D NPC EntryID
local objid_1 = 550000		-- way-Object EntryID
local objid_2 = 550001		-- start-Object EntryID
local maxrounds = 3			-- Maximum round of the NPC runs
local timer = 10			-- (In minutes) many minutes the player to bet time.
local aftertimer = 60		-- (In minutes) after the event, you can start in as many minutes later, a new bet.
--------------------------------------------------------------------------
--------------------------------------------------------------------------
function math.area(x1,x2) -- x1 = 50,5; x2 = 20,5
		if(x1<x2)then
			local x3 = x1
			x1 = x2
			x2 = x3
		end	
	local x1_1 = math.floor(x1); local x2_1 = math.ceil(x2) -- x1 = 50; x2 = 21
	local x1_2 = x1 - x1_1 -- 0.5
	--local x2_2 = x1 - math.floor(x2) -- 0.5
	local x = x1_1 - x2_1; local x = math.random(x)
	local X = x1_1-x+x1_2
	return X;
end
--MovePath by Mordred@Yias.org:
MovePath = {MPflag = {[0] = 0.39, [1] = 0.172, [2] = 0.13}}
function MovePath.StartPath(Unit, Table)
	local x = Table[1][1]; local y = Table[1][2]; local z = Table[1][3]
	Unit:SetMovementFlags(Table[1][5])
	Unit:MoveTo(x,y,z,0)
	local rTime = ((Unit:CalcToDistance(x,y,z)*MovePath.MPflag[Table[1][5]])*1000) - ((Unit:CalcToDistance(x,y,z)*80) - (Unit:CalcToDistance(x,y,z)*5))
	if rTime < 1 then
		MovePath.PathPoints(Unit, Table, 1)
	else
		LCF:RegisterLuaEvent(tostring(Unit),MovePath.PathPoints,rTime,1, Unit, Table, 1)
	end
end
function MovePath.PathPoints(Unit, Table, PathNum)
	if (Table[PathNum][6]~=nil) then
		_G[Table[PathNum][6]](Unit, PathNum)
	end
	if (PathNum<table.getn(Table)) and Unit:IsInWorld() then
		if (Table[PathNum][4]~=0) then
			LCF:RegisterLuaEvent(tostring(Unit),MovePath.DelayMove,Table[PathNum][4],1, Unit, Table, PathNum)
		else
			Unit:SetMovementFlags(Table[PathNum][5])
			local x = Table[PathNum+1][1]; local y = Table[PathNum+1][2]; local z = Table[PathNum+1][3]
			Unit:MoveTo(x,y,z,0)
			local rTime = ((Unit:CalcToDistance(x,y,z)*MovePath.MPflag[Table[PathNum][5]])*1000) - ((Unit:CalcToDistance(x,y,z)*80) - (Unit:CalcToDistance(x,y,z)*5))
			if rTime < 1 then
				MovePath.PathPoints(Unit, Table, PathNum+1)
			else
				LCF:RegisterLuaEvent(tostring(Unit),MovePath.PathPoints,rTime,1, Unit, Table, PathNum+1)
			end
		end
	elseif Table[PathNum][5] then
		MovePath.StartPath(Unit, Table)
	end
end
function MovePath.DelayMove(Unit,Table,PathNum)
	if (Table[PathNum][7]~=nil) then
		_G[Table[PathNum][7]](Unit, PathNum)
	end
	Unit:SetMovementFlags(Table[PathNum][5])
	local x = Table[PathNum+1][1]; local y = Table[PathNum+1][2]; local z = Table[PathNum+1][3]
	Unit:MoveTo(x,y,z,0)
	local rTime = ((Unit:CalcToDistance(x,y,z)*MovePath.MPflag[Table[PathNum][5]])*1000) - ((Unit:CalcToDistance(x,y,z)*80) - (Unit:CalcToDistance(x,y,z)*5))
	if rTime < 1 then
		MovePath.PathPoints(Unit, Table, PathNum+1)
	else
		LCF:RegisterLuaEvent(tostring(Unit),MovePath.PathPoints,rTime,1, Unit, Table, PathNum+1)
	end
end
--------------------------------------------------------------------------
--------------------------------------------------------------------------
local sys = {}

function Bet_NPC_Gossip(unt, _, plr)
	unt:GossipCreateMenu(1, plr, 0)
	if(sys.gst~=true)then
	unt:GossipMenuAddItem(7,"Start race event",1,0)
	else
	plr:SendBroadcastMessage("|CFFFF0000[BetNPC]: |R|CFFFFFFFFCandidates select and then enter a bet.|R")
	unt:GossipMenuAddItem(7,"Bet on candidate A",20,1)
	unt:GossipMenuAddItem(7,"Bet on candidate B",21,1)
	unt:GossipMenuAddItem(7,"Bet on candidate C",22,1)
	unt:GossipMenuAddItem(7,"Bet on candidate D",23,1)
	end
	unt:GossipMenuAddItem(7,"[Close]", 999, 0)
	unt:GossipSendMenu(plr)
end
function Bet_NPC_Select(unt, _, plr, _, id, code)
	if(id==1)then
		if(sys.wait~=true)then
				if(sys.gst~=true)then
					RegisterTimedEvent("bet_start",timer*60*1000,1)
					SendWorldMessage("|CFFFF0000[BetNPC]: |R|CFFFFFFFFRaceevent has started, you have "..timer.." minute(s) zeit to deliver a bet!|R", 2)
					sys.x = unt:GetX()
					sys.y = unt:GetY()
					sys.z = unt:GetZ()
					gamebuild(plr)
					sys.gst = true
					sys[tostring(sys.gfield.k_A)] = {name = "Candidate A", round = 1, vote = {}, plr = {}}
					sys[tostring(sys.gfield.k_B)] = {name = "Candidate B", round = 1, vote = {}, plr = {}}
					sys[tostring(sys.gfield.k_C)] = {name = "Candidate C", round = 1, vote = {}, plr = {}}
					sys[tostring(sys.gfield.k_D)] = {name = "Candidate D", round = 1, vote = {}, plr = {}}
					sys.fin = 0
					sys.plr = {}
					sys.npc = unt
					unt:GossipCreateMenu(1, plr, 0)
					plr:SendBroadcastMessage("|CFFFF0000[BetNPC]: |R|CFFFFFFFFCandidates select and then enter a bet.|R")
					unt:GossipMenuAddItem(7,"Bet on candidate A",20,1)
					unt:GossipMenuAddItem(7,"Bet on candidate B",21,1)
					unt:GossipMenuAddItem(7,"Bet on candidate C",22,1)
					unt:GossipMenuAddItem(7,"Bet on candidate D",23,1)
					unt:GossipMenuAddItem(7,"[Close]", 999, 0)
					unt:GossipSendMenu(plr)
				else
					plr:SendBroadcastMessage("|CFFFF0000[BetNPC]: |R|CFFFFFFFFSomeone has already started the game.|R")
					plr:GossipComplete()
				end
		else
			plr:SendBroadcastMessage("|CFFFF0000[BetNPC]: |R|CFFFFFFFFOne can only start a game every "..aftertimer.." minute(s).|R")
			plr:GossipComplete()
		end
	end
	--[[if(id==2)then
	wettlauf_delete()
	plr:GossipComplete()
	end]]
	
	if(id>=20)and(id<=23)then
		plr:GossipComplete()
		if(sys.wait~=true)then
			if(tonumber(code)~=nil)then
				if(sys.plr[tostring(plr)]==nil)then
					if(plr:GetCoinage()>=code*10000)then
						plr:DealGoldCost(code*10000)
							if(id==20)then
								plr:SendBroadcastMessage("|CFFFF0000[WettlaufNPC]: |R|CFFFFFFFFYou have "..code.." gold bet on Candidate A.|R")
								sys.plr[tostring(plr)] = plr:GetName()
								table.insert(sys[tostring(sys.gfield.k_A)].plr, plr)
								sys[tostring(sys.gfield.k_A)].vote[tostring(plr)] = code
							end
							if(id==21)then
								plr:SendBroadcastMessage("|CFFFF0000[WettlaufNPC]: |R|CFFFFFFFFYou have "..code.." gold bet on Candidate B.|R")
								sys.plr[tostring(plr)] = plr:GetName()
								table.insert(sys[tostring(sys.gfield.k_B)].plr, plr)
								sys[tostring(sys.gfield.k_B)].vote[tostring(plr)] = code
							end
							if(id==22)then
								plr:SendBroadcastMessage("|CFFFF0000[WettlaufNPC]: |R|CFFFFFFFFYou have "..code.." gold bet on Candidate C.|R")
								sys.plr[tostring(plr)] = plr:GetName()
								table.insert(sys[tostring(sys.gfield.k_C)].plr, plr)
								sys[tostring(sys.gfield.k_C)].vote[tostring(plr)] = code
							end
							if(id==23)then
								plr:SendBroadcastMessage("|CFFFF0000[WettlaufNPC]: |R|CFFFFFFFFYou have "..code.." gold bet on Candidate D.|R")
								sys.plr[tostring(plr)] = plr:GetName()
								table.insert(sys[tostring(sys.gfield.k_D)].plr, plr)
								sys[tostring(sys.gfield.k_D)].vote[tostring(plr)] = code
							end
					else
						plr:SendBroadcastMessage("|CFFFF0000[BetNPC]: |R|CFFFFFFFFYou have not enough gold.|R")
					end
				else
					plr:SendBroadcastMessage("|CFFFF0000[BetNPC]: |R|CFFFFFFFFYou've already made your bet.|R")
				end
			else
				plr:SendBroadcastMessage("|CFFFF0000[BetNPC]: |R|CFFFFFFFFPlease enter only numbers.|R")
			end
		else
			plr:SendBroadcastMessage("|CFFFF0000[BetNPC]: |R|CFFFFFFFFI'm sorry, but there are no wagers taken towards more.|R")
		end
	end
	
	
	
	if(id==999)then
		plr:GossipComplete()
	end
end
RegisterUnitGossipEvent(main_npcid,1,"Bet_NPC_Gossip")
RegisterUnitGossipEvent(main_npcid,2,"Bet_NPC_Select")

function create_part()
	local part = {[1] = {math.area(sys.x+6.7, sys.x+3.67),math.area(sys.y-6, sys.y-3),sys.z,0,0},
				  [2] = {math.area(sys.x+6.7, sys.x+3.67),math.area(sys.y-10, sys.y-7),sys.z,0,0},
				  [3] = {math.area(sys.x+6.7, sys.x+3.67),math.area(sys.y-13, sys.y-11),sys.z,0,0},
				  [4] = {math.area(sys.x+12, sys.x+8),math.area(sys.y-13, sys.y-11),sys.z,0,0},
				  [5] = {math.area(sys.x+18, sys.x+14),math.area(sys.y-13, sys.y-11),sys.z,0,0},
				  [6] = {math.area(sys.x+18, sys.x+14),math.area(sys.y-10, sys.y-7),sys.z,0,0},
				  [7] = {math.area(sys.x+18, sys.x+14),math.area(sys.y-6, sys.y-3),sys.z,0,0},
				  [8] = {math.area(sys.x+18, sys.x+14),math.area(sys.y+2, sys.y-1),sys.z,0,0},
				  [9] = {math.area(sys.x+18, sys.x+14),math.area(sys.y+9, sys.y+6),sys.z,0,0},
				  [10] = {math.area(sys.x+18, sys.x+14),math.area(sys.y+14, sys.y+12),sys.z,0,0},

				  [11] = {math.area(sys.x+12, sys.x+8),math.area(sys.y+14, sys.y+12),sys.z,0,0},
				  [12] = {math.area(sys.x+6.7, sys.x+3.67),math.area(sys.y+14, sys.y+12),sys.z,0,0},

				  [13] = {math.area(sys.x+6.7, sys.x+3.67),math.area(sys.y+9, sys.y+6),sys.z,0,0},
				  [14] = {math.area(sys.x+6.7, sys.x+3.67),math.area(sys.y+2, sys.y-1),sys.z,0,0},
				  [15] = {sys.x+5.21,sys.y-2.34,sys.z,0,false,"finish"}
				 }
	return part;
end

function finish(unt)
	if(sys[tostring(unt)].round>=maxrounds)then
		sys.fin = sys.fin+1
		if(sys.fin==1)then
			SendWorldMessage("|CFFFF0000[BetNPC]: |R|CFFFFFFFF"..sys[tostring(unt)].name.." won the race, congratulations to all winners!|R", 2)
			sys.fini = {}
			sys.fini[1] = unt
		else
			table.insert(sys.fini, unt)
		end
		if(sys.fin==4)then
			system_winning(sys.fini)
		end
		if(unt:IsInWorld())then
			unt:RemoveFromWorld()
		end
	else
		sys[tostring(unt)].round = sys[tostring(unt)].round+1
		MovePath.StartPath(unt, create_part())
	end
end

function system_winning(_sum)
local sum = {}
local winner = sys[tostring(_sum[1])].plr
	for x=1,4,1 do
		for k,v in pairs(sys[tostring(_sum[x])].vote)do
			table.insert(sum,v)
		end
	end

local gsum = 0
	for k,v in pairs(sum)do
		gsum=gsum+v
	end
	xsum = gsum/table.getn(winner)
	for k,v in pairs(winner)do
		v:DealGoldMerit(xsum*10000)
	end
	bet_delete()
	RegisterTimedEvent("next_round",aftertimer*60*1000,1)
	sys.wait = true
end

function next_round()
	sys.wait = nil
end

function gamebuild(plr)
	sys.gfield = {}
	sys.gfield.k_A = plr:SpawnCreature(k_A_npcid, sys.x+4.34, sys.y-1.18, sys.z, 4.7, 35, 0)
	sys.gfield.k_B = plr:SpawnCreature(k_B_npcid, sys.x+5.04, sys.y-1.18, sys.z, 4.7, 35, 0)
	sys.gfield.k_C = plr:SpawnCreature(k_C_npcid, sys.x+5.74, sys.y-1.18, sys.z, 4.7, 35, 0)
	sys.gfield.k_D = plr:SpawnCreature(k_D_npcid, sys.x+6.44, sys.y-1.18, sys.z, 4.7, 35, 0)
	
	local x1=5.88
	local x2=3.77
	local y1=12.89
	local y2=7.83
	local y3=11.04
	for a=1,6,1 do
		table.insert(sys.gfield, plr:SpawnGameObject(objid_1, sys.x+2.68, sys.y+y1, sys.z, 0, 0, 100))
		table.insert(sys.gfield, plr:SpawnGameObject(objid_1, sys.x+19.25, sys.y+y1, sys.z, 0, 0, 100))
		y1=y1-5.06
			if(a<=5)then
				table.insert(sys.gfield, plr:SpawnGameObject(objid_2, sys.x+x2, sys.y-2.13, sys.z, 0, 0, 100))
				x2=x2+0.7
			end
			if(a<=3)then
				table.insert(sys.gfield, plr:SpawnGameObject(objid_1, sys.x+x1, sys.y-14.34, sys.z, 4.7, 0, 100))
				table.insert(sys.gfield, plr:SpawnGameObject(objid_1, sys.x+x1, sys.y+14.84, sys.z, 4.7, 0, 100))
				x1=x1+5.06	
			end
			if(a<=4)then
				table.insert(sys.gfield, plr:SpawnGameObject(objid_1, sys.x+7.74, sys.y+y2, sys.z, 0, 0, 100))
				table.insert(sys.gfield, plr:SpawnGameObject(objid_1, sys.x+12.8, sys.y+y2, sys.z, 0, 0, 100))
				y2=y2-5.06
			end
			if(a<=2)then
				table.insert(sys.gfield, plr:SpawnGameObject(objid_1, sys.x+10.2, sys.y+y3, sys.z, 4.7, 0, 100))
				table.insert(sys.gfield, plr:SpawnGameObject(objid_1, sys.x+10.2, sys.y+y3, sys.z, 4.7, 0, 100))
				y3=y3-21.45
			end
	end
end

function bet_start(unt)
	sys.wait = true
	SendWorldMessage("|CFFFF0000[BetNPC]: |R|CFFFFFFFFFrom now on no more bets can be made!|R", 2)
	MovePath.StartPath(sys.gfield.k_A, create_part())
	MovePath.StartPath(sys.gfield.k_B, create_part())
	MovePath.StartPath(sys.gfield.k_C, create_part())
	MovePath.StartPath(sys.gfield.k_D, create_part())	
end

function bet_delete()
	for k,v in pairs(sys.gfield)do
		if(v:IsInWorld())then
			v:RemoveFromWorld()
		end
	end
sys = {}
end