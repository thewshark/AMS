---Global Functions

--Enter global declarations and functions here...
PDFOut = {
	AddPage = function ()
		if m_strPDF == nil then
			m_strPDF =  "\""
		end
		m_strPDF = m_strPDF .. "AP\001\002"
	end,
	
	SetDisplayMode = function (sZoom, sLayout)
		if m_strPDF == nil then
			m_strPDF =  "\""
		end
		m_strPDF =  m_strPDF .. "DM\001"..sZoom.."\001"..sLayout.."\001\002"
	end,
	
	SetUnits = function (sUnits)
		m_strUnits= sUnits
	end,
	
	SetOrientation = function (sOrientation)
		m_strOrientation = sOrientation
	end,
	
	SetMargins = function(nLeft, nTop, nRight)
		if m_strPDF == nil then
			m_strPDF =  "\""
		end
		m_strPDF =  m_strPDF .. "SM\001"..nLeft.."\001"..nTop.."\001"..nRight.."\001\002"		
	end,

	SetXY = function(nX, nY)
		if m_strPDF == nil then
			m_strPDF =  "\""
		end
		m_strPDF = m_strPDF .. "SXY\001"..nX.."\001"..nY.."\001\002"
	end,
	
	PrintText = function (sText, nX, nY)
		if m_strPDF == nil then
			m_strPDF =  "\""
		end
		m_strPDF = m_strPDF .."PT\001"..sText.."\001"..nX.."\001"..nY.."\001\002"
	end,

	PrintTextRotated = function (sText, nX, nY, nA)
		if m_strPDF == nil then
			m_strPDF =  "\""
		end
		m_strPDF = m_strPDF .."RT\001"..sText.."\001"..nX.."\001"..nY.."\001"..nA.."\001\002"
	end,

	
	PrintAligned = function (sText, nX, nY, nW, nH, sAlignment)
		if m_strPDF == nil then
			m_strPDF =  "\""
		end
		m_strPDF = m_strPDF .."PA\001"..nX.."\001"..nY.."\001"..nW.."\001"..nH.."\001"..sText.."\001"..sAlignment.."\001\002"
	end,
	
	PrintImage = function (sFileName, nX, nY, nW, nH)
		if m_strPDF == nil then
			m_strPDF =  "\""
		end
		m_strPDF = m_strPDF .."PI\001"..sFileName.."\001"..nX.."\001"..nY.."\001"..nW.."\001"..nH.."\001\002"
	end,
	
	
	SetFont = function (sFace, sStyle, nSize)
		if m_strPDF == nil then
			m_strPDF =  "\""
		end
		m_strPDF = m_strPDF .."SF\001"..sFace.."\001"..sStyle.."\001"..nSize.."\001\002"
	end,		
	
	SetFontColor = function (nColor)
		if m_strPDF == nil then
			m_strPDF =  "\""
		end
		if nColor == nil then
			nColor=0
		end
		m_strPDF = m_strPDF.."SFC\001"..nColor.."\001\002"
	end,
	
	DrawRectangle = function (nX, nY, nW, nH, nB, nDC, nFC, sStyle)
		if m_strPDF == nil then
			m_strPDF =  "\""
		end
		m_strPDF = m_strPDF.."DR\001"..nX.."\001"..nY.."\001"..nW.."\001"..nH.."\001"..nB.."\001"..nDC.."\001"..nFC.."\001"..sStyle.."\001\002"
	end,		
	
	DrawCircle = function (nX, nY, nR, nB, nDC, nFC, sStyle)
		if m_strPDF == nil then
			m_strPDF =  "\""
		end
		m_strPDF = m_strPDF.."DC\001"..nX.."\001"..nY.."\001"..nR.."\001"..nB.."\001"..nDC.."\001"..nFC.."\001"..sStyle.."\001\002"
	end,		
	
	DrawEllipse = function (nX, nY, nRX, nRY, nB, nDC, nFC, sStyle)
		if m_strPDF == nil then
			m_strPDF =  "\""
		end
		m_strPDF = m_strPDF.."DE\001"..nX.."\001"..nY.."\001"..nRX.."\001"..nRY.."\001"..nB.."\001"..nDC.."\001"..nFC.."\001"..sStyle.."\001\002"
	end,		
	
	DrawLine = function (nX, nY, nX2, nY2, nB, nDC)
		if m_strPDF == nil then
			m_strPDF =  "\""
		end
		m_strPDF = m_strPDF.."DL\001"..nX.."\001"..nY.."\001"..nX2.."\001"..nY2.."\001"..nB.."\001"..nDC.."\001\002"
	end,		

	DisplayPreferences = function(bFS, bHMB, bHTB, bHUW, bDDT, bCW, bFW)
		if m_strPDF == nil then
			m_strPDF =  "\""
		end
		if bFS then
			m_FS = 1
		else
			m_FS = 0
		end
		if bHMB then
			m_HMB = 1
		else
			m_HMB = 0
		end
		if bHTB then
			m_HTB = 1
		else
			m_HTB = 0
		end
		if bHUW then
			m_HUW = 1
		else
			m_HUW = 0
		end
		if bDDT then
			m_DDT = 1
		else
			m_DDT = 0
		end
		if bCW then
			m_CW = 1
		else
			m_CW = 0
		end
		if bFW then
			m_FW = 1
		else
			m_FW = 0
		end
		m_strPDF = m_strPDF .. "DP\001"..m_FS.."\001"..m_HMB.."\001"..m_HTB.."\001"..m_HUW.."\001"..m_DDT.."\001"..m_CW.."\001"..m_FW.."\001\002"
	end,	

	WritePDF = function (sFileName)
		if m_strUnits == nil then
			m_strUnits = "mm"
		end
		if m_strOrientation == nil then
			m_strOrientation = "P"
		end
		nResult = DLL.CallFunction("AutoPlay\\Docs\\PDFOut.dll", "CreatePDF", m_strPDF.."\",\""..m_strOrientation.."\",\""..m_strUnits.."\",\""..sFileName.."\"" , DLL_RETURN_TYPE_LONG, DLL_CALL_STDCALL)
		m_strPDF = nil
	end,
	
	WriteText =  function(sText, nH)
		if m_strPDF == nil then
			m_strPDF =  "\""
		end
		m_strPDF = m_strPDF .. "WT\001"..sText.."\001"..nH.."\001\002"
	end
}

