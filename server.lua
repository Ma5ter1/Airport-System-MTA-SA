root = getResourceRootElement()

--Marker Coords


xx1,yy1,zz1 = -1854.6, 38.5, 1061.22 --Baggage Entrance 
xx2, yy2, zz2 = -1868, 41, 1055.3 --Baggage Ent Marker
xx3, yy3, zz3 = -1887, 60, 1055.5--Depart Ent Marker
xx4, yy4, zz4 = -1836, 60, 1055.5--International Ent Marker
xx5, yy5, zz5 = -1807, 9, 1061.33--Ticket Ext Marker



airportSFExt =
{


}

a,b,c = 162,228,184 --entrance marker color
a2,b2,c2 = a,b-100,c --interior marker color
alpha = 120
intalpha = alpha+50
size = 1.5
airportInt = 14 --LS Baggage Reclaim Interior
airportDim = 0 --Baggage Dimension
planeInt = 1 --Plane Interior
planeDim = 0 --Plane Dimension

--blip
local airBlip = createBlip( -1412, -298, 15, 5, 0, 0, 0, 255)
--Warp Coords

--Outside
uu, ii, oo = -1425, -291, 14.2
--Ticket Room
jj1,kk1,ll1 = -1828, 8, 1061.33--E to T
jj2,kk2,ll2 = -1854, 35, 1061.33--B to T
--Baggage Room
jj3, kk3, ll3 = -1863,42,1055.33 --T to B
--Plane
jj4,kk4,ll4 = 2, 29, 1200 --T to P
--Destination

--floorcol
clx, cly, clz = -1861.936889,55, 1049.4
clx2, cly2, clz2 = clx+17.4, cly, clz
clx3, cly3, clz3 = clx-17.4, cly, clz
clx4, cly4, clz4 = clx, cly-17.4, clz
floorvar = 8399
baggageFloor = createObject(floorvar, clx, cly, clz)--floorigin
baggageFloor2 = createObject(floorvar, clx2, cly2, clz2)--
baggageFloor3 = createObject(floorvar, clx3, cly3, clz3)--
baggageFloor4 = createObject(floorvar, clx4, cly4, clz4)--
setElementCollisionsEnabled(baggageFloor, true)
setElementCollisionsEnabled(baggageFloor2, true)
setElementCollisionsEnabled(baggageFloor3, true)
setElementCollisionsEnabled(baggageFloor4, true)
setElementAlpha(baggageFloor, 0)
setElementAlpha(baggageFloor2, 0)
setElementAlpha(baggageFloor3, 0)
setElementAlpha(baggageFloor4, 0)




