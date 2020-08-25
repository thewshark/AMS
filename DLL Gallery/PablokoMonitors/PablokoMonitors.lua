--[[//Version: 10.0
PablokoMonitors;
GUID = {E9078EE1-3BE9-43DB-AA4D-E7CE6D2E8E8F};

Dispatch _DisplayInfo;
GUID = {15F10615-AFEC-43D1-A52B-2031043C495E};
  function MonitorCount: I4; stdcall;
  function GetMonitorID(out id: ^I4): I4; stdcall;
  function GetMonitorLeft(out id: ^I4): I4; stdcall;
  function GetMonitorTop(out id: ^I4): I4; stdcall;
  function GetMonitorRight(out id: ^I4): I4; stdcall;
  function GetMonitorBottom(out id: ^I4): I4; stdcall;
  function GetMonitorWidth(out id: ^I4): I4; stdcall;
  function GetMonitorHeight(out id: ^I4): I4; stdcall;

Dispatch _clsMonitor;
GUID = {06730F6C-6369-43EA-B3CC-D46ECAA2DB70};
  property-get Handle: I4; stdcall;
  property-put Handle(out : ^I4); stdcall;
  property-get Height: I4; stdcall;
  property-put Height(out : ^I4); stdcall;
  property-get Width: I4; stdcall;
  property-put Width(out : ^I4); stdcall;
  property-get Left: I4; stdcall;
  property-put Left(out : ^I4); stdcall;
  property-get Right: I4; stdcall;
  property-put Right(out : ^I4); stdcall;
  property-get Top: I4; stdcall;
  property-put Top(out : ^I4); stdcall;
  property-get Bottom: I4; stdcall;
  property-put Bottom(out : ^I4); stdcall;
  property-get WorkLeft: I4; stdcall;
  property-put WorkLeft(out : ^I4); stdcall;
  property-get WorkRight: I4; stdcall;
  property-put WorkRight(out : ^I4); stdcall;
  property-get WorkTop: I4; stdcall;
  property-put WorkTop(out : ^I4); stdcall;
  property-get WorkBottom: I4; stdcall;
  property-put WorkBottom(out : ^I4); stdcall;

Dispatch _clsMonitors;
GUID = {76BBC17A-4944-438E-96F1-648C7FFE3848};
  property-get Monitors: ^_Collection; stdcall;
  property-putref Monitors(: ^_Collection); stdcall;
  property-get DesktopLeft: I4; stdcall;
  property-get DesktopTop: I4; stdcall;
  property-get DesktopWidth: I4; stdcall;
  property-get DesktopHeight: I4; stdcall;
  function GetMonitorFromWindow(out hwnd: ^I4; out dwFlags: ^I4): I4; stdcall;
  function GetMonitorFromXYPoint(out x: ^I4; out y: ^I4; out dwFlags: ^I4): I4; stdcall;
  function Refresh; stdcall;]]
  
  -- remember register DLL
System.RegisterActiveX(_SourceFolder.."\\Autoplay\\Scripts\\PablokoMonitors.dll");

-- This dll need luacom.
require("luacom");

-- Create object...
ob = luacom.CreateObject("PablokoMonitors.DisplayInfo");

Text="DISPLAY INFORMATION:\r\n\r\n"
Text=Text.."Number of Displays: "..ob:MonitorCount()

for count = 1, ob:MonitorCount() do
    Text=Text.."\r\nMonitor #"..count
    Text=Text.."\r\nDevice ID:"..ob:GetMonitorID(count)
    Text=Text.."\r\nLeft:"..ob:GetMonitorLeft(count)
    Text=Text.."\r\nTop:"..ob:GetMonitorTop(count)
    Text=Text.."\r\nRight:"..ob:GetMonitorRight(count)
    Text=Text.."\r\nBottom:"..ob:GetMonitorBottom(count)
    Text=Text.."\r\nWidth:"..ob:GetMonitorWidth(count)
    Text=Text.."\r\nHeight:"..ob:GetMonitorHeight(count).."\r\n"
end

Paragraph.SetText("Paragraph1", Text);