--------------------------------------------------------------------------------------------------------------------------------

-- Create PDF
--Set the unit of measure for the paper 
--(206mm wide, 280mm High for a normal 8 1/2 X 11 sheet) 

--set the document up
PDFOut.SetUnits("pt")
PDFOut.SetDisplayMode("PDF_ZOOM_FULLWIDTH", "PDF_LAYUOUT_TWO")
PDFOut.DisplayPreferences(false, false, false, false, true, false, false)
PDFOut.SetMargins(36, 36, 36)

--Draw a rectangle
PDFOut.DrawRectangle(144, 36, 324, 30, 5, 128, 52479, "DRAW_AND_FILL")

--Set the Font Color
PDFOut.SetFont("Arial", "BI", 18)
PDFOut.SetFontColor(128)


--Print a cell of text that is centered in the rect
PDFOut.PrintAligned("PDFOut Documentation", 144, 42, 324, 18, "CENTER")


PDFOut.SetFontColor(0)
PDFOut.SetFont("Arial", "", 12)
sString = "PDFOut is a new DLL from Warmuskerken Consulting that enables Autoplay Media Studio developers to create PDF files from inside their applications.  "
sString = sString .. "This hefty DLL weighing, in at around 80kb, allows you to create PDF documents on the fly.  Drawing shapes such as Rectangles, Circles, "
sString = sString .. "and Ellipses is as easy as setting the properties as you would any AMS object.  Once you've place all the elements you want on a page, "
sString = sString .. "you can call the AddPage function to have multiple pages. Use it to print or display dynamic text, images, or shapes."
PDFOut.PrintAligned(sString, 36, 82, 540, 12, "FORCEDJUSTIFIED")


--Seperator line
PDFOut.DrawLine(36, 168, 576, 168, 6, 128)
PDFOut.DrawLine(36, 168, 576, 168, 4, 52479)

PDFOut.SetXY(36, 172)
PDFOut.WriteText("Sample:  Creating Dynamic Shapes", 12)

--Example Graph
PDFOut.DrawLine(72, 195, 72, 345, 1, 0)
PDFOut.DrawLine(72, 345, 320, 345, 1, 0)


PDFOut.PrintTextRotated("X AXIS", 72, 280, 90)
PDFOut.PrintAligned("Y AXIS", 72, 345, 250, 12, "CENTER")
PDFOut.DrawRectangle(80, 205, 36, 140, 1, 0, 128, "DRAW_AND_FILL")
PDFOut.SetFontColor(16777215)
PDFOut.PrintTextRotated("Dark Red", 100, 305, 90)

PDFOut.DrawRectangle(130, 257, 36, 88, 1, 0, 52479, "DRAW_AND_FILL")
PDFOut.DrawRectangle(180, 223, 36, 122, 1, 0, 26367, "DRAW_AND_FILL")
PDFOut.DrawRectangle(230, 271, 36, 74, 1, 0, 6697728, "DRAW_AND_FILL")

PDFOut.DrawCircle(445, 275, 50, 2, 0, 6697728, "DRAW_AND_FILL")

PDFOut.PrintTextRotated("BLUE", 425, 288, 45)
PDFOut.PrintTextRotated("CIRCLE", 428, 304, 45)

--Create the PDF
PDFOut.WritePDF("C:\\Test.Pdf")

--Let's take a look
File.Open("C:\\Test.pdf", "", SW_MAXIMIZE)