function theDoors()
	--coords
	--doorset 1
	local aa, bb, cc = -1854, 39, 1062 --Door 1 and 2 marker
	local aaa, bbb, ccc = -1854.68, 39.55, 1060.15--door 1 coords
	local aaa2, bbb2, ccc2 = aaa+3,bbb,ccc--door 2 coords
	local aaa3, bbb3, ccc3 = aaa-3,bbb,ccc--door 3 coords
	local aaa4, bbb4, ccc4 = aaa,bbb,ccc--door 4 coords
	
	--doorset 2
	local aaa5, bbb5, ccc5 = -1866.65, 40.1, 1054.2--door 1 coords
	local aaa6, bbb6, ccc6 = aaa5+3,bbb5,ccc5--door 2 coords
	local aaa7, bbb7, ccc7 = aaa5-3,bbb5,ccc5--door 3 coords
	local aaa8, bbb8, ccc8 = aaa5,bbb5,ccc5--door 4 coords
	
	--doorset 3
	local aaa9, bbb9, ccc9 = -1863.65, 40.1, 1054.2--door 1 coords
	local aaa10, bbb10, ccc10 = aaa9+3,bbb9,ccc9--door 2 coords
	local aaa11, bbb11, ccc11 = aaa9-3,bbb9,ccc9--door 3 coords
	local aaa12, bbb12, ccc12 = aaa9,bbb9,ccc9--door 4 coords
	
	--doorset 4
	local aaa13, bbb13, ccc13 = -1857.65, 40.1, 1054.2--door 1 coords
	local aaa14, bbb14, ccc14 = aaa13+3,bbb13,ccc13--door 2 coords
	local aaa15, bbb15, ccc15 = aaa13-3,bbb13,ccc13--door 3 coords
	local aaa16, bbb16, ccc16 = aaa13,bbb13,ccc13--door 4 coords
	
	local ra,rb,rz = 0, 0, -180
	--local clx, cly, clr = -1868, 41, 100--(for the flooring) col coords
	--door types
	local doorvar = 1569 --glass door
	
	--doors
	local door1 = createObject(doorvar, aaa, bbb, ccc)--door 1
	local door2 = createObject(doorvar, aaa2, bbb2, ccc2, ra, rb, rz)--door 2 with rotation offsets
	local door3 = createObject(doorvar, aaa3, bbb3, ccc3)--door 3
	local door4 = createObject(doorvar, aaa4, bbb4, ccc4, ra, rb, rz)--door 4
	
	local door5 = createObject(doorvar, aaa5, bbb5, ccc5)--door 1
	local door6 = createObject(doorvar, aaa6, bbb6, ccc6, ra, rb, rz)--door 2 with rotation offsets
	local door7 = createObject(doorvar, aaa7, bbb7, ccc7)--door 3
	local door8 = createObject(doorvar, aaa8, bbb8, ccc8, ra, rb, rz)--door 4
	
	local door9 = createObject(doorvar, aaa9, bbb9, ccc9)--door 1
	local door10 = createObject(doorvar, aaa10, bbb10, ccc10, ra, rb, rz)--door 2 with rotation offsets
	local door11 = createObject(doorvar, aaa11, bbb11, ccc11)--door 3
	local door12 = createObject(doorvar, aaa12, bbb12, ccc12, ra, rb, rz)--door 4
	
	local door13 = createObject(doorvar, aaa13, bbb13, ccc13)--door 1
	local door14 = createObject(doorvar, aaa14, bbb14, ccc14, ra, rb, rz)--door 2 with rotation offsets
	local door15 = createObject(doorvar, aaa15, bbb15, ccc15)--door 3
	local door16 = createObject(doorvar, aaa16, bbb16, ccc16, ra, rb, rz)--door 4
	
	--markers
	
	
	
	
	
	
	baggageInterMarker = createMarker ( xx4,yy4,zz4, "corona", size, a2,b2,c2,intalpha)
	
	--airportExtMarker = createMarker ( xx5,yy5,zz5, "corona", size, a2,b2,c2,intalpha)
	
	
	

--Set all elements in question, visible
setElementInterior(door1, airportInt)
setElementDimension(door1, airportDim)
setElementInterior(door2, airportInt)
setElementDimension(door2, airportDim)
setElementInterior(door3, airportInt)
setElementDimension(door3, airportDim)
setElementInterior(door4, airportInt)
setElementDimension(door4, airportDim)

setElementInterior(door5, airportInt)
setElementDimension(door5, airportDim)
setElementInterior(door6, airportInt)
setElementDimension(door6, airportDim)
setElementInterior(door7, airportInt)
setElementDimension(door7, airportDim)
setElementInterior(door8, airportInt)
setElementDimension(door8, airportDim)

setElementInterior(door9, airportInt)
setElementDimension(door9, airportDim)
setElementInterior(door10, airportInt)
setElementDimension(door10, airportDim)
setElementInterior(door11, airportInt)
setElementDimension(door11, airportDim)
setElementInterior(door12, airportInt)
setElementDimension(door12, airportDim)

setElementInterior(door13, airportInt)
setElementDimension(door13, airportDim)
setElementInterior(door14, airportInt)
setElementDimension(door14, airportDim)
setElementInterior(door15, airportInt)
setElementDimension(door15, airportDim)
setElementInterior(door16, airportInt)
setElementDimension(door16, airportDim)

