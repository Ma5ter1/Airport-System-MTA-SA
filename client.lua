--To Keep marker colors consistent

a,b,c = 162,228,184 --entrance marker color
a2,b2,c2 = a,b-100,c --interior marker color
alpha = 120
intalpha = alpha+100
size = 1.5
planeInt = 1 --Plane Interior
planeDim = 0 --Plane Dimension
xx6, yy6, zz6 = 3, 34, 1200 --Plane Ext GUI Marker

planeExtMarker = createMarker ( xx6,yy6,zz6, "corona", size, a2,b2,c2,intalpha)

destTableLocs = {{1719, -2241, -2.33}, {1703, 1364, 11}, {-780, 464, 1364.33}, {-1441,-278, 14.33}, {395,2532,17}, {0,0,1}, {278,1968,17.99}}--LS, LV, LC, SF, Verdant, Tokyo, Area 69
destTable = {"Los Santos ITL", "Las Venturas International", "Francis International", "Easter Bay International", "Verdant Meadows", "Tokyo(WIP)", "Area 69(Clearance Required)"}
ticketPrices = {100, 100, 400, 200, 50, 2000, 10000}
price = 0

function planeMarkerHit(hitElement)
if source == planeExtMarker then
    if getElementType(hitElement) == "player" then 
			showCursor(true) 
			main = guiCreateWindow(0.35, 0.35, 0.29, 0.31, "JUANK AIR GUI", true) 
			guiWindowSetMovable(main, false) 
			guiWindowSetSizable(main, false) 
			guiSetAlpha(main, 0.73) 
			guiSetProperty(main, "CaptionColour", "FFFFFEFE") 
			
			destList = guiCreateGridList(0.65, 0.37, 1.3, 0.6, true)
				guiGridListAddColumn(destList, "Destinations", 0.85)

			for k, v in ipairs(destTable) do
				guiGridListAddRow(destList, v)
			end--destination list
			priceLabel = guiCreateLabel  ( 0.47, 0.30, 1, 1, "Price:$"..price, true, main )--Price
			
			addEventHandler ( "onClientGUIClick", destList, DoubleClick )
			
			memo = guiCreateMemo(0.34, 0.7, 0.3, 0.5, "Thank you for flying with Juank Air! Please select your destination.", true, main)
			guiMemoSetReadOnly(memo, true)
			acceptBtn = guiCreateButton(0.39, 0.38, 0.22, 0.07, "Accept", true, main) 
			cancelBtn = guiCreateButton(0.40, 0.50, 0.21, 0.07, "Cancel", true, main)
			guiSetProperty(cancelBtn, "NormalTextColour", "FFC30000") 
			addEventHandler("onClientGUIClick", cancelBtn, closeMain)
			addEventHandler("onClientGUIClick", acceptBtn, acceptFunc)
			
		end
    end 
end 
addEventHandler ( "onClientMarkerHit", getRootElement(), planeMarkerHit ) 
 
function DoubleClick (button)
    if button == "left" then 
        local destName = guiGridListGetItemText ( destList, guiGridListGetSelectedItem ( destList ), 1 )
			if destName == destTable[1] then--set Price to 100
				guiSetText (priceLabel, "Price:$"..ticketPrices[1])
				playSoundFrontEnd(3)
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
			elseif destName == destTable[7] then
				guiSetText (priceLabel, "Price:$"..ticketPrices[7])
				playSoundFrontEnd(2)
			end
    end
end

