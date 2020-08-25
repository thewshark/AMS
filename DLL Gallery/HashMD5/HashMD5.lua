---------------------------------------------
-------------------------GetMD5HashfromString
---------------------------------------------

str = [[Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Aenean erat ligula, vehicula at placerat sed, aliquam quis arcu. 
Praesent ut dui massa, condimentum placerat ante. 
Sed fermentum felis id justo ornare dapibus. Cras auctor nisi id magna elementum scelerisque. 
Suspendisse at eros ut lectus lacinia lacinia rutrum sed magna. 
Praesent pharetra elit in ligula semper eu tempor augue venenatis. 
Suspendisse rutrum elementum condimentum. Nulla facilisi. 
Nulla pharetra enim eu arcu mattis volutpat. Etiam in ante nec erat suscipit dictum. 
Integer quis arcu quis massa porta lobortis. Aliquam at tincidunt tortor. 
Suspendisse mi tellus, sagittis in dignissim eu, semper vel sapien. Ut cursus porttitor felis.]]

result = DLL.CallFunction("AutoPlay\\Docs\\hash.dll", "GetMD5HashfromString", "\"" .. str .. "\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
Dialog.Message("", result);

---------------------------------------------
----------------------VerifyMD5HashfromString
---------------------------------------------

str = [[Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Aenean erat ligula, vehicula at placerat sed, aliquam quis arcu. 
Praesent ut dui massa, condimentum placerat ante. 
Sed fermentum felis id justo ornare dapibus. Cras auctor nisi id magna elementum scelerisque. 
Suspendisse at eros ut lectus lacinia lacinia rutrum sed magna. 
Praesent pharetra elit in ligula semper eu tempor augue venenatis. 
Suspendisse rutrum elementum condimentum. Nulla facilisi. 
Nulla pharetra enim eu arcu mattis volutpat. Etiam in ante nec erat suscipit dictum. 
Integer quis arcu quis massa porta lobortis. Aliquam at tincidunt tortor. 
Suspendisse mi tellus, sagittis in dignissim eu, semper vel sapien. Ut cursus porttitor felis.]]

hash = "50264edf34f7a46344700d94e8896df0"
result = DLL.CallFunction("AutoPlay\\Docs\\hash.dll", "VerifyMD5HashfromString", "\"" .. str .. "\""..",\""..hash .."\"", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
Dialog.Message("", result); -- 0 = false, 1 = true.


---------------------------------------------
---------------------------GetMD5HashfromFile
---------------------------------------------

FilePath = _SourceFolder.."\\Autoplay\\Docs\\sampler.txt"
result = DLL.CallFunction("AutoPlay\\Docs\\hash.dll", "GetMD5HashfromFile", "\"" .. FilePath .. "\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
Dialog.Message("", result);


---------------------------------------------
------------------------VerifyMD5HashfromFile
---------------------------------------------
str = TextFile.ReadToString("AutoPlay\\Docs\\sampler.txt");
hash = "5fb8d7e37b829a80b1216dd1ba43cbdb"
result = DLL.CallFunction("AutoPlay\\Docs\\hash.dll", "VerifyMD5HashfromString", "\"" .. str .. "\""..",\""..hash .."\"", DLL_RETURN_TYPE_INTEGER, DLL_CALL_STDCALL);
Dialog.Message("", result); -- 0 = false, 1 = true.