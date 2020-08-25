-- The path to the DLL file
sDLL = "Autoplay\\Docs\\SplashImage.dll";  
-- The numeric window handle for the application window
hWnd = Application.GetWndHandle();  
-- The image files list for animation (a comma ',' delimited string)
sImage = "Autoplay\\Images\\Img1.png, Autoplay\\Images\\Img2.png";  
-- The amount of time to display the dialog (in seconds)
nTimeSplash = 3; 
-- The amount of time to display the of one frame of animations (in milliseconds)
nTimeSlide = 400;
-- Whether the application will wait until the close the splash screen before continuing 
-- 1 - Wait, 0 - Don't wait
bWaitForReturn = 0;
-- Whether the user can close the splash screen by clicking on it 
-- 1 - Allow the user to click on the dialog to close it, 0 - Prevent the user from closing the dialog
bAllowClickToSkip = 1;

-- Displays a splash dialog containing an image
hDlg = DLL.CallFunction(sDLL, "SplashImage", hWnd..",\""..sImage.."\","..nTimeSplash..","..nTimeSlide..","..bWaitForReturn..","..bAllowClickToSkip, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL); 

-- This optional row allows to define by ear when this code was executed
Audio.Load(CHANNEL_NARRATION, "AutoPlay\\Audio\\sound.wav", true, false);