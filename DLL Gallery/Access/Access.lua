------------------------------[[ SCRIPT: Global Script ]]------------------------------
--Enter global declarations and functions here...
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


function StringToTable(searchResult)
	tableData={};
	rows=DelimitedStringToTable(searchResult, "\r\n");
	
	for i=1,Table.Count(rows) do
		columns=DelimitedStringToTable(rows[i], ",");
		row={ID=columns[1], FirstName=columns[2], LastName=columns[3]};
		tableData[i]=row;
	end

	return tableData;
end


function GetRecordID()
	dbLocation="AutoPlay\\Docs\\db.mdb";
	dbQuery="SELECT MAX(ID) AS ID FROM Artists";

	recordID = DLL.CallFunction("AutoPlay\\Docs\\Access.dll", "ExecuteQuery", "\""..dbLocation.."\""..",".."\""..dbQuery.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
	error = DLL.CallFunction("AutoPlay\\Docs\\Access.dll", "GetLastKnownError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

	if(error ~= "")then
		Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
	else
		return recordID;
	end
end 

------------------------------[[ SCRIPT: Page: Page1, Object: btDelete, Event: On Click Script ]]------------------------------
dbLocation="AutoPlay\\Docs\\db.mdb";
dbQuery="DELETE FROM Artists WHERE ID = "..ListBox.GetItemData("ListBox1", ListBox.GetSelected("ListBox1")[1]).."";

affectedRows = DLL.CallFunction("AutoPlay\\Docs\\Access.dll", "ExecuteNonQuery", "\""..dbLocation.."\""..",".."\""..dbQuery.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
error = DLL.CallFunction("AutoPlay\\Docs\\Access.dll", "GetLastKnownError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

if(error ~= "")then
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	ListBox.DeleteItem("ListBox1", ListBox.GetSelected("ListBox1")[1]);
	Dialog.Message("Notice", affectedRows, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btUpdate, Event: On Click Script ]]------------------------------
dbLocation="AutoPlay\\Docs\\db.mdb";
dbQuery="UPDATE Artists SET FirstName = '"..Input.GetText("tbFirstName").."', LastName = '"..Input.GetText("tbLastName").."' WHERE ID = "..ListBox.GetItemData("ListBox1", ListBox.GetSelected("ListBox1")[1]).."";

affectedRows = DLL.CallFunction("AutoPlay\\Docs\\Access.dll", "ExecuteNonQuery", "\""..dbLocation.."\""..",".."\""..dbQuery.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
error = DLL.CallFunction("AutoPlay\\Docs\\Access.dll", "GetLastKnownError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

if(error ~= "")then
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	ListBox.SetItemText("ListBox1", ListBox.GetSelected("ListBox1")[1], Input.GetText("tbFirstName")..", "..Input.GetText("tbLastName"));
	Dialog.Message("Notice", affectedRows, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btInsert, Event: On Click Script ]]------------------------------
dbLocation="AutoPlay\\Docs\\db.mdb";
dbQuery="INSERT INTO Artists (FirstName, LastName) VALUES ('"..Input.GetText("tbFirstName").."', '"..Input.GetText("tbLastName").."')";

affectedRows = DLL.CallFunction("AutoPlay\\Docs\\Access.dll", "ExecuteNonQuery", "\""..dbLocation.."\""..",".."\""..dbQuery.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
error = DLL.CallFunction("AutoPlay\\Docs\\Access.dll", "GetLastKnownError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

if(error ~= "")then
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	ListBox.AddItem("ListBox1", Input.GetText("tbFirstName")..", "..Input.GetText("tbLastName"), GetRecordID());
	Dialog.Message("Notice", affectedRows, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: btSearch, Event: On Click Script ]]------------------------------
dbLocation="AutoPlay\\Docs\\db.mdb";
dbQuery="SELECT ID, FirstName, LastName FROM Artists WHERE Firstname LIKE '%"..Input.GetText("tbFirstName").."%' AND LastName LIKE '%"..Input.GetText("tbLastName").."%' ORDER BY FirstName";

searchResult = DLL.CallFunction("AutoPlay\\Docs\\Access.dll", "ExecuteQuery", "\""..dbLocation.."\""..",".."\""..dbQuery.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
error = DLL.CallFunction("AutoPlay\\Docs\\Access.dll", "GetLastKnownError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);

if(error ~= "")then
	Dialog.Message("Notice", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	ListBox.DeleteItem("ListBox1", -1);

	dbResults=StringToTable(searchResult);
	for i=1,Table.Count(dbResults) do
		ListBox.AddItem("ListBox1", dbResults[i].FirstName..", "..dbResults[i].LastName, dbResults[i].ID);
	end
end

------------------------------[[ SCRIPT: Page: Page1, Object: ListBox1, Event: On Select Script ]]------------------------------
artistInfo=DelimitedStringToTable(ListBox.GetItemText("ListBox1", ListBox.GetSelected("ListBox1")[1]), ",")
Input.SetText("tbFirstName", artistInfo[1]);
Input.SetText("tbLastName", String.TrimLeft(artistInfo[2], nil));


