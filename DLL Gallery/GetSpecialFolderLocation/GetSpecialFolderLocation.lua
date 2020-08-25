index_Number = Input.GetText("Input1");

result = DLL.CallFunction("AutoPlay\\Docs\\GetSpecialFolderLocation.dll", "GetSpecialFolderLocation", index_Number, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
Dialog.Message("Notice", "The folder you are seeking is located at:\r\n\r\n" .. result, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);

--[[
 Vista
0 C:\Users\Username\Desktop\
2 C:\Users\Username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\
5 C:\Users\Username\Documents\
6 C:\Users\Username\Favorites\
7 C:\Users\Username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\
8 C:\Users\Username\AppData\Roaming\Microsoft\Windows\Recent\
9 C:\Users\Username\AppData\Roaming\Microsoft\Windows\SendTo\
11 C:\Users\Username\AppData\Roaming\Microsoft\Windows\Start Menu\
13 C:\Users\Username\Music\
14 C:\Users\Username\Videos\
16 C:\Users\Username\Desktop\
19 C:\Users\Username\AppData\Roaming\Microsoft\Windows\Network Shortcuts\
20 C:\Windows\Fonts\
21 C:\Users\Username\AppData\Roaming\Microsoft\Windows\Templates\
22 C:\ProgramData\Microsoft\Windows\Start Menu\
23 C:\ProgramData\Microsoft\Windows\Start Menu\Programs\
24 C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\
25 C:\Users\Public\Desktop\
26 C:\Users\Username\AppData\Roaming\
27 C:\Users\Username\AppData\Roaming\Microsoft\Windows\Printer Shortcuts\
28 C:\Users\Username\AppData\Local\
29 C:\Users\Username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\
30 C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\
31 C:\Users\Username\Favorites\
32 C:\Users\Username\AppData\Local\Microsoft\Windows\Temporary Internet Files\
33 C:\Users\Username\AppData\Roaming\Microsoft\Windows\Cookies\
34 C:\Users\Username\AppData\Local\Microsoft\Windows\History\
35 C:\ProgramData\
36 C:\Windows\
37 C:\Windows\System32\
38 C:\Program Files\
39 C:\Users\Username\Pictures\
40 C:\Users\Username\
41 C:\Windows\System32\
42 C:\Program Files\
43 C:\Program Files\Common Files\
44 C:\Program Files\Common Files\
45 C:\ProgramData\Microsoft\Windows\Templates\
46 C:\Users\Public\Documents\
47 C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools\
48 C:\Users\Username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Administrative Tools\
53 C:\Users\Public\Music\
54 C:\Users\Public\Pictures\
55 C:\Users\Public\Videos\
56 C:\Windows\Resources\
59 C:\Users\Username\AppData\Local\Microsoft\Windows\Burn\Burn\



 XP
0 C:\Documents And Settings\Username\Desktop\ 
2 C:\Documents And Settings\Username\start Menu\Programs\ 
5 C:\Documents And Settings\Username\My Documents\ 
6 C:\Documents And Settings\Username\Favorites\ 
7 C:\Documents And Settings\Username\start Menu\Programs\Startup\ 
8 C:\Documents And Settings\Username\Recent\ 
9 C:\Documents And Settings\Username\SendTo\ 
11 C:\Documents And Settings\Username\start Menu\ 
13 C:\Documents And Settings\Username\My Documents\My Music\ 
16 C:\Documents And Settings\Username\Desktop\ 
19 C:\Documents And Settings\Username\NetHood\ 
20 C:\WINDOWS\Fonts\ 
21 C:\Documents And Settings\Username\Templates\ 
22 C:\Documents And Settings\All Users\start Menu\ 
23 C:\Documents And Settings\All Users\start Menu\Programs\ 
24 C:\Documents And Settings\All Users\start Menu\Programs\Startup\ 
25 C:\Documents And Settings\All Users\Desktop\ 
26 C:\Documents And Settings\Username\Application Data\ 
27 C:\Documents And Settings\Username\PrintHood\ 
28 C:\Documents And Settings\Username\Local Settings\Application Data\ 
31 C:\Documents And Settings\All Users\Favorites\ 
32 C:\Documents And Settings\Username\Local Settings\Temporary Internet Files\ 
33 C:\Documents And Settings\Username\Cookies\ 
34 C:\Documents And Settings\Username\Local Settings\History\ 
35 C:\Documents And Settings\All Users\Application Data\ 
36 C:\WINDOWS\ 
37 C:\WINDOWS\system32\ 
38 C:\Program Files\ 
39 C:\Documents And Settings\Username\My Documents\My Pictures\ 
40 C:\Documents And Settings\Username\ 
41 C:\WINDOWS\system32\ 
43 C:\Program Files\Common Files\ 
45 C:\Documents And Settings\All Users\Templates\ 
46 C:\Documents And Settings\All Users\Documents\ 
47 C:\Documents And Settings\All Users\start Menu\Programs\Administrative Tools\ 
53 C:\Documents And Settings\All Users\Documents\My Music\ 
54 C:\Documents And Settings\All Users\Documents\My Pictures\ 
56 C:\WINDOWS\Resources\ 
59 C:\Documents And Settings\Username\Local Settings\Application Data\Microsoft\CD Burning\
]]