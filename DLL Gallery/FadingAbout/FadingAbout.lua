--FadingAbout Example

title = "About"--window title
btitle = "Information"--border title
atitle = "FadeOut About Dialog"-- app title
ver = "v1.0.0.1"-- version
linktext = "By D-Net Software"-- link text
linkaddy = "http://dnet-software.co.nr"-- link address

text = [[Enter your text in here

and another line of text

and yet another line of text]]-- body text

buttontext = "Close"-- button text
img = _SourceFolder.."\\AutoPlay\\Icons\\icon.ico"-- image (48x48 icon max)
width = 300-- width
height = 270 -- height
outtime = 1000 -- fade out time
App = Application.GetWndHandle(); -- to center the dialog

Args = "\""..title.."\",\""..btitle.."\",\""..atitle.."\",\""..ver.."\",\""..linktext.."\",\""..linkaddy.."\",\""..text.."\",\""..buttontext.."\",\""..img.."\","..width..","..height..","..outtime..","..App

result = DLL.CallFunction("AutoPlay\\Docs\\FadingAbout.dll", "ShowFadingAbout", Args, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