function acceptFunc()
	guiSetVisible (main, not guiGetVisible ( main ) ) 
	guiSetVisible (destList, false)
	showCursor(false)
	local destName = guiGridListGetItemText ( destList, guiGridListGetSelectedItem ( destList ), 1 )
	
	if destName == destTable[1] then--set Price to 100
		setPlayerMoney(getPlayerMoney(localPlayer)-ticketPrices[1])
		playSoundFrontEnd(43)
		outputChatBox("JUANK AIR: TICKET TO "..destTable[1].." PURCHASED. ARRIVING IN 5 SECONDS.", 144,238,144)
		setTimer(function() setElementPosition(localPlayer, destTableLocs[1][1], destTableLocs[1][2], destTableLocs[1][3]) setElementInterior(localPlayer, 0) setElementDimension(localPlayer, 0) 
		end, 5000, 1)--Flight delay
	elseif destName == destTable[2] then
		setPlayerMoney(getPlayerMoney(localPlayer)-ticketPrices[2])
		playSoundFrontEnd(43)
		outputChatBox("JUANK AIR: TICKET TO "..destTable[2].." PURCHASED. ARRIVING IN 5 SECONDS.", 144,238,144)
		setTimer(function() setElementPosition(localPlayer, destTableLocs[2][1], destTableLocs[2][2], destTableLocs[2][3]) setElementInterior(localPlayer, 0) setElementDimension(localPlayer, 0) 
		end, 5000, 1)--Flight delay
	elseif destName == destTable[3] then
		setPlayerMoney(getPlayerMoney(localPlayer)-ticketPrices[3])
		playSoundFrontEnd(43)
		outputChatBox("JUANK AIR: TICKET TO "..destTable[3].." PURCHASED. ARRIVING IN 10 SECONDS.", 144,238,144)
		setTimer(function() setElementInterior(localPlayer, 0) if getElementInterior(localPlayer) == 0 then setElementInterior(localPlayer, 1) end setElementPosition(localPlayer, destTableLocs[3][1], destTableLocs[3][2], destTableLocs[3][3])
		end, 10000, 1)--Flight delay
	elseif destName == destTable[4] then
		setPlayerMoney(getPlayerMoney(localPlayer)-ticketPrices[4])
		playSoundFrontEnd(43)
		outputChatBox("JUANK AIR: TICKET TO "..destTable[4].." PURCHASED. ARRIVING IN 5 SECONDS.", 144,238,144)
		setTimer(function() setElementPosition(localPlayer, destTableLocs[4][1], destTableLocs[4][2], destTableLocs[4][3]) setElementInterior(localPlayer, 0) setElementDimension(localPlayer, 0) 
		end, 5000, 1)--Flight delay
	elseif destName == destTable[5] then
		setPlayerMoney(getPlayerMoney(localPlayer)-ticketPrices[5])
		playSoundFrontEnd(43)
		outputChatBox("JUANK AIR: TICKET TO "..destTable[5].." PURCHASED. ARRIVING IN 10 SECONDS.", 144,238,144)
		setTimer(function() setElementPosition(localPlayer, destTableLocs[5][1], destTableLocs[5][2], destTableLocs[5][3]) setElementInterior(localPlayer, 0) setElementDimension(localPlayer, 0) 
		end, 10000, 1)--Flight delay
	elseif destName == destTable[6] then
		setPlayerMoney(getPlayerMoney(localPlayer)-ticketPrices[6])
		playSoundFrontEnd(43)
		outputChatBox("JUANK AIR: TICKET TO "..destTable[6].." PURCHASED. ARRIVING IN 20 SECONDS.", 144,238,144)
		setTimer(function() setElementPosition(localPlayer, destTableLocs[6][1], destTableLocs[6][2], destTableLocs[6][3]) setElementInterior(localPlayer, 0) setElementDimension(localPlayer, 0) 
		end, 20000, 1)--Flight delay
	elseif destName == destTable[7] then
		if getElementData(localPlayer, "Clearance") == true then--clearance check
			setPlayerMoney(getPlayerMoney(localPlayer)-ticketPrices[7])--Check for clearance "GOV PROPERTY WARNING"
			playSoundFrontEnd(44)
			outputChatBox("EXPEDITED GOVERNMENT TICKET TO "..destTable[7].." PURCHASED. ARRIVING IN 3 SECONDS.", 128,128,0)
		 setTimer(function() setElementPosition(localPlayer, destTableLocs[7][1], destTableLocs[7][2], destTableLocs[7][3]) setElementInterior(localPlayer, 0) setElementDimension(localPlayer, 0) 
		end, 3000, 1)--Flight delay
		else
			playSoundFrontEnd(42)
			outputChatBox("YOU NEED A GOV CLEARANCE TO PURCHASE A PLANE TICKET TO AREA 69", 255, 0, 0)
			return
		end
	end

end

function closeMain() 
    guiSetVisible (main, not guiGetVisible ( main ) ) 
	guiSetVisible (destList, false)
    showCursor(false) 
end 