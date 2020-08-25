------------------------------[[ SCRIPT: Global Script ]]------------------------------
RotateType = {};
RotateType.Left = 3;
RotateType.Right = 1;

FlipType = {};
FlipType.X = 4;
FlipType.Y = 6;

SkewDirection = {};
SkewDirection.Left = 0
SkewDirection.Right = 1
SkewDirection.Up = 2
SkewDirection.Down = 3


Colors = {
        Transparent = 16777215,
        AliceBlue = -984833,
        AntiqueWhite = -332841,
        Aqua = -16711681,
        Aquamarine = -8388652,
        Azure = -983041,
        Beige = -657956,
        Bisque = -6972,
        Black = -16777216,
        BlanchedAlmond = -5171,
        Blue = -16776961,
        BlueViolet = -7722014,
        Brown = -5952982,
        BurlyWood = -2180985,
        CadetBlue = -10510688,
        Chartreuse = -8388864,
        Chocolate = -2987746,
        Coral = -32944,
        CornflowerBlue = -10185235,
        Cornsilk = -1828,
        Crimson = -2354116,
        Cyan = -16711681,
        DarkBlue = -16777077,
        DarkCyan = -16741493,
        DarkGoldenrod = -4684277,
        DarkGray = -5658199,
        DarkGreen = -16751616,
        DarkKhaki = -4343957,
        DarkMagenta = -7667573,
        DarkOliveGreen = -11179217,
        DarkOrange = -29696,
        DarkOrchid = -6737204,
        DarkRed = -7667712,
        DarkSalmon = -1468806,
        DarkSeaGreen = -7357301,
        DarkSlateBlue = -12042869,
        DarkSlateGray = -13676721,
        DarkTurquoise = -16724271,
        DarkViolet = -7077677,
        DeepPink = -60269,
        DeepSkyBlue = -16728065,
        DimGray = -9868951,
        DodgerBlue = -14774017,
        Firebrick = -5103070,
        FloralWhite = -1296,
        ForestGreen = -14513374,
        Fuchsia = -65281,
        Gainsboro = -2302756,
        GhostWhite = -460545,
        Gold = -10496,
        Goldenrod = -2448096,
        Gray = -8355712,
        Green = -16744448,
        GreenYellow = -5374161,
        Honeydew = -983056,
        HotPink = -38476,
        IndianRed = -3318692,
        Indigo = -11861886,
        Ivory = -16,
        Khaki = -989556,
        Lavender = -1644806,
        LavenderBlush = -3851,
        LawnGreen = -8586240,
        LemonChiffon = -1331,
        LightBlue = -5383962,
        LightCoral = -1015680,
        LightCyan = -2031617,
        LightGoldenrodYellow = -329006,
        LightGreen = -7278960,
        LightGray = -2894893,
        LightPink = -18751,
        LightSalmon = -24454,
        LightSeaGreen = -14634326,
        LightSkyBlue = -7876870,
        LightSlateGray = -8943463,
        LightSteelBlue = -5192482,
        LightYellow = -32,
        Lime = -16711936,
        LimeGreen = -13447886,
        Linen = -331546,
        Magenta = -65281,
        Maroon = -8388608,
        MediumAquamarine = -10039894,
        MediumBlue = -16777011,
        MediumOrchid = -4565549,
        MediumPurple = -7114533,
        MediumSeaGreen = -12799119,
        MediumSlateBlue = -8689426,
        MediumSpringGreen = -16713062,
        MediumTurquoise = -12004916,
        MediumVioletRed = -3730043,
        MidnightBlue = -15132304,
        MintCream = -655366,
        MistyRose = -6943,
        Moccasin = -6987,
        NavajoWhite = -8531,
        Navy = -16777088,
        OldLace = -133658,
        Olive = -8355840,
        OliveDrab = -9728477,
        Orange = -23296,
        OrangeRed = -47872,
        Orchid = -2461482,
        PaleGoldenrod = -1120086,
        PaleGreen = -6751336,
        PaleTurquoise = -5247250,
        PaleVioletRed = -2396013,
        PapayaWhip = -4139,
        PeachPuff = -9543,
        Peru = -3308225,
        Pink = -16181,
        Plum = -2252579,
        PowderBlue = -5185306,
        Purple = -8388480,
        Red = -65536,
        RosyBrown = -4419697,
        RoyalBlue = -12490271,
        SaddleBrown = -7650029,
        Salmon = -360334,
        SandyBrown = -744352,
        SeaGreen = -13726889,
        SeaShell = -2578,
        Sienna = -6270419,
        Silver = -4144960,
        SkyBlue = -7876885,
        SlateBlue = -9807155,
        SlateGray = -9404272,
        Snow = -1286,
        SpringGreen = -16711809,
        SteelBlue = -12156236,
        Tan = -2968436,
        Teal = -16744320,
        Thistle = -2572328,
        Tomato = -40121,
        Turquoise = -12525360,
        Violet = -1146130,
        Wheat = -663885,
        White = -1,
        WhiteSmoke = -657931,
        Yellow = -256,
        YellowGreen = -6632142,
	};

