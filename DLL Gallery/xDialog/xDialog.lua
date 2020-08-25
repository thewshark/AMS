--=============================================================================--
-- Global functions used by xDialog dll                                        --
-- DO NOT EDIT                                                                 --
-- I repeat, DO NOT EDIT                                                       --
--=============================================================================--

xDialog = {

	Show_Calendar = function (Title, SetDate, DateFormat)
	
		hWnd = Application.GetWndHandle()
		
		if Title == "" then
			Title = "Select Date"
		end
			
		result = DLL.CallFunction(_SourceFolder.."\\AutoPlay\\Docs\\xDialog.dll", "ShowCal", "\""..Title.."\",\""..SetDate.."\",\""..DateFormat.."\",\""..hWnd.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL)
		
		return result
		
	end,
	
	------------------------------------------------------
	
	Show_Input = function (sTitle, sText, nWidth, nHeight)
	
		hWnd = Application.GetWndHandle()
	
		if Title == "" then
			Title = "Select Date"
		end
			
		if nWidth == "" or nWidth == 0 then
			nWidth = 300
		end
		
		if nHeight == "" or nHeight == 0 then
			nHeight = 200
		end
			
		result = DLL.CallFunction(_SourceFolder.."\\AutoPlay\\Docs\\xDialog.dll", "ShowInput", "\""..sTitle.."\",\""..sText.."\",\""..nWidth.."\",\""..nHeight.."\",\""..hWnd.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL)
		
		return result
		
	end,
	
	--------------------------------------------------------
	
	Show_ListBox = function (sTitle, sItems, nWidth, nHeight)
	
		hWnd = Application.GetWndHandle()
	
		if Title == "" then
			Title = "Select Item"
		end
			
		if nWidth == "" or nWidth == 0 then
			nWidth = 300
		end
		
		if nHeight == "" or nHeight == 0 then
			nHeight = 200
		end
			
		result = DLL.CallFunction(_SourceFolder.."\\AutoPlay\\Docs\\xDialog.dll", "ShowListBox", "\""..sTitle.."\",\""..sItems.."\",\""..nWidth.."\",\""..nHeight.."\",\""..hWnd.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL)
		
		return result
		
	end,
	
	---------------------------------------------------
	
	Show_ComboBox = function (sTitle, sItems, nWidth, nHeight)
	
		hWnd = Application.GetWndHandle()
	
		if Title == "" then
			Title = "Select Item"
		end
			
		if nWidth == "" or nWidth == 0 then
			nWidth = 150
		end
		
		if nHeight == "" or nHeight == 0 then
			nHeight = 60
		end
			
		result = DLL.CallFunction(_SourceFolder.."\\AutoPlay\\Docs\\xDialog.dll", "ShowComboBox", "\""..sTitle.."\",\""..sItems.."\",\""..nWidth.."\",\""..nHeight.."\",\""..hWnd.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL)
		
		return result
		
	end,
	
	---------------------------------------------------
	
	Show_MultiColumn_ListBox = function (sTitle, sItems, nReturnCol, nWidth, nHeight)
	
		hWnd = Application.GetWndHandle()
		
		if Title == "" then
			Title = "Select Item"
		end
				
		if nWidth == "" or nWidth == 0 then
			nWidth = 300
		end
			
		if nHeight == "" or nHeight == 0 then
			nHeight = 200
		end
		
		if nReturnCol == "" or nReturnCol == 0 then
			nReturnCol = "ALL"
		end
				
		result = DLL.CallFunction(_SourceFolder.."\\AutoPlay\\Docs\\xDialog.dll", "ShowMultiListBox", "\""..sTitle.."\",\""..sItems.."\",\""..nReturnCol.."\",\""..nWidth.."\",\""..nHeight.."\",\""..hWnd.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL)
			
		return result
		
	end,
	
	---------------------------------------------------
	
	Show_DragnDrop = function (sTitle, nWidth, nHeight)
	
	hWnd = Application.GetWndHandle()
	
	if Title == "" then
			Title = "Drag & drop files on the list below"
		end
			
		if nWidth == "" or nWidth == 0 then
			nWidth = 400
		end
		
		if nHeight == "" or nHeight == 0 then
			nHeight = 300
		end
			
		result = DLL.CallFunction(_SourceFolder.."\\AutoPlay\\Docs\\xDialog.dll", "ShowDragnDrop", "\""..sTitle.."\",\""..nWidth.."\",\""..nHeight.."\",\""..hWnd.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL)
		
		return result
		
	end,
	
		---------------------------------------------------
	
	Show_AboutBox = function (sTitle, sAppTitle, sAppVersion, sIcon, sText, sURL, nWidth, nHeight)
	
		hWnd = Application.GetWndHandle()
		
		if sTitle == "" then
			sTitle = "About"
		end
		
		if sAppTitle == "" then
			sAppTitle = "About"
		end
		
		sText = String.Replace(sText, "//r//n", "//n", true)
				
		if nWidth == "" or nWidth == 0 then
			nWidth = 400
		end
		
		if nHeight == "" or nHeight == 0 then
			nHeight = 300
		end
				
		result = DLL.CallFunction(_SourceFolder.."\\AutoPlay\\Docs\\xDialog.dll", "ShowAbout", "\""..sTitle.."\",\""..sAppTitle.."\",\""..sAppVersion.."\",\""..sIcon.."\",\""..sText.."\",\""..sURL.."\",\"".."".."\",\""..nWidth.."\",\""..nHeight.."\",\""..hWnd.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL)
			
		return result
		
	end

}

-- End of xDialog functions --