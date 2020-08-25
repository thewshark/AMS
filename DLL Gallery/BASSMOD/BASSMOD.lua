-- BassMod library (http://www.un4seen.com/)
cPathDLL = "AutoPlay\\Docs\\bassmod.dll";
-- Music module (IT / XM / S3M / MTM / MOD / UMX files) 
cPathMuz = "AutoPlay\\Docs\\MYTH - Warlords Battlecry IIIinstaller_2.xm";

-- Music flags - see help and sources if you want add custom features
BASS_MUSIC_RAMP         = "1";      -- normal ramping
BASS_MUSIC_RAMPS        = "2";      -- sensitive ramping
BASS_MUSIC_LOOP         = "4";      -- loop music
BASS_MUSIC_FT2MOD       = "16";     -- play .MOD as FastTracker 2 does
BASS_MUSIC_PT1MOD       = "32";     -- play .MOD as ProTracker 1 does
BASS_MUSIC_SURROUND	    = "512";    -- surround sound
BASS_MUSIC_SURROUND2    = "1024";   -- surround sound (mode 2)

-- Initializing, loading and playing (place PlayModsMusic() function in 'Project Actions' => 'On Startup')
function PlayModMusic()
   -- Loading dll into the memory
   hDLL = DLL.CallFunction("kernel32.dll", "LoadLibraryA", "\""..cPathDLL.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL); 
       if (hDLL ~= 0) then -- if loaded then
         -- Initializes an output device        
         iDll = DLL.CallFunction(cPathDLL, "BASSMOD_Init", "-1,44100,0", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL); 
             if (iDLL ~= 0) then -- if initialized then
             -- Loads a MOD music
             tMuz = DLL.CallFunction(cPathDLL, "BASSMOD_MusicLoad", "0,\""..cPathMuz.."\",0,0,"..BASS_MUSIC_RAMP+BASS_MUSIC_LOOP, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL); 
                 if (tMuz ~= 0) then 
                   -- Plays the MOD music
                   DLL.CallFunction(cPathDLL, "BASSMOD_MusicPlay", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL); 
                 end 
             end 
       end 
end 

-- Unloading dll from the memory
-- Place this function in 'Project Actions' => 'On Shutdown')
function UnloadModMusic()
	--Frees the MOD music's resources.
	DLL.CallFunction(cPathDLL, "BASSMOD_Free", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL); 
	DLL.CallFunction("kernel32.dll", "FreeLibrary", hDLL, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end