FontStyle = {
        Regular = "Regular",
        Bold = "Bold",
        Italic = "Italic",
        Underline = "Underline",
        Strikeout = "Strikeout",
    };
    
-- Specifies the format of the color data for each pixel in the image.
PixelFormat = {
        -- No pixel format is specified.
        DontCare = 0,
        -- The pixel format is undefined.
        Undefined = 0,
        -- The maximum value for this enumeration.
        Max = 15,
        -- The pixel data contains color-indexed values, which means the values are
        -- an index to colors in the system color table, as opposed to individual color
        -- values.
        Indexed = 65536,
        -- The pixel data contains GDI colors.
        Gdi = 131072,
        -- Specifies that the format is 16 bits per pixel; 5 bits each are used for
        -- the red, green, and blue components. The remaining bit is not used.
        Format16bppRgb555 = 135173,
        -- Specifies that the format is 16 bits per pixel; 5 bits are used for the red
        -- component, 6 bits are used for the green component, and 5 bits are used for
        -- the blue component.
        Format16bppRgb565 = 135174,
        -- Specifies that the format is 24 bits per pixel; 8 bits each are used for
        -- the red, green, and blue components.
        Format24bppRgb = 137224,
        -- Specifies that the format is 32 bits per pixel; 8 bits each are used for
        -- the red, green, and blue components. The remaining 8 bits are not used.
        Format32bppRgb = 139273,
        -- Specifies that the pixel format is 1 bit per pixel and that it uses indexed
        -- color. The color table therefore has two colors in it.
        Format1bppIndexed = 196865,
        -- Specifies that the format is 4 bits per pixel, indexed.
        Format4bppIndexed = 197634,
        -- Specifies that the format is 8 bits per pixel, indexed. The color table therefore
        -- has 256 colors in it.
        Format8bppIndexed = 198659,
        -- The pixel data contains alpha values that are not premultiplied.
        Alpha = 262144,
        -- The pixel format is 16 bits per pixel. The color information specifies 32,768
        -- shades of color, of which 5 bits are red, 5 bits are green, 5 bits are blue,
        -- and 1 bit is alpha.
        Format16bppArgb1555 = 397319,
        -- The pixel format contains premultiplied alpha values.
        PAlpha = 524288,
        -- Specifies that the format is 32 bits per pixel; 8 bits each are used for
        -- the alpha, red, green, and blue components. The red, green, and blue components
        -- are premultiplied, according to the alpha component.
        Format32bppPArgb = 925707,
        -- Reserved.
        Extended = 1048576,
        -- The pixel format is 16 bits per pixel. The color information specifies 65536
        -- shades of gray.
        Format16bppGrayScale = 1052676,
        -- Specifies that the format is 48 bits per pixel; 16 bits each are used for
        -- the red, green, and blue components.
        Format48bppRgb = 1060876,
        -- Specifies that the format is 64 bits per pixel; 16 bits each are used for
        -- the alpha, red, green, and blue components. The red, green, and blue components
        -- are premultiplied according to the alpha component.
        Format64bppPArgb = 1851406,
        -- The default pixel format of 32 bits per pixel. The format specifies 24-bit
        -- color depth and an 8-bit alpha channel.
        Canonical = 2097152,
        -- Specifies that the format is 32 bits per pixel; 8 bits each are used for
        -- the alpha, red, green, and blue components.
        Format32bppArgb = 2498570,
        -- Specifies that the format is 64 bits per pixel; 16 bits each are used for
        -- the alpha, red, green, and blue components.
        Format64bppArgb = 3424269,
    };