--end of doors
setElementInterior(baggageEntMarker, airportInt)
setElementDimension(baggageEntMarker, airportDim)
setElementInterior(baggageExtMarker, airportInt)
setElementDimension(baggageExtMarker, airportDim)
setElementInterior(baggageDepartMarker, airportInt)
setElementDimension(baggageDepartMarker, airportDim)
setElementInterior(baggageInterMarker, airportInt)
setElementDimension(baggageInterMarker, airportDim)
setElementInterior(ticketExtMarker, airportInt)
setElementDimension(ticketExtMarker, airportDim)


--end of markers
setElementInterior(baggageFloor, airportInt)
setElementDimension(baggageFloor, airportDim)
setElementInterior(baggageFloor2, airportInt)
setElementDimension(baggageFloor2, airportDim)
setElementInterior(baggageFloor3, airportInt)
setElementDimension(baggageFloor3, airportDim)
--end of col

end
addEventHandler("onResourceStart", root, theDoors)

airportSFEnt = 
{
	{-1462, -267, 14.5},
	{-1421, -287.5, 14.5},
	{-1405, -303.5, 14.5},
	{-1382, -348, 14.5}
}

--Markers
function markerLoop()
for i,v in ipairs(airportSFEnt) do --SF INTERNATIONAL
	local interior = 0
	local dimension = 0
	airportSFMarker = createMarker ( v[1], v[2], v[3], "corona", size, a,b,c, alpha)
	setElementInterior(airportSFMarker, interior)
	setElementDimension(airportSFMarker, dimension)
	addEventHandler("onMarkerHit", airportSFMarker, handleEntMarker)
end
end
addEventHandler("onResourceStart", root, markerLoop)


--Marker Hit Functions
function handleEntMarker(hitElement)
	local elementType = getElementType(hitElement)
	if elementType == "player" then
		setElementPosition(hitElement, jj1,kk1,ll1)
		setElementInterior(hitElement, airportInt)
		setElementDimension(hitElement, airportDim)
	end
end--Entrance warp to ticket room


ticketExtMarker = createMarker ( xx5,yy5,zz5, "corona", size, a2,b2,c2,intalpha)
function handleExtMarker(hitElement)
	local elementType = getElementType(hitElement)
	if elementType == "player" then
		setElementPosition(hitElement, uu, ii, oo)
		setElementInterior(hitElement, 0)
		setElementDimension(hitElement, 0)
		setElementRotation(hitElement, 0,0, 137.070)
	end
end--Entrance warp to ticket room
addEventHandler("onMarkerHit", ticketExtMarker, handleExtMarker)

baggageEntMarker = createMarker ( xx1,yy1,zz1, "corona", size, a2,b2,c2,intalpha)
function handleBaggageEntMarker(hitElement)
	local elementType = getElementType(hitElement)
	if elementType == "player" then
		setElementPosition(hitElement, jj3, kk3, ll3)
		setElementInterior(hitElement, airportInt)
		setElementDimension(hitElement, airportDim)
		setElementRotation(hitElement, 0,0, 308.206)
	end
end--Entrance warp to baggage
addEventHandler("onMarkerHit", baggageEntMarker, handleBaggageEntMarker)

baggageExtMarker = createMarker ( xx2,yy2,zz2, "corona", size, a2,b2,c2,intalpha)
function handleBaggageExtMarker(hitElement)
	local elementType = getElementType(hitElement)
	if elementType == "player" then
		setElementPosition(hitElement, jj2,kk2,ll2)
		setElementInterior(hitElement, airportInt)
		setElementDimension(hitElement, airportDim)
		setElementRotation(hitElement, 0,0, 179.785)
	end
end--Entrance warp to baggage
addEventHandler("onMarkerHit", baggageExtMarker, handleBaggageExtMarker)

baggageDepartMarker = createMarker ( xx3,yy3,zz3, "corona", size, a2,b2,c2,intalpha)
function handleDepartMarker(hitElement)
	local elementType = getElementType(hitElement)
	if elementType == "player" then
		setElementPosition(hitElement, jj4,kk4,ll4)
		setElementInterior(hitElement, planeInt)
		setElementDimension(hitElement, planeDim)
		setElementRotation(hitElement, 0,0,359.986)
	end
end--Entrance warp to baggage
addEventHandler("onMarkerHit", baggageDepartMarker, handleDepartMarker)

--PLANE GUI