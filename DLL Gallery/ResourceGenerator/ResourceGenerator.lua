------------------------------[[ SCRIPT: Global Script ]]------------------------------
function DelimitedStringToTable(DelimitedString, Delimiter)
	tbReturn = {};
	local strWorking;
	local nPos = nil;
	local strData;
	local nTableIndex = 1;
	local nDelimiterLength = String.Length(Delimiter);
	
	if(nDelimiterLength < 1)then
		tbReturn[nTableIndex] = DelimitedString;
		return tbReturn;
	end
	
	strWorking = DelimitedString;
	nPos = String.Find(strWorking,Delimiter);
	while(nPos ~= -1)do
		strData = String.Left(strWorking,nPos-1);
		tbReturn[nTableIndex] = strData;
		nTableIndex = nTableIndex + 1;
		local nLength = String.Length(strWorking);
		strWorking = String.Right(strWorking,nLength - (nPos + (nDelimiterLength-1)));
		nPos = String.Find(strWorking,Delimiter);
	end
	if(strWorking ~= "")then
		tbReturn[nTableIndex] = strWorking;
	end
	
	return tbReturn;
end

ResourceType = { Bin = 0, Xml = 1 };

ResourceGenerator = {};
function ResourceGenerator.GetResources(fileName, resourceType)
	resources = DLL.CallFunction("AutoPlay\\Docs\\ResourceGenerator.dll", "GetResources", "\""..fileName.."\""..","..resourceType, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	return DelimitedStringToTable(resources, "\r\n");
end
function ResourceGenerator.GetResource(fileName, resourceType, resourceName)
	return DLL.CallFunction("AutoPlay\\Docs\\ResourceGenerator.dll", "GetResource", "\""..fileName.."\""..","..resourceType..",".."\""..resourceName.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function ResourceGenerator.Generate(fileName, resourceType, resourceList)
	DLL.CallFunction("AutoPlay\\Docs\\ResourceGenerator.dll", "Generate", "\""..fileName.."\""..","..resourceType..",".."\""..resourceList.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function ResourceGenerator.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\ResourceGenerator.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Event: On Show Script ]]------------------------------
resource = ResourceGenerator.GetResource("AutoPlay\\Resources\\Resources.dll", ResourceType.Bin, "Sunset.jpg");
--resource = ResourceGenerator.GetResource("AutoPlay\\Resources\\Resources.xml", ResourceType.Xml, "Sunset.jpg");
error = ResourceGenerator.GetError();

if (error == "") then
	Image.Load("Image1", resource);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGenerate, Event: On Click Script ]]------------------------------
ResourceGenerator.Generate("AutoPlay\\Resources\\Resources.01.dll", ResourceType.Bin, "AutoPlay\\Images\\Sunset.jpg\r\nAutoPlay\\Images\\Water lilies.jpg\r\nAutoPlay\\Images\\Blue hills.jpg");
--ResourceGenerator.Generate("AutoPlay\\Resources\\Resources.01.xml", ResourceType.Xml, "AutoPlay\\Images\\Sunset.jpg\r\nAutoPlay\\Images\\Water lilies.jpg\r\nAutoPlay\\Images\\Blue hills.jpg");
error = ResourceGenerator.GetError();

if (error == "") then
	Dialog.Message("Success", "Resource Generated.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetResource, Event: On Click Script ]]------------------------------
resource = ResourceGenerator.GetResource("AutoPlay\\Resources\\Resources.dll", ResourceType.Bin, ListBox.GetItemText("ListBox1", ListBox.GetSelected("ListBox1")[1]));
--resource = ResourceGenerator.GetResource("AutoPlay\\Resources\\Resources.xml", ResourceType.Xml, ListBox.GetItemText("ListBox1", ListBox.GetSelected("ListBox1")[1]));
error = ResourceGenerator.GetError();

if (error == "") then
	Image.Load("Image1", resource);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetResources, Event: On Click Script ]]------------------------------
resources = ResourceGenerator.GetResources("AutoPlay\\Resources\\Resources.dll", ResourceType.Bin);
--resources = ResourceGenerator.GetResources("AutoPlay\\Resources\\Resources.xml", ResourceType.Xml);
error = ResourceGenerator.GetError();

if (error == "") then
	for i, v in resources do
		ListBox.AddItem("ListBox1", v, "");
	end
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ListBox1, Event: On Select Script ]]------------------------------
resource = ResourceGenerator.GetResource("AutoPlay\\Resources\\Resources.dll", ResourceType.Bin, ListBox.GetItemText("ListBox1", ListBox.GetSelected("ListBox1")[1]));
--resource = ResourceGenerator.GetResource("AutoPlay\\Resources\\Resources.xml", ResourceType.Xml, ListBox.GetItemText("ListBox1", ListBox.GetSelected("ListBox1")[1]));
error = ResourceGenerator.GetError();

if (error == "") then
	Image.Load("Image1", resource);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

