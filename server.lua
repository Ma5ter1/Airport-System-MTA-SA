--**********************************************************--
--AIRPORT SYSTEM(Server Side)--By:Trent Douglass AKA:Ma5ter.--
--**********************************************************--
--Destination Markers are client-sided.
root = getResourceRootElement() --Define root element in the element tree.

--Marker Coordinates(xx,yy,zz)
xx1,yy1,zz1 = -1854.6, 38.5, 1061.22 --Baggage Claim Warp Entrance. 
xx2, yy2, zz2 = -1868, 41, 1055.3 --Baggage Claim Entrance Marker.
xx3, yy3, zz3 = -1887, 60, 1055.5--Depart Entrance Marker.
xx4, yy4, zz4 = -1836, 60, 1055.5--International Entrance Marker.
xx5, yy5, zz5 = -1807, 9, 1061.33--Ticket Room Exit Marker.

--Colors(a,b,c)
a,b,c = 162,228,184 --Airport Entrance marker color.
a2,b2,c2 = a,b-100,c --Airport Interior marker color.
--Marker properties
alpha = 120
intalpha = alpha+50--Interior alpha.
size = 1.5 --Marker size.
airportInt = 14 --Baggage Reclaim Interior ID.
airportDim = 0 --Baggage Dimension ID.
planeInt = 1 --Plane Interior ID.
planeDim = 0 --Plane Dimension ID.
--blip
local airBlip = createBlip( -1412, -298, 15, 5, 0, 0, 0, 255)--Blip to be displayed on player map/radar.

--Warp Coordinates(uu,ii,oo),(jj,kk,ll),...
uu, ii, oo = -1425, -291, 14.2--Outside Airport.
jj1,kk1,ll1 = -1828, 8, 1061.33--Entrance marker to Ticket room.
jj2,kk2,ll2 = -1854, 35, 1061.33--Baggage claim marker to Ticker room.
jj3, kk3, ll3 = -1863,42,1055.33 --Ticket room marker to Baggage claim.
jj4,kk4,ll4 = 2, 29, 1200 --Ticket room to Plane interior.

--Floor collision. (Baggage room has player fall through the floor by default.)
clx, cly, clz = -1861.936889,55, 1049.4 --Floor origin.
clx2, cly2, clz2 = clx+17.4, cly, clz --Copy coordinates to origin and move same object across X and Y axis.
clx3, cly3, clz3 = clx-17.4, cly, clz
clx4, cly4, clz4 = clx, cly-17.4, clz
floorvar = 8399 --Floor object ID.
baggageFloor = createObject(floorvar, clx, cly, clz)--Create floor object so the Baggage Claim room has a floor.
baggageFloor2 = createObject(floorvar, clx2, cly2, clz2)
baggageFloor3 = createObject(floorvar, clx3, cly3, clz3)
baggageFloor4 = createObject(floorvar, clx4, cly4, clz4)
setElementCollisionsEnabled(baggageFloor, true)--Make sure collisions are enabled for floorvar. To prevent user from falling through our newly created objects.
setElementCollisionsEnabled(baggageFloor2, true)
setElementCollisionsEnabled(baggageFloor3, true)
setElementCollisionsEnabled(baggageFloor4, true)
setElementAlpha(baggageFloor, 0)--Make floor object invisible.
setElementAlpha(baggageFloor2, 0)
setElementAlpha(baggageFloor3, 0)
setElementAlpha(baggageFloor4, 0)




function theDoors()
--coordinates, this adds objects to the interior so the user is walking up to a door not just a marker.
	--doorset 1 (aa,bb,cc)
	local aa, bb, cc = -1854, 39, 1062 --Door 1 and 2 marker
	local aaa, bbb, ccc = -1854.68, 39.55, 1060.15--Door1/Origin door.
	local aaa2, bbb2, ccc2 = aaa+3,bbb,ccc
	local aaa3, bbb3, ccc3 = aaa-3,bbb,ccc
	local aaa4, bbb4, ccc4 = aaa,bbb,ccc
	--doorset 2
	local aaa5, bbb5, ccc5 = -1866.65, 40.1, 1054.2--Origin door.
	local aaa6, bbb6, ccc6 = aaa5+3,bbb5,ccc5
	local aaa7, bbb7, ccc7 = aaa5-3,bbb5,ccc5
	local aaa8, bbb8, ccc8 = aaa5,bbb5,ccc5
	
	--doorset 3
	local aaa9, bbb9, ccc9 = -1863.65, 40.1, 1054.2--Origin door.
	local aaa10, bbb10, ccc10 = aaa9+3,bbb9,ccc9
	local aaa11, bbb11, ccc11 = aaa9-3,bbb9,ccc9
	local aaa12, bbb12, ccc12 = aaa9,bbb9,ccc9
	
	--doorset 4
	local aaa13, bbb13, ccc13 = -1857.65, 40.1, 1054.2--Origin door.
	local aaa14, bbb14, ccc14 = aaa13+3,bbb13,ccc13
	local aaa15, bbb15, ccc15 = aaa13-3,bbb13,ccc13
	local aaa16, bbb16, ccc16 = aaa13,bbb13,ccc13
	-----------
	local ra,rb,rz = 0, 0, -180--Flip 2nd door and 4th door to the correct rotation.
	--door types
	local doorvar = 1569 --Glass door
	--Door init/create
	local door1 = createObject(doorvar, aaa, bbb, ccc)--Origin door.
	local door2 = createObject(doorvar, aaa2, bbb2, ccc2, ra, rb, rz)--Door2 with rotation offsets.
	local door3 = createObject(doorvar, aaa3, bbb3, ccc3)
	local door4 = createObject(doorvar, aaa4, bbb4, ccc4, ra, rb, rz)--Door4 with rotation offsets.
	local door5 = createObject(doorvar, aaa5, bbb5, ccc5)--Origin door.
	local door6 = createObject(doorvar, aaa6, bbb6, ccc6, ra, rb, rz)
	local door7 = createObject(doorvar, aaa7, bbb7, ccc7)
	local door8 = createObject(doorvar, aaa8, bbb8, ccc8, ra, rb, rz)
	local door9 = createObject(doorvar, aaa9, bbb9, ccc9)
	local door10 = createObject(doorvar, aaa10, bbb10, ccc10, ra, rb, rz)
	local door11 = createObject(doorvar, aaa11, bbb11, ccc11)
	local door12 = createObject(doorvar, aaa12, bbb12, ccc12, ra, rb, rz)
	local door13 = createObject(doorvar, aaa13, bbb13, ccc13)
	local door14 = createObject(doorvar, aaa14, bbb14, ccc14, ra, rb, rz)
	local door15 = createObject(doorvar, aaa15, bbb15, ccc15)
	local door16 = createObject(doorvar, aaa16, bbb16, ccc16, ra, rb, rz)
	
	--markers
	baggageInterMarker = createMarker ( xx4,yy4,zz4, "corona", size, a2,b2,c2,intalpha)--Baggage interior marker.
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
	--End of door elements.
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
	--End of marker elements.
	setElementInterior(baggageFloor, airportInt)
	setElementDimension(baggageFloor, airportDim)
	setElementInterior(baggageFloor2, airportInt)
	setElementDimension(baggageFloor2, airportDim)
	setElementInterior(baggageFloor3, airportInt)
	setElementDimension(baggageFloor3, airportDim)
	--End of floor elements.
end
addEventHandler("onResourceStart", root, theDoors) --Create all objects and markers when resource starts.

--Make a table to allow for multiple entrance markers to the airport.
airportSFEnt = 
{
	{-1462, -267, 14.5},
	{-1421, -287.5, 14.5},
	{-1405, -303.5, 14.5},
	{-1382, -348, 14.5}
}

--Airport Entrance marker loop.
function markerLoop()
	for i,v in ipairs(airportSFEnt) do
		local interior = 0
		local dimension = 0
		airportSFMarker = createMarker ( v[1], v[2], v[3], "corona", size, a,b,c, alpha)
		setElementInterior(airportSFMarker, interior)
		setElementDimension(airportSFMarker, dimension)
		addEventHandler("onMarkerHit", airportSFMarker, handleEntMarker)--Call handleEntMarker when an entrance marker is hit by a player.
	end
end
addEventHandler("onResourceStart", root, markerLoop)--Start loop and iterate when resource is started.

--Marker Hit Functions
function handleEntMarker(hitElement)
	local elementType = getElementType(hitElement)
	if elementType == "player" then --If the element that hit the marker is a player.
		setElementPosition(hitElement, jj1,kk1,ll1)--Entrance warp to ticket room.
		setElementInterior(hitElement, airportInt)
		setElementDimension(hitElement, airportDim)
	end
end

ticketExtMarker = createMarker ( xx5,yy5,zz5, "corona", size, a2,b2,c2,intalpha)--Ticket room exit marker.
function handleExtMarker(hitElement)
	local elementType = getElementType(hitElement)
	if elementType == "player" then
		setElementPosition(hitElement, uu, ii, oo)--Warp player outside the airport.
		setElementInterior(hitElement, 0)
		setElementDimension(hitElement, 0)
		setElementRotation(hitElement, 0,0, 137.070)--Set the players rotation so their back is facing the camera.
	end
end
addEventHandler("onMarkerHit", ticketExtMarker, handleExtMarker)

baggageEntMarker = createMarker ( xx1,yy1,zz1, "corona", size, a2,b2,c2,intalpha)--Entrance marker next to first set of doors to Baggage Claim.
function handleBaggageEntMarker(hitElement)
	local elementType = getElementType(hitElement)
	if elementType == "player" then
		setElementPosition(hitElement, jj3, kk3, ll3)--Entrance warp to Baggage Claim.
		setElementInterior(hitElement, airportInt)
		setElementDimension(hitElement, airportDim)
		setElementRotation(hitElement, 0,0, 308.206)
	end
end
addEventHandler("onMarkerHit", baggageEntMarker, handleBaggageEntMarker)

baggageExtMarker = createMarker ( xx2,yy2,zz2, "corona", size, a2,b2,c2,intalpha)--Exit marker to leave Baggage claim and enter Ticket room.
function handleBaggageExtMarker(hitElement)
	local elementType = getElementType(hitElement)
	if elementType == "player" then
		setElementPosition(hitElement, jj2,kk2,ll2)--Ticket room.
		setElementInterior(hitElement, airportInt)
		setElementDimension(hitElement, airportDim)
		setElementRotation(hitElement, 0,0, 179.785)--Face player away from doors.
	end
end
addEventHandler("onMarkerHit", baggageExtMarker, handleBaggageExtMarker)

baggageDepartMarker = createMarker ( xx3,yy3,zz3, "corona", size, a2,b2,c2,intalpha)--Marker to leave baggage room and enter plane interior.
function handleDepartMarker(hitElement)
	local elementType = getElementType(hitElement)
	if elementType == "player" then
		setElementPosition(hitElement, jj4,kk4,ll4)
		setElementInterior(hitElement, planeInt)
		setElementDimension(hitElement, planeDim)
		setElementRotation(hitElement, 0,0,359.986)
	end
end
addEventHandler("onMarkerHit", baggageDepartMarker, handleDepartMarker)
