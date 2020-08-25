------------------------------[[ SCRIPT: Global Script ]]------------------------------
ClipboardViewerEvents = { };
function ClipboardViewerEvents:DataArrived(dataType, data)
	Input.SetText("InputViewer", "["..System.GetTime(TIME_FMT_MIL).."]["..dataType.."]");
	
	if (dataType == "Text") then
		--text = data:Text();
		Input.SetText("InputText", data:Text());
	elseif (dataType == "Image") then
		--image = data:Image();
		--image:Save("image.png");
		data:Image():Save("image.png");
		Image.Load("Image1", "image.png");
	elseif (dataType == "FileDropList") then
		--fileDropList = data:FileDropList();
		for i, v in data:FileDropList() do
			ListBox.AddItem("ListBox1", v, "");
		end
	end
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonUnregisterActiveX, Event: On Click Script ]]------------------------------
System.UnregisterActiveX(Folder.GetCurrent().."\\AutoPlay\\Docs\\ClipboardViewer.dll");

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonViewerStop, Event: On Click Script ]]------------------------------
ClipboardViewer:Stop();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonViewerStart, Event: On Click Script ]]------------------------------
ClipboardViewer:Start();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonViewerCreate, Event: On Click Script ]]------------------------------
ClipboardViewer = luacom.CreateObject("ClipboardViewer.ClipboardViewerClass");
luacom.Connect(ClipboardViewer, ClipboardViewerEvents);

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonRegisterActiveX, Event: On Click Script ]]------------------------------
System.RegisterActiveX(Folder.GetCurrent().."\\AutoPlay\\Docs\\ClipboardViewer.dll");

