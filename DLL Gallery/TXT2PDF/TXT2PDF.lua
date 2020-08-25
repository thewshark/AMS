function TXT2PDF(sFileTXT, sFilePDF, tbOptinoal)

	-- check optional table was passed in
	if type(tbOptinoal) == "nil" then

		-- no table so asign values
		tbOptinoal={}
		tbOptinoal.AppName=""
		tbOptinoal.Author=""
		tbOptinoal.Creator=""
		tbOptinoal.Keywords=""
		tbOptinoal.Subject=""
		tbOptinoal.Title=""
		tbOptinoal.BaseFont="Courier"
		tbOptinoal.PointSize = 10
		tbOptinoal.Rotate=0
		tbOptinoal.PageWidth = 8.5
		tbOptinoal.PageHeight = 11

	else
		
		-- table passed in so check fields
		if not tbOptinoal.AppName then tbOptinoal.AppName="" end 
		if not tbOptinoal.Author then tbOptinoal.Author="" end 
		if not tbOptinoal.Creator then tbOptinoal.Creator="" end 
		if not tbOptinoal.Keywords then tbOptinoal.Keywords="" end 
		if not tbOptinoal.Subject then tbOptinoal.Subject="" end 
		if not tbOptinoal.Title then tbOptinoal.Title="" end 
		if not tbOptinoal.BaseFont then tbOptinoal.BaseFont="Courier" end 
		if not tbOptinoal.PointSize then tbOptinoal.PointSize=10 end 
		if not tbOptinoal.Rotate then tbOptinoal.Rotate=0 end 
		if not tbOptinoal.PageWidth then tbOptinoal.PageWidth=8.5 end 
		if not tbOptinoal.PageHeight then tbOptinoal.PageHeight=11 end 
		
	end

	-- build argument string
	local sArgs	= "\""..sFileTXT.."\","
	sArgs=sArgs.."\""..sFilePDF.."\","	
	sArgs=sArgs.."\""..tbOptinoal.AppName.."\","
	sArgs=sArgs.."\""..tbOptinoal.Author.."\","
	sArgs=sArgs.."\""..tbOptinoal.Creator.."\","
	sArgs=sArgs.."\""..tbOptinoal.Keywords.."\","
	sArgs=sArgs.."\""..tbOptinoal.Subject.."\","
	sArgs=sArgs.."\""..tbOptinoal.Title.."\","
	sArgs=sArgs.."\""..tbOptinoal.BaseFont.."\","
	sArgs=sArgs..tbOptinoal.PointSize..","
	sArgs=sArgs..tbOptinoal.Rotate..","
	sArgs=sArgs..tbOptinoal.PageWidth..","
	sArgs=sArgs..tbOptinoal.PageHeight..","

	
	local Result = DLL.CallFunction("AutoPlay\\Docs\\TXT2PDF.dll", "TXT2PDF", sArgs, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return Result
	
end

local TXTFile = Input.GetText("Input1");
if TXTFile ~= "" then
	if TXT2PDF(TXTFile, _DesktopFolder.."\\AutoPlay.pdf", nil) == "0" then
		Dialog.Message("Notice","PDF file saved to desktop")
	end
end