-- ON GLOBAL:

-----------------------------------------------------------------------------------------------
-- Глобальные переменные
-----------------------------------------------------------------------------------------------
sDllName		= _SourceFolder.."\\AutoPlay\\Docs\\waterctrl.dll";	-- имя загружаемого Dll	
bLoaded			= false;											-- флаг (true - картинка загружена, false - картинка загружена)
WaterMark		= {};												-- объект WaterMark
hWndWaterMark	= 0;												-- дескриптор окна картинки с эффектом воды

-----------------------------------------------------------------------------------------------
-- Обертки API фунций и waterctrl.dll
-- !!! НЕ ТРОГАТЬ !!!
-----------------------------------------------------------------------------------------------
function LoadLibrary(lpFileName) local hDll = tonumber(DLL.CallFunction("kernel32.dll", "LoadLibraryA", "\""..lpFileName.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return hDll end	
function FreeLibrary(hLibModule) local Result = tonumber(DLL.CallFunction("kernel32.dll", "FreeLibrary", hLibModule, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end	
function LoadImage(hInst, lpszName, uType, cxDesired, cyDesired, fuLoad) local hBmp = tonumber(DLL.CallFunction("user32.dll", "LoadImageA", hInst..",\""..lpszName.."\","..uType..","..cxDesired..","..cyDesired..","..fuLoad, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return hBmp end	
function FindWindowEx(hWnd1, hWnd2, lpsz1, lpsz2) local hWnd = tonumber(DLL.CallFunction("user32.dll", "FindWindowExA", hWnd1..","..hWnd2..","..lpsz1..","..lpsz2, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return hWnd end
function CreateWindowEx(dwExStyle, lpClassName, lpWindowName, dwStyle, x, y, nWidth, nHeight, hWndParent, hMenu, hInstance, lpParam) local hWnd = tonumber(DLL.CallFunction("user32.dll", "CreateWindowExA", dwExStyle..",\""..lpClassName.."\",\""..lpWindowName.."\","..dwStyle..","..x..","..y..","..nWidth..","..nHeight..","..hWndParent..","..hMenu..","..hInstance..","..lpParam, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return hWnd end
function DeleteObject(hObject) local Result = tonumber(DLL.CallFunction("gdi32.dll", "DeleteObject", hObject, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end	
function ChildWindowFromPoint(hWnd, x, y) local Result = tonumber(DLL.CallFunction("user32.dll", "ChildWindowFromPoint", hWnd..","..x..","..y, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end	
function SetParent(hWndChild, hWndNewParent) local Result = tonumber(DLL.CallFunction("user32.dll", "SetParent", hWndChild..","..hWndNewParent, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end	
function EnableWindow(hWnd, fEnable) local Result = tonumber(DLL.CallFunction("user32.dll", "EnableWindow", hWnd..","..fEnable, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end	

function enablewater(hWnd, Left, Top, hBitmap, WaterRadius, WaterHeight) local Result = tonumber(DLL.CallFunction(sDllName, "enablewater", hWnd..","..Left..","..Top..","..hBitmap..","..WaterRadius..","..WaterHeight, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end
function disablewater() local Result = tonumber(DLL.CallFunction(sDllName, "disablewater", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end
function waterblob(X, Y, WaterRadius, WaterHeight) local Result = tonumber(DLL.CallFunction(sDllName, "waterblob", X..","..Y..","..WaterRadius..","..WaterHeight, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end
function flattenwater() local Result = tonumber(DLL.CallFunction(sDllName, "flattenwater", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end
function setwaterparent(hWnd) local Result = tonumber(DLL.CallFunction(sDllName, "setwaterparent", hWnd, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)); return Result end

-----------------------------------------------------------------------------------------------
-- Создает картинку с эффектом воды
-----------------------------------------------------------------------------------------------
function WaterMark.Create(sImageName, Left, Top, Width, Height, WaterRadius, WaterHeight)
	-- Удаляем картинку с эффектом воды, если она уже была создана
	disablewater();																							-- удаляем картинку с эффектом воды
	if hBmp then DeleteObject(hBmp); end																	-- удаляем объект картинки
	if hDll then FreeLibrary(hDll);	end																		-- выгружаем Dll из памяти
	-- Создаем картинку с эффектом воды
	hDll = LoadLibrary(sDllName);																			-- дескриптор Dll
	local tImageSize = Image.GetFileInfo(sImageName);														-- размеры картинки из файла bmp
	if Width == 0 then Width = tImageSize.Width end															-- если не указана ширина картинки, то устанавливаем оригинальную ширину картинки
	if Height == 0 then Height = tImageSize.Height end														-- если не указана высота картинки, то устанавливаем оригинальную высоту картинки
	hBmp = LoadImage(0, sImageName, 0, Width, Height, 16);													-- дескриптор картинки bmp
	local hWnd = DialogEx.GetWndHandle();																	-- дескриптор диалогового окна
	if hWnd == -1 then																						-- если текущим является окно проекта		
		hWnd = Application.GetWndHandle();																	-- дескриптор окна проекта
		hWnd = FindWindowEx(hWnd, 0, 0, 0);																	-- дескриптор вложенного окна проекта
	end
	Result = enablewater(hWnd, Left, Top, hBmp, WaterRadius, WaterHeight);									-- эффект воды
	if Result == 1 then																						-- если создана картинка с эффектом воды
		hWndWaterMark = ChildWindowFromPoint(hWnd, Left, Top);												-- получаем дескриптор окна с картинкой
		bLoaded = true;																						-- устанавливаем флаг: картика загружена
	else																									-- если не создана картинка с эффектом воды
		hWndWaterMark = 0;																					-- обнуляем	дескриптор окна с картинкой
		bLoaded = false;																					-- устанавливаем флаг: картика не загружена
	end		
	return hWndWaterMark																					-- возвращаем дескриптор окна с картинкой
end

-----------------------------------------------------------------------------------------------
-- Удаляет картинку с эффектом воды
-----------------------------------------------------------------------------------------------
function WaterMark.Destroy()
	disablewater();																	-- удаляем картинку с эффектом воды
	if hBmp then DeleteObject(hBmp); end											-- удаляем объект картинки
	if hDll then FreeLibrary(hDll);	end												-- выгружаем Dll из памяти
	bLoaded = false;																-- сбрачываем флаг загрузки картинки
end

-----------------------------------------------------------------------------------------------
-- Касание воды в указанной точке
-----------------------------------------------------------------------------------------------
function WaterMark.Blob(X, Y, WaterRadius, WaterHeight)
	if bLoaded then									-- если картинка загружена
		waterblob(X, Y, WaterRadius, WaterHeight);	-- делаем касание воды
	end
end

-----------------------------------------------------------------------------------------------
-- Остановка движения воды
-----------------------------------------------------------------------------------------------
function WaterMark.Flatten()
	if bLoaded then		-- если картинка загружена
		flattenwater();	-- остановка движения воды
	end
end

-----------------------------------------------------------------------------------------------
-- Назначает новое родительское окно для окна картинки с эффектом воды и устанавливает новые координаты 
-----------------------------------------------------------------------------------------------
function WaterMark.SetParent(hWnd, Left, Top)
	if bLoaded then									-- если картинка загружена
		SetParent(hWndWaterMark, hWnd);				-- назначаем новое родительское окно для окна картинки
		Window.SetPos(hWndWaterMark, Left, Top);	-- новая позиция окна картинки с эффектом воды
	end
end

-----------------------------------------------------------------------------------------------
-- Активация/блокировка окна картинки с эффектом воды
-----------------------------------------------------------------------------------------------
function WaterMark.Enabled(fEnable)
	if bLoaded then											-- если картинка загружена
		if fEnable then fEnable = 1 else fEnable = 0 end	-- конвертируем флаг в числовой тип
		EnableWindow(hWndWaterMark, fEnable);				-- активируем/блокируем окно картинки с эффектом воды
	end
end

-----------------------------------------------------------------------------------------------
-- Отображение/скрытие окна картинки с эффектом воды
-----------------------------------------------------------------------------------------------
function WaterMark.Visible(fEnable)
	if bLoaded then						-- если картинка загружена
		if fEnable then 				
			Window.Show(hWndWaterMark);	-- отображаем окно картинки с эффектом воды
		else
			Window.Hide(hWndWaterMark);	-- скрываем окно картинки с эффектом воды	
		end
	end
end

-----------------------------------------------------------------------------------------------
-- Устанавливает маску для окна картинки с эффектом воды
-----------------------------------------------------------------------------------------------
function WaterMark.SetMask(sMaskName)
	if bLoaded then											-- если картинка загружена
		Window.SetMask(hWndWaterMark, sMaskName, true, 0);	-- применяем маску для окна картинки с эффектом воды
	end
end

-- On Preload

local sImageName	= "Autoplay\\Images\\WaterMark.bmp";									-- путь + имя картинки (!!! только BMP !!!)
local Left			= 0;																	-- левая позиция картинки
local Top			= 0;																	-- верхняя позиция картики
local Width			= 0;																	-- ширина картинки (если 0, то устанавливается оригинальная ширина картинки)
local Height		= 0;																	-- высота картинки (если 0, то устанавливается оригинальная высота картинки)
local WaterRadius	= 3;																	-- радиус волны
local WaterHeight	= 25;																	-- высота волны
 
hWndWM = WaterMark.Create(sImageName, Left, Top, Width, Height, WaterRadius, WaterHeight);	-- создаем картинку с эффектом воды и возвращает дескриптор окна с картинкой