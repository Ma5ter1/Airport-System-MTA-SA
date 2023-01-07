--**************************************************--
--AIRPORT SYSTEM--By:Trent Douglass AKA:Ma5ter.-------
--**************************************************--
--TODO:Replace elseifs with for loops. Add img to decorate GUI window "main".
--TODO:Add Tokyo map for players to teleport to.
--To Keep marker colors and style consistent.
a,b,c = 162,228,184 --Entrance marker color R,G,B.
a2,b2,c2 = a,b-100,c --Interior marker color R,G,B.
alpha = 120 -- Alpha for exterior markers.
intalpha = alpha+100 --Keep Marker alpha the same value and store it as a callable var.
size = 1.5 --Unify marker size.
planeInt = 1 --Plane Interior.
planeDim = 0 --Plane Dimension.
xx6, yy6, zz6 = 3, 34, 1200 --Plane Ext GUI Marker coords.
planeExtMarker = createMarker ( xx6,yy6,zz6, "corona", size, a2,b2,c2,intalpha)--Plane exit marker.
destTableLocs = {{1719, -2241, -2.33}, {1703, 1364, 11}, {-780, 464, 1364.33}, {-1441,-278, 14.33}, {395,2532,17}, {0,0,1}, {278,1968,17.99}}--LS, LV, LC, SF, Verdant, Tokyo, Area 51, store all location coordinates to call later.
destTable = {"Los Santos ITL", "Las Venturas International", "Francis International", "Easter Bay International", "Verdant Meadows", "Tokyo(WIP)", "Area 69(Clearance Required)"}--Gridlist text entries.
ticketPrices = {100, 100, 400, 200, 50, 2000, 10000}--Ticket prices for each corresponding location.
price = 0--Initialize price as 0 when no location is selected.

function planeMarkerHit(hitElement)
if source == planeExtMarker then --If plane exit marker is collided by player
    if getElementType(hitElement) == "player" then  --If a player hit the marker, not a vehicle then.
	showCursor(true) 
	main = guiCreateWindow(0.35, 0.35, 0.29, 0.31, "JUANK AIR GUI", true) --Main window to GUI, call globally to call in other functions later. Defines window title.
	guiWindowSetMovable(main, false) 
	guiWindowSetSizable(main, false) 
	guiSetAlpha(main, 0.73) 
	guiSetProperty(main, "CaptionColour", "FFFFFEFE") 		
	destList = guiCreateGridList(0.65, 0.37, 1.3, 0.6, true)--Destination gridlist for GUI.
	guiGridListAddColumn(destList, "Destinations", 0.85)--Gridlist Column Title.
	for k, v in ipairs(destTable) do --Iterate a for loop of table/array "destTable".
		guiGridListAddRow(destList, v) --Add each location to gridlist.
	end -- end loop
	priceLabel = guiCreateLabel  ( 0.47, 0.30, 1, 1, "Price:$"..price, true, main )--Price display, displays 0 when no items are selected.
	addEventHandler ( "onClientGUIClick", destList, doubleClick ) --Call DoubleClick function, which sets the price of the ticket and displays it.
	memo = guiCreateMemo(0.34, 0.7, 0.3, 0.5, "Thank you for flying with Juank Air! Please select your destination.", true, main) --Text within textbox in "main" GUI window.
	guiMemoSetReadOnly(memo, true) --Prevents entries from being edited
	acceptBtn = guiCreateButton(0.39, 0.38, 0.22, 0.07, "Accept", true, main) 
	cancelBtn = guiCreateButton(0.40, 0.50, 0.21, 0.07, "Cancel", true, main)
	guiSetProperty(cancelBtn, "NormalTextColour", "FFC30000") 
	addEventHandler("onClientGUIClick", cancelBtn, closeMain) --Call closeMain when cancel button is clicked.
	addEventHandler("onClientGUIClick", acceptBtn, acceptFunc) --Call acceptFunc when accept button is clicked.
	end
    end 
end 
addEventHandler ( "onClientMarkerHit", getRootElement(), planeMarkerHit ) --Call planeMarkerHit when player hits the marker.
 
function doubleClick (button) --Concat mouse button pressed when this function is called.
    if button == "left" then --if left mouse button is clicked --[TODO]-Iterate a loop through each grid list item and remove the elseif statements.
        local destName = guiGridListGetItemText ( destList, guiGridListGetSelectedItem ( destList ), 1 ) --Receive gridlist item the user clicked.
		if destName == destTable[1] then --Set string of ticket price when the user clicks a specified location within the gridlist.
			guiSetText (priceLabel, "Price:$"..ticketPrices[1]) --Concat the ticket price with the price display.
				playSoundFrontEnd(3) --Play a little tune when  the user clicks the gridlist item.
			elseif destName == destTable[2] then
				guiSetText (priceLabel, "Price:$"..ticketPrices[2])
				playSoundFrontEnd(3)
			elseif destName == destTable[3] then
				guiSetText (priceLabel, "Price:$"..ticketPrices[3])
				playSoundFrontEnd(3)
			elseif destName == destTable[4] then
				guiSetText (priceLabel, "Price:$"..ticketPrices[4])
				playSoundFrontEnd(3)
			elseif destName == destTable[5] then
				guiSetText (priceLabel, "Price:$"..ticketPrices[5])
				playSoundFrontEnd(3)
			elseif destName == destTable[6] then
				guiSetText (priceLabel, "Price:$"..ticketPrices[6])
				playSoundFrontEnd(3)
			elseif destName == destTable[7] then --Play a different tune when the user clicks a location they are not supposed to click.
				guiSetText (priceLabel, "Price:$"..ticketPrices[7])
				playSoundFrontEnd(2)
		end
	end
