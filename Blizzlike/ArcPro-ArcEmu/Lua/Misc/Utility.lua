--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: Moon++
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

-- public constructor
function initialiseData (d,u,v)
local i = 1
	while i <= d.slotcount do
        if(d.slots[i] == null) then
			break
		end
        i = i + 1
    end
	if(i > d.slotcount) then
	  d.slotcount = i
	end
	d.slots[i] = u
	d.data[i] = v
end

function findSelf (d,u)
local i = 1
	while i <= d.slotcount do
		if(d.slots[i] == u) then
			return i
		end
			i = i + 1
	end
	return 0
end

-- public get data
function getData(d,u)
	if(findSelf(d,u) ~= 0) then
		return d.data[findSelf(d,u)]
	else
		return nil
	end
end


-- public set data
function setData(d,u,v)
	if(findSelf(d,u) ~= 0) then
		d.data[findSelf(d,u)] = v
	end
end

-- public destructor
function freeData(d,u)
	if(findSelf(d,u) ~= 0) then
		d.slots[findSelf(d,u)] = null
	end
end