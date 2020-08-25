Debug.ShowWindow(true);

--------------------------------------------------------------------
-- support function
function DLLQuote(strText)
	return "\""..strText.."\""
end
--------------------------------------------------------------------
-- CountIcons(string FILE)
-- returns: -1 if any error else number of icons is returned

--this function will count the icone fount in a exe/dll file. 
function CountIcons(FILE)
	DLLRet = DLL.CallFunction("AutoPlay\\Docs\\GetIcon.dll", "CountIcon", DLLQuote(FILE), DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
	return DLLRet
end
--------------------------------------------------------------------
-- ExtractIconToICO(string InputFile,number IconNo,string OutputFile)
-- returns: -1 if any error else 0 is returned

-- this function will extract a icon from a exe/dll file and save it as a icon file (like for like)
function ExtractIconToICO(InputFile,IconNo,OutputFile)
	Args = DLLQuote(InputFile)..","..IconNo..","..DLLQuote(OutputFile) 
	DLLRet = DLL.CallFunction("AutoPlay\\Docs\\GetIcon.dll", "ExtractIconICO", Args, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
	return DLLRet
end
--------------------------------------------------------------------
-- ExtractIconToBMP(string InputFile,number IconNo,string OutputFile,number Size(0 = 16x16, 1 = 32x32))
-- returns: -1 if any error else 0 is returned

-- this function will extract a icon from a exe/dll file and save it as .bmp (you must set the size to save as (16x61 or 32x32)
function ExtractIconToBMP(InputFile,IconNo,OutputFile,Size)
	Args = DLLQuote(InputFile)..","..IconNo..","..DLLQuote(OutputFile)..","..Size
	DLLRet = DLL.CallFunction("AutoPlay\\Docs\\GetIcon.dll", "ExtractIconBMP", Args, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
	return DLLRet
end
--------------------------------------------------------------------
-- ExtractIconToPNG(string InputFile,number IconNo,string OutputFile,number Size (0 = 16x16, 1 = 32x32))
-- returns: -1 if any error else 0 is returned

-- this function will extract a icon from a exe/dll file and save it as .png (you must set the size to save as (16x61 or 32x32)
function ExtractIconToPNG(InputFile,IconNo,OutputFile,Size)
	Args = DLLQuote(InputFile)..","..IconNo..","..DLLQuote(OutputFile)..","..Size
	DLLRet = DLL.CallFunction("AutoPlay\\Docs\\GetIcon.dll", "ExtractIconPNG", Args, DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
	return DLLRet
end

--------------------------------------------------------------------
-- TEST ICON COUNT
Debug.Print(CountIcons("shell32.dll").."\r\n");
--------------------------------------------------------------------


--------------------------------------------------------------------
-- TEST ExtractIconToICO
InputFile = "shell32.dll"
IconNo = 1
OutputFile = _SourceFolder.."\\AutoPlay\\Docs\\test.ico"

Debug.Print(ExtractIconToICO(InputFile,IconNo,OutputFile).."\r\n");
--------------------------------------------------------------------


--------------------------------------------------------------------
-- TEST ExtractIconToBMP
InputFile = "shell32.dll"
IconNo = 1
OutputFile = _SourceFolder.."\\AutoPlay\\Docs\\test.bmp"
Size = 1 -- 0 = 16x16 , 1 = 32x32

Debug.Print(ExtractIconToBMP(InputFile,IconNo,OutputFile,Size).."\r\n");
--------------------------------------------------------------------


--------------------------------------------------------------------
-- TEST ExtractIconToPNG
InputFile = "shell32.dll"
IconNo = 1
OutputFile = _SourceFolder.."\\AutoPlay\\Docs\\test.png"
Size = 1 -- 0 = 16x16 , 1 = 32x32

Debug.Print(ExtractIconToPNG(InputFile,IconNo,OutputFile,Size).."\r\n");
--------------------------------------------------------------------

-- LOAD OUR BMP
Image.Load("Image1", _SourceFolder.."\\AutoPlay\\Docs\\test.bmp");
Label.SetText("Label1", "Icon Number: "..IconNo);


-- LOAD OUR PNG
Image.Load("Image2", _SourceFolder.."\\AutoPlay\\Docs\\test.png");
Label.SetText("Label4", "Icon Number: "..IconNo);


-- Define icon numbers for the image test
BMPIconNo = 1
PNGIconNo = 1