end

function acceptFunc()
	guiSetVisible (main, not guiGetVisible ( main ) ) 
	guiSetVisible (destList, false)
	showCursor(false)
	local destName = guiGridListGetItemText ( destList, guiGridListGetSelectedItem ( destList ), 1 )--[TODO]-Remove elseifs and replace the statements with a for loop for iterations and less lines of code.
	if destName == destTable[1] then --If a user selected an item in the gridlist.
		setPlayerMoney(getPlayerMoney(localPlayer)-ticketPrices[1])--Get the players' money and subtract it by the ticket price.
		playSoundFrontEnd(43)--Play a different tune telling the player they purchased a plane ticket.
		outputChatBox("JUANK AIR: TICKET TO "..destTable[1].." PURCHASED. ARRIVING IN 5 SECONDS.", 144,238,144)--Output dialogue.
		setTimer(function() setElementPosition(localPlayer, destTableLocs[1][1], destTableLocs[1][2], destTableLocs[1][3]) setElementInterior(localPlayer, 0) setElementDimension(localPlayer, 0) end, 5000, 1)--Set a timer that delays teleporting the player to the plane ticket destination. Current delay is 5000ms, or 5 seconds.
	elseif destName == destTable[2] then
		setPlayerMoney(getPlayerMoney(localPlayer)-ticketPrices[2])
		playSoundFrontEnd(43)
		outputChatBox("JUANK AIR: TICKET TO "..destTable[2].." PURCHASED. ARRIVING IN 5 SECONDS.", 144,238,144)
		setTimer(function() setElementPosition(localPlayer, destTableLocs[2][1], destTableLocs[2][2], destTableLocs[2][3]) setElementInterior(localPlayer, 0) setElementDimension(localPlayer, 0) end, 5000, 1)--Do the same interations for each location within the destTable table/array.
	elseif destName == destTable[3] then
		setPlayerMoney(getPlayerMoney(localPlayer)-ticketPrices[3])
		playSoundFrontEnd(43)
		outputChatBox("JUANK AIR: TICKET TO "..destTable[3].." PURCHASED. ARRIVING IN 10 SECONDS.", 144,238,144)
		setTimer(function() setElementInterior(localPlayer, 0) if getElementInterior(localPlayer) == 0 then setElementInterior(localPlayer, 1) end setElementPosition(localPlayer, destTableLocs[3][1], destTableLocs[3][2], destTableLocs[3][3]) end, 10000, 1)--Define varying delays for specific locations.
	elseif destName == destTable[4] then
		setPlayerMoney(getPlayerMoney(localPlayer)-ticketPrices[4])
		playSoundFrontEnd(43)
		outputChatBox("JUANK AIR: TICKET TO "..destTable[4].." PURCHASED. ARRIVING IN 5 SECONDS.", 144,238,144)
		setTimer(function() setElementPosition(localPlayer, destTableLocs[4][1], destTableLocs[4][2], destTableLocs[4][3]) setElementInterior(localPlayer, 0) setElementDimension(localPlayer, 0) end, 5000, 1)
	elseif destName == destTable[5] then
		setPlayerMoney(getPlayerMoney(localPlayer)-ticketPrices[5])
		playSoundFrontEnd(43)
		outputChatBox("JUANK AIR: TICKET TO "..destTable[5].." PURCHASED. ARRIVING IN 10 SECONDS.", 144,238,144)
		setTimer(function() setElementPosition(localPlayer, destTableLocs[5][1], destTableLocs[5][2], destTableLocs[5][3]) setElementInterior(localPlayer, 0) setElementDimension(localPlayer, 0) end, 10000, 1)
	elseif destName == destTable[6] then
		setPlayerMoney(getPlayerMoney(localPlayer)-ticketPrices[6])
		playSoundFrontEnd(43)
		outputChatBox("JUANK AIR: TICKET TO "..destTable[6].." PURCHASED. ARRIVING IN 20 SECONDS.", 144,238,144)
		setTimer(function() setElementPosition(localPlayer, destTableLocs[6][1], destTableLocs[6][2], destTableLocs[6][3]) setElementInterior(localPlayer, 0) setElementDimension(localPlayer, 0) end, 20000, 1)
	elseif destName == destTable[7] then
		if getElementData(localPlayer, "Clearance") == true then --If the player has element data, "Clearance" and has a boolean value equaling "true" then
			setPlayerMoney(getPlayerMoney(localPlayer)-ticketPrices[7])--Take players money corresponding to the ticket price table.
			playSoundFrontEnd(44)--Play a seperate sound.
			outputChatBox("EXPEDITED GOVERNMENT TICKET TO "..destTable[7].." PURCHASED. ARRIVING IN 3 SECONDS.", 128,128,0)
		 	setTimer(function() setElementPosition(localPlayer, destTableLocs[7][1], destTableLocs[7][2], destTableLocs[7][3]) setElementInterior(localPlayer, 0) setElementDimension(localPlayer, 0) end, 3000, 1)
		else
			playSoundFrontEnd(42)--Play a different sound if the player does not contain element data "Clearance" or "Clearance" equals false.
			outputChatBox("YOU NEED A GOV CLEARANCE TO PURCHASE A PLANE TICKET TO AREA 51", 255, 0, 0)--Output dialogue stating the same, don't take the players' valuable money.
			return
		end
	end
end

function closeMain() --Close GUI Function for the Cancel button.
	guiSetVisible (main, not guiGetVisible ( main ) ) --Remove GUI from player screen. 
	guiSetVisible (destList, false)
	showCursor(false) 
end 