-- Specifies the border styles for a window.
WindowBorderStyle = {
        -- No border.
        None = 0,
        -- A fixed, single-line border.
        FixedSingle = 1,
        -- A fixed, three-dimensional border.
        Fixed3D = 2,
        -- A thick, fixed dialog-style border.
        FixedDialog = 3,
        -- A resizable border.
        Sizable = 4,
        -- A tool window border that is not resizable. A tool window does not appear
        -- in the taskbar or in the window that appears when the user presses ALT+TAB.
        FixedToolWindow = 5,
        -- A resizable tool window border. A tool window does not appear in the taskbar
        -- or in the window that appears when the user presses ALT+TAB.
        SizableToolWindow = 6,
    }

image = {};
function image.Open(imgRef, srcImageFile)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "Open", "\""..imgRef.."\""..",".."\""..srcImageFile.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.Create(imgRef, color, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "Create", "\""..imgRef.."\""..","..color..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function image.DrawImage(imgRef, imageFileB, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "DrawImage", "\""..imgRef.."\""..",".."\""..imageFileB.."\""..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.DrawString(imgRef, string, fontFamily, emSize, fontStyle, color, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "DrawString", "\""..imgRef.."\""..",".."\""..string.."\""..",".."\""..fontFamily.."\""..","..emSize..",".."\""..fontStyle.."\""..","..color..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.DrawStringGradient(imgRef, string, fontFamily, emSize, fontStyle, color1, color2, angle, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "DrawStringGradient", "\""..imgRef.."\""..",".."\""..string.."\""..",".."\""..fontFamily.."\""..","..emSize..",".."\""..fontStyle.."\""..","..color1 ..","..color2 ..","..angle..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.DrawStringImage(imgRef, string, fontFamily, emSize, fontStyle, textureImage, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "DrawStringImage", "\""..imgRef.."\""..",".."\""..string.."\""..",".."\""..fontFamily.."\""..","..emSize..",".."\""..fontStyle.."\""..",".."\""..textureImage.."\""..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.DrawRectangle(imgRef, color, size, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "DrawRectangle", "\""..imgRef.."\""..","..color..","..size..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.DrawRectangleGradient(imgRef, color1, color2, angle, size, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "DrawRectangleGradient", "\""..imgRef.."\""..","..color1 ..","..color2 ..","..angle..","..size..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.DrawRectangleImage(imgRef, textureImage, size, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "DrawRectangleImage", "\""..imgRef.."\""..",".."\""..textureImage.."\""..","..size..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.DrawEllipse(imgRef, color, size, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "DrawEllipse", "\""..imgRef.."\""..","..color..","..size..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.DrawEllipseGradient(imgRef, color1, color2, angle, size, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "DrawEllipseGradient", "\""..imgRef.."\""..","..color1 ..","..color2 ..","..angle..","..size..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.DrawEllipseImage(imgRef, textureImage, size, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "DrawEllipseImage", "\""..imgRef.."\""..",".."\""..textureImage.."\""..","..size..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.DrawLine(imgRef, color, size, x1, y1, x2, y2)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "DrawLine", "\""..imgRef.."\""..","..color..","..size..","..x1..","..y1..","..x2..","..y2, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.DrawLineGradient(imgRef, color1, color2, angle, size, x1, y1, x2, y2)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "DrawLineGradient", "\""..imgRef.."\""..","..color1 ..","..color2 ..","..angle..","..size..","..x1..","..y1..","..x2..","..y2, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.DrawLineImage(imgRef, textureImage, size, x1, y1, x2, y2)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "DrawLineImage", "\""..imgRef.."\""..",".."\""..textureImage.."\""..","..size..","..x1..","..y1..","..x2..","..y2, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.DrawLines(imgRef, color, size, points)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "DrawLines", "\""..imgRef.."\""..","..color..","..size..",".."\""..points.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.DrawLinesGradient(imgRef, color1, color2, angle, size, points)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "DrawLinesGradient", "\""..imgRef.."\""..","..color1 ..","..color2 ..","..angle..","..size..",".."\""..points.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.DrawLinesImage(imgRef, textureImage, size, points)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "DrawLinesImage", "\""..imgRef.."\""..",".."\""..textureImage.."\""..","..size..",".."\""..points.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.FillRectangle(imgRef, color, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "FillRectangle", "\""..imgRef.."\""..","..color..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.FillRectangleGradient(imgRef, color1, color2, angle, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "FillRectangleGradient", "\""..imgRef.."\""..","..color1 ..","..color2 ..","..angle..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.FillRectangleImage(imgRef, textureImage, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "FillRectangleImage", "\""..imgRef.."\""..",".."\""..textureImage.."\""..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.FillEllipse(imgRef, color, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "FillEllipse", "\""..imgRef.."\""..","..color..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.FillEllipseGradient(imgRef, color1, color2, angle, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "FillEllipseGradient", "\""..imgRef.."\""..","..color1 ..","..color2 ..","..angle..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.FillEllipseImage(imgRef, textureImage, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "FillEllipseImage", "\""..imgRef.."\""..",".."\""..textureImage.."\""..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
-- Resizes the image in percent keeping the relation width, height. If size < 100, get a smaller than original image. if size == 100, nothing happens. If size > 100, get a bigger than original image.
function image.Resize(imgRef, size)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "Resize", "\""..imgRef.."\""..","..size, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.Crop(imgRef, x, y, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "Crop", "\""..imgRef.."\""..","..x..","..y..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.Rotate(imgRef, rotateType)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "Rotate", "\""..imgRef.."\""..","..rotateType, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.RotateImage(imgRef, angle)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "RotateImage", "\""..imgRef.."\""..","..angle, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.Flip(imgRef, flipType)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "Flip", "\""..imgRef.."\""..","..flipType, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.Skew(imgRef, percent, skewDirection)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "Skew", "\""..imgRef.."\""..","..percent..","..skewDirection, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Add image transparency. Value must be from 0-10.
function image.Transparency(imgRef, value)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "Transparency", "\""..imgRef.."\""..","..value, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.Clone(imgRef, x, y, width, height, pf)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "Clone", "\""..imgRef.."\""..","..x..","..y..","..width..","..height..","..pf, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
--Saves the image with the original filename. If image is created using Create function, function Save can't be used.
function image.Save(imgRef)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "Save", "\""..imgRef.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.SaveAs(imgRef, destImageFile)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "SaveAs", "\""..imgRef.."\""..",".."\""..destImageFile.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.ImageViewerSettings(hwnd, title, wbs)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "ImageViewerSettings", hwnd..",".."\""..title.."\""..","..wbs, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.ImageViewerImage(imgRef)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "ImageViewerImage", "\""..imgRef.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.ShowImageViewer()
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "ShowImageViewer", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.HideImageViewer()
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "HideImageViewer", "", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.View(imgRef)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "View", "\""..imgRef.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function image.GetFormat(imgRef)
	return DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "GetFormat", "\""..imgRef.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function image.GetSize(imgRef)
	return DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "GetSize", "\""..imgRef.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function image.GetResolution(imgRef)
	return DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "GetResolution", "\""..imgRef.."\"", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end
function image.GetPixel(imgRef, x, y)
	color = DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "GetPixel", "\""..imgRef.."\""..","..x..","..y, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
	return String.ToNumber(color);
end
--Set image size. Does not keep the relation width, height.
function image.SetSize(imgRef, width, height)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "SetSize", "\""..imgRef.."\""..","..width..","..height, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.SetResolution(imgRef, xDpi, yDpi)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "SetResolution", "\""..imgRef.."\""..","..xDpi..","..yDpi, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end
function image.SetPixel(imgRef, x, y, color)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "SetPixel", "\""..imgRef.."\""..","..x..","..y..","..color, DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function image.Close(imgRef)
	DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "Close", "\""..imgRef.."\"", DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL);
end

function image.GetError()
	return DLL.CallFunction("AutoPlay\\Docs\\Image.dll", "GetError", "", DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonTest2, Event: On Click Script ]]------------------------------
image.Open("image1", "AutoPlay\\Images\\Sunset.jpg");
--image.Open("image2", "AutoPlay\\Images\\Water lilies.jpg");

image.Create("image3", Colors.White, 800, 600);
image.FillRectangleGradient("image3", Colors.Transparent, Colors.Blue, 270, 0, 0, 800, 600);
image.Transparency("image3", 5);

image.Create("image4", Colors.Transparent, 800, 600);
image.FillEllipseGradient("image4", Colors.LightGreen, Colors.White, 270, 0, 0, 800, 600);
image.Transparency("image4", 5);

--image.DrawImage("image1", "image2", 50, 50, 400, 300);
image.DrawImage("image1", "image3", 50, 50, 400, 300);
image.DrawImage("image1", "image4", 150, 150, 400, 300);

image.ImageViewerSettings(Application.GetWndHandle(), "ImageViewer", WindowBorderStyle.Sizable);
image.ImageViewerImage("image1");
image.ShowImageViewer();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonTest, Event: On Click Script ]]------------------------------
image.Open("image1", "AutoPlay\\Images\\Sunset.jpg");
image.Open("image2", "AutoPlay\\Images\\Water lilies.jpg");
image.Transparency("image2", 5);
--image.DrawImage("image1", "image2", 0, 0, 800, 600);
image.DrawImage("image1", "image2", 50, 50, 400, 300);

image.ImageViewerSettings(Application.GetWndHandle(), "ImageViewer", WindowBorderStyle.Sizable);
image.ImageViewerImage("image1");
image.ShowImageViewer();

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonClose, Event: On Click Script ]]------------------------------
image.Close("image1");
error = image.GetError();

if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSetPixel, Event: On Click Script ]]------------------------------
image.SetResolution("image1", 300, 300);
error = image.GetError();

if (error == "") then
	Dialog.Message("ImageResolution", "Image Resolution Set.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSetResolution, Event: On Click Script ]]------------------------------
image.SetResolution("image1", 300, 300);
error = image.GetError();

if (error == "") then
	Dialog.Message("ImageResolution", "Image Resolution Set.", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSetSize, Event: On Click Script ]]------------------------------
image.SetSize("image1", 400, 300);
error = image.GetError();

if (error == "") then
	--Dialog.Message("ImageSize", imageSize, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetPixel, Event: On Click Script ]]------------------------------
pixelcolor = image.GetPixel("image1", 10, 10);
error = image.GetError();

if (error == "") then
	Dialog.Message("PixelColor", pixelcolor, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetResolution, Event: On Click Script ]]------------------------------
imageResolution = image.GetResolution("image1");
error = image.GetError();

if (error == "") then
	Dialog.Message("ImageResolution", imageResolution, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetSize, Event: On Click Script ]]------------------------------
imageSize = image.GetSize("image1");
error = image.GetError();

if (error == "") then
	Dialog.Message("ImageSize", imageSize, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonGetFormat, Event: On Click Script ]]------------------------------
imageFormat = image.GetFormat("image1");
error = image.GetError();

if (error == "") then
	Dialog.Message("ImageFormat", imageFormat, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonView, Event: On Click Script ]]------------------------------
image.View("image1");
error = image.GetError();

if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonHideImageViewer, Event: On Click Script ]]------------------------------
image.HideImageViewer();
error = image.GetError();

if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonShowImageViewer, Event: On Click Script ]]------------------------------
image.ShowImageViewer();
error = image.GetError();

if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonImageViewerImage, Event: On Click Script ]]------------------------------
image.ImageViewerImage("image1");
error = image.GetError();

