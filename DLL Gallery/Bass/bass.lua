-- Primer files
cPathDLL = _TempLaunchFolder .."\\bass.dll";   -- required library (http://www.un4seen.com/)
cPathMuz = _TempLaunchFolder .."\\zombie.mp3"; -- MP3/MP2/MP1/OGG/WAV/AIFF file
-- Mod music also supported (some modification in code required) but use for this smaller bassmod.dll

-- Parameters for playing, see included sources and help for bass.dll for more parameters
BASS_MUSIC_MONO = "2";
BASS_MUSIC_LOOP = "4";

-- Initializing, loading and playing (place PlayBassMusic() function in 'On Startup' actions)
function PlayBassMusic()
   -- Loading dll into the memory
   hDLL = DLL.CallFunction("kernel32.dll", "LoadLibraryA", "\""..cPathDLL.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL); 
   if (hDLL ~= 0) then -- if loaded then
     -- Initializes an output device
     fDll = DLL.CallFunction(cPathDLL, "BASS_Init", "-1,44100,0,0,0", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL); 
     if (fDLL ~= 0) then -- if initialized then
       -- Starts the output
       sDLL = DLL.CallFunction(cPathDLL, "BASS_Start", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL); 
       if (sDLL ~= 0) then -- if successful then
         -- Creates a sample stream from an MP3, MP2, MP1, OGG, WAV, AIFF or plugin supported file
         -- Please note: new bass.dll v2.4 used in some functions 64-bit parameters (QWORD)
         -- In this case parameters must be doubled (64 = 32 and 32), for example: "result, result, integer, integer"
         iDLL = DLL.CallFunction(cPathDLL, "BASS_StreamCreateFile", "0,\""..cPathMuz.."\", 0, 0, 0, 0,"..BASS_MUSIC_MONO+BASS_MUSIC_LOOP, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
         if (iDLL ~= 0) then
           -- Starts playback of a stream
           DLL.CallFunction(cPathDLL, "BASS_ChannelPlay", iDLL..",1", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL); 
         end 
       end 
     end 
   end 
end 

-- Unload dll from the memory
-- Please note: this function must be called every time before exiting from setup
-- Place it on each screen on 'On Cancel' properties:
--[[
if g_ConfirmSetupAbort() then
    UnloadBassMusic()
	Application.Exit(EXIT_REASON_USER_ABORTED);
end
]]--
-- On finish page place it on 'On Next' (and 'On Cancel') screen properties
--[[
UnloadBassMusic()
Screen.Next();
]]--
function UnloadBassMusic()
  -- Frees all resources used by the output device, including all its samples, streams and MOD musics
  DLL.CallFunction(cPathDLL, "BASS_Free", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL); 
  DLL.CallFunction("kernel32.dll", "FreeLibrary", hDLL, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end