if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonImageViewerSettings, Event: On Click Script ]]------------------------------
image.ImageViewerSettings(Application.GetWndHandle(), "ImageViewer", WindowBorderStyle.Sizable);
error = image.GetError();

if (error ~= "") then
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSaveAs, Event: On Click Script ]]------------------------------
image.SaveAs("image1", "AutoPlay\\Images\\Sunset.01.png");
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", "AutoPlay\\Images\\Sunset.01.png");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSave, Event: On Click Script ]]------------------------------
image.Save("image1");
error = image.GetError();

if (error == "") then
	Image.Load("Image1", "AutoPlay\\Images\\Sunset.jpg");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonClone, Event: On Click Script ]]------------------------------
image.Clone("image1", 10, 10, 400, 300, PixelFormat.DontCare);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonTransparency, Event: On Click Script ]]------------------------------
image.Transparency("image1", 5);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonSkew, Event: On Click Script ]]------------------------------
image.Skew("image1", 50, SkewDirection.Left);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonFlip, Event: On Click Script ]]------------------------------
image.Flip("image1", FlipType.Y);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonRotateImage, Event: On Click Script ]]------------------------------
image.RotateImage("image1", 30);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonRotate, Event: On Click Script ]]------------------------------
image.Rotate("image1", RotateType.Right);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonCrop, Event: On Click Script ]]------------------------------
image.Crop("image1", 50, 50, 400, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonResize, Event: On Click Script ]]------------------------------
--image.Resize(50);
image.Resize("image1", 400);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonFillEllipseImage, Event: On Click Script ]]------------------------------
image.FillEllipseImage("image1", "image2", 50, 50, 400, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonFillEllipseGradient, Event: On Click Script ]]------------------------------
image.FillEllipseGradient("image1", Colors.White, Colors.Transparent, 270, 50, 50, 400, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonFillEllipse, Event: On Click Script ]]------------------------------
image.FillEllipse("image1", Colors.White, 50, 50, 400, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonFillRectangleImage, Event: On Click Script ]]------------------------------
image.FillRectangleImage("image1", "image2", 50, 50, 400, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonFillRectangleGradient, Event: On Click Script ]]------------------------------
image.FillRectangleGradient("image1", Colors.Transparent, Colors.Blue, 270, 50, 50, 400, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonFillRectangle, Event: On Click Script ]]------------------------------
image.FillRectangle("image1", Colors.White, 50, 50, 400, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDrawLinesImage, Event: On Click Script ]]------------------------------
image.DrawLinesImage("image1", "image2", 24, "10,10\r\n30,30\r\n70,70\r\n100,20\r\n150,50");
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDrawLinesGradient, Event: On Click Script ]]------------------------------
image.DrawLinesGradient("image1", Colors.White, Colors.Blue, 90, 7, "10,10\r\n30,30\r\n70,70\r\n100,20\r\n150,50");
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDrawLines, Event: On Click Script ]]------------------------------
image.DrawLines("image1", Colors.White, 7, "10,10\r\n30,30\r\n70,70\r\n100,20\r\n150,50");
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDrawLineImage, Event: On Click Script ]]------------------------------
image.DrawLineImage("image1", "image2", 24, 50, 50, 400, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDrawLineGradient, Event: On Click Script ]]------------------------------
image.DrawLineGradient("image1", Colors.White, Colors.Blue, 90, 7, 50, 50, 400, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDrawLine, Event: On Click Script ]]------------------------------
image.DrawLine("image1", Colors.White, 7, 50, 50, 400, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDrawEllipseImage, Event: On Click Script ]]------------------------------
image.DrawEllipseImage("image1", "image2", 48, 50, 50, 400, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDrawEllipseGradient, Event: On Click Script ]]------------------------------
image.DrawEllipseGradient("image1", Colors.White, Colors.Blue, 90, 7, 50, 50, 400, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDrawEllipse, Event: On Click Script ]]------------------------------
image.DrawEllipse("image1", Colors.White, 7, 50, 50, 400, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDrawRectangleImage, Event: On Click Script ]]------------------------------
image.DrawRectangleImage("image1", "image2", 48, 50, 50, 400, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDrawRectangleGradient, Event: On Click Script ]]------------------------------
image.DrawRectangleGradient("image1", Colors.White, Colors.Blue, 90, 7, 50, 50, 400, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDrawRectangle, Event: On Click Script ]]------------------------------
image.DrawRectangle("image1", Colors.White, 7, 50.5, 50.5, 400.5, 300.5);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDrawStringImage, Event: On Click Script ]]------------------------------
image.DrawStringImage("image1", "AutoPlay\\Images\\image.ico", "Arial", 48, "Bold, Italic", "image2", 0, 0, 600, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDrawStringGradient, Event: On Click Script ]]------------------------------
image.DrawStringGradient("image1", "AutoPlay\\Images\\image.ico", "Arial", 24, "Bold, Italic", Colors.Blue, Colors.White, 180, 0, 0, 600, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDrawString, Event: On Click Script ]]------------------------------
image.DrawString("image1", "AutoPlay\\Images\\image.ico", "Arial", 12, "Regular", Colors.Blue, 0, 0, 400, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonDrawImage, Event: On Click Script ]]------------------------------
image.DrawImage("image1", "image2", 50, 50, 400, 300);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonCreate, Event: On Click Script ]]------------------------------
image.Create("image3", Colors.White, 800, 600);
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

------------------------------[[ SCRIPT: Page: Page1, Object: ButtonOpen, Event: On Click Script ]]------------------------------
image.Open("image1", "AutoPlay\\Images\\Sunset.jpg");
image.Open("image2", "AutoPlay\\Images\\Water lilies.jpg");
error = image.GetError();

if (error == "") then
	--Image.Load("Image1", imageFile);
	image.ImageViewerImage("image1");
else
	Dialog.Message("Error", error, MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1);
end

