
Scin = {};

function Scin.MoveCaretInsideView(sPluginName, iTabNumber)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_MOVECARETINSIDEVIEW, "num", 0, "pstr", NULL);
end

function Scin.BraceHighLight(sPluginName, iTabNumber, iPos, iPos2)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_BRACEHIGHLIGHT, "num", iPos, "num",iPos2);
end


function Scin.BraceBadLight(sPluginName, iTabNumber, iPos)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_BRACEBADLIGHT, "num", iPos, "num",0);
end

function Scin.BraceMatch(sPluginName, iTabNumber, iPos)
	local ret = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_BRACEMATCH, "num", iPos, "num",0);
	return ret;
end

function Scin.GetModify(sPluginName, iTabNumber)
	local ret = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETMODIFY, "num", 0, "pstr",NULL);
	if(ret>0) then
		bRet = true;
	else
		bRet = false;
	end
	return bRet;
end

function Scin.LinesOnScreen(sPluginName, iTabNumber)
	ret = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_LINESONSCREEN, "num", 0, "pstr",NULL);
	return ret;
end

function Scin.ClearUndoBuffer(sPluginName, iTabNumber)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_EMPTYUNDOBUFFER, "num", 0, "pstr", NULL);
end

function Scin.CanUndo(sPluginName, iTabNumber)
	local ret = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_CANUNDO, "num", 0, "pstr",NULL);
	if(ret>0) then
		bRet = true;
	else
		bRet = false;
	end
	return bRet;
end

function Scin.CanRedo(sPluginName, iTabNumber)
	local ret = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_CANREDO, "num", 0, "pstr",NULL);
	if(ret>0) then
		bRet = true;
	else
		bRet = false;
	end
	return bRet;
end

function Scin.Undo(sPluginName, iTabNumber)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_UNDO, "num", 0, "pstr", NULL);
end

function Scin.Redo(sPluginName, iTabNumber)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_REDO, "num", 0, "pstr", NULL);
end

function Scin.ResetStatus(sPluginName, iTabNumber)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_SETSTATUS, "num", 0, "pstr", NULL);
end

function Scin.GetStatus(sPluginName, iTabNumber)
	 ret = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETSTATUS, "num", 0, "pstr",NULL);
	return ret;
end

function Scin.Clear(sPluginName, iTabNumber)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_CLEAR, "num", 0, "pstr", NULL);
end

function Scin.Copy(sPluginName, iTabNumber)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_COPY, "num", 0, "pstr", NULL);
end

function Scin.Cut(sPluginName, iTabNumber)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_CUT, "num", 0, "pstr", NULL);
end

function Scin.Paste(sPluginName, iTabNumber)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_PASTE, "num", 0, "pstr", NULL);
end

	--[[
		function Scin.GetOvertype
		Returns a boolean. Returns true if overtyping is active, otherwise false will be returned.
	]]--
function Scin.GetOvertype(sPluginName, iTabNumber)
	local ret = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETOVERTYPE, "num", 0, "pstr",NULL);
	if(ret>0) then
		bRet = true;
	else
		bRet = false;
	end
	return bRet;
end
	--[[
		function Scin.SetOvertype
		When overtype is enabled, each typed character replaces the character 
		to the right of the text caret. When overtype is disabled, characters are inserted at the caret.
	]]--
function Scin.SetOvertype(sPluginName, iTabNumber, bOvertype)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_SETOVERTYPE, "bool", bOvertype, "pstr", NULL);
end
	--[[
		function Scin.Allocate
		Allocate a document buffer large enough to store a given number of bytes. 
		The document will not be made smaller than its current contents.
	]]--
function Scin.Allocate(sPluginName, iTabNumber, iBytes)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_ALLOCATE, "num", iBytes, "pstr", NULL);
end

	--[[
		function Scin.GetCharAt
		Returns the character at pos in the document as a string. 
		If pos is negative or past the end of the document 0 will be returned. 
		Remember that Position starts at 0
	]]--

function Scin.GetCharAt(sPluginName, iTabNumber, iPos)
	local ret = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETCHARAT, "num", iPos, "pstr",NULL);
	sRet = String.Char(ret);
	return sRet;
end

	--[[
		function Scin.ClearDocumentStyle
		When wanting to completely restyle the document, for example 
		after choosing a lexer, this action can be used to clear all 
		styling information and reset the folding state.
	]]--
function Scin.ClearDocumentStyle(sPluginName, iTabNumber)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_CLEARDOCUMENTSTYLE, "num", 0, "pstr",NULL);
end

	--[[
		function Scin.ClearAll
		Unless the document is read-only, this deletes all the text.
	]]--
function Scin.ClearAll(sPluginName, iTabNumber)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_CLEARALL, "num", 0, "pstr",NULL);
end
	--[[
		function Scin.InsertText
		This inserts a text string at position pos or at the current position if pos is -1. 
		If the current position is after the insertion point then it is moved along with its 
		surrounding text but no scrolling is performed.
	]]--
function Scin.InsertText(sPluginName, iTabNumber, iPos, sInsert)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_INSERTTEXT, "num", iPos, "str", sInsert.."\0");
end

	--[[
		function Scin.GetReadOnly
		Returns the read-only flag for the document as a boolean.
	]]--
function Scin.GetReadOnly(sPluginName, iTabNumber)
	local ret = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETREADONLY, "num", 0, "pstr",NULL);
	if(ret>0) then
		bRet = true;
	else
		bRet = false;
	end
	return bRet;
end

	--[[
		function Scin.SetReadOnly
		Set the read-only flag for the document. If you mark a document as read only, 
		attempts to modify the text cause the SCN_MODIFYATTEMPTRO notification.
	]]--

function Scin.SetReadOnly(sPluginName, iTabNumber, bReadOnly)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_SETREADONLY, "bool", bReadOnly, "pstr", NULL);
end
	--[[
		function Scin.SetSavePoint
		This message tells Scintilla that the current state of the document is unmodified. 
		This is usually done when the file is saved or loaded, hence the name "save point". 
		As Scintilla performs undo and redo operations, it notifies the container that it has 
		entered or left the save point with SCN_SAVEPOINTREACHED and SCN_SAVEPOINTLEFT notification messages, 
		allowing the container to know if the file should be considered dirty or not.
	]]--
function Scin.SetSavePoint(sPluginName, iTabNumber)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_SETSAVEPOINT, "num", 0, "pstr",NULL);
end

	--[[
		function Scin.ReplaceSelected
		Replace the currently selected text. If the anchor 
		and current position are the same, the text is inserted at the caret position. 
		The caret is positioned after the inserted text and the caret is scrolled into view.
	]]--
function Scin.ReplaceSelected(sPluginName, iTabNumber, sRep)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_REPLACESEL, "num", 0, "str", sRep.."\0");
end

	--[[
		function Scin.GetZoom
		Returns the current zoom factor of a specified tab as a number.
	]]--
function Scin.GetZoom(sPluginName, iTabNumber)
	ret = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETZOOM, "num", 0, "pstr",NULL);
	return ret;
end

	--[[
		function Scin.SetZoom
		Set the zoom factor directly.
	]]--
function Scin.SetZoom(sPluginName, iTabNumber, iZoom)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_SETZOOM, "num", iZoom, "pstr", NULL);
end

	--[[
		function Scin.ZoomOut
		Decreases the zoom factor by one point if the current zoom factor is greater than -10 points.
	]]--
function Scin.ZoomOut(sPluginName, iTabNumber)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_ZOOMOUT, "num", 0, "pstr", NULL);
end

	--[[
		function Scin.ZoomIn
		Increases the zoom factor by one point if the current zoom factor is less than 20 points.
	]]--
function Scin.ZoomIn(sPluginName, iTabNumber)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_ZOOMIN, "num", 0, "pstr", NULL);
end


function Scin.MarkerAdd(sPluginName, iTabNumber, iLineNumber, iMarkerNumber)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_MARKERADD, "num", iLineNumber, "num",iMarkerNumber);
end

function Scin.GetLineFromPos(sPluginName, iTabNumber, iPos)
	ret = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_LINEFROMPOSITION, "num", iPos, "pstr",NULL);
	return ret;
end

function Scin.GetPosFromLine(sPluginName, iTabNumber, iLineNumber)
	ret = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_POSITIONFROMLINE, "num", iLineNumber, "pstr",NULL);
	return ret;
end

	--[[
		function Scin.GoToLine
		This removes any selection and sets the caret at the start of line 
		number line and scrolls the view (if needed) to make it visible. 
		The anchor position is set the same as the current position. 
		If line is outside the lines in the document (first line is 0), 
		the line set is the first or last.
		]]--
function Scin.GoToLine(sPluginName, iTabNumber, iLine)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GOTOLINE, "num", iLine, "pstr", NULL);
end

	--[[
		function Scin.GoToPos
		This removes any selection, sets the caret at pos and scrolls the view 
		to make the caret visible, if necessary. It is equivalent to SCI_SETSEL(pos, pos). 
		The anchor position is set the same as the current position.
	]]--
function Scin.GoToPos(sPluginName, iTabNumber, iPos)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GOTOPOS, "num", iPos, "pstr", NULL);
end

	--[[
		function Scin.SetAnchor
		This sets the anchor position and creates a selection 
		between the anchor position and the current position. 
		The caret is not scrolled into view.
	]]--
function Scin.SetAnchor(sPluginName, iTabNumber, iAnchor)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_SETANCHOR, "num", iAnchor, "pstr", NULL);
end

	--[[
		This sets the current position and creates a selection 
		between the anchor and the current position. 
		The caret is not scrolled into view.
	]]--
function Scin.SetCurrentPos(sPluginName, iTabNumber, iPos)
	Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_SETCURRENTPOS, "num", iPos, "pstr", NULL);
end

	--[[
		function Scin.SetSelected
		This message sets both the anchor and the current position. 
		If currentPos is negative, it means the end of the document. 
		If anchorPos is negative, it means remove any selection (i.e. set the anchor to the same position as currentPos). 
		The caret is scrolled into view after this operation.
	]]--
function Scin.SetSelected(sPluginName, iTabNumber, iAnchor, iPos)
	Scintilla.SendMessage(sPluginName,iTabNumber, "num",SCI_SETSEL, "num", iAnchor, "num",iPos);
end

	--[[
		function Scin.GetAnchor
		This returns the current anchor position of a specific tab, as a number.
	]]--
function Scin.GetAnchor(sPluginName, iTabNumber)
	ret = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETANCHOR, "num", 0, "pstr",NULL);
	return ret;
end

	--[[
		function Scin.GetCurrentPos
		This returns the current caret position of a specific tab, as a number.
	]]--
function Scin.GetCurrentPos(sPluginName, iTabNumber)
	ret = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETCURRENTPOS, "num", 0, "pstr",NULL);
	return ret;
end

function Scin.GetSelectedEnd(sPluginName, iTabNumber)
	ret = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETSELECTIONEND, "num", 0, "pstr",NULL);
	return ret;
end

function Scin.GetSelectedStart(sPluginName, iTabNumber)
	ret = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETSELECTIONSTART, "num", 0, "pstr",NULL);
	return ret;
end

function Scin.SelectAll(sPluginName, iTabNumber)

	Scintilla.SendMessage(sPluginName,iTabNumber, "num",SCI_SELECTALL, "num", 0, "pstr",0);

end

-- Returns length of selection and text
function Scin.GetSelectedText(sPluginName, iTabNumber)
	local ret;
	ret, Seltext = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETSELTEXT, "num", 0, "pstr",NULL);
	return Seltext;
end

function Scin.GetSelectedLength(sPluginName, iTabNumber)
	local Seltext;
	ret, Seltext = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETSELTEXT, "num", 0, "pstr",NULL);
	return ret;
end

function Scin.GetCurrentLinePos(sPluginName, iTabNumber)
	local text;
	ret , text = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETCURLINE, "num", 0, "pstr", 0);     
	return ret;
end

-- returns Carrot position in current line, and text of current line
function Scin.GetCurrentLine(sPluginName, iTabNumber)
	local ret;
	ret , text = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETCURLINE, "num", 0, "pstr", 0);     
	return text;

end


function Scin.GetLineCount(sPluginName, iTabNumber)

	local nlen = Scintilla.SendMessage(sPluginName,iTabNumber, "num",SCI_GETLINECOUNT, "num", 0, "pstr",0);
	     
	return nlen;

end

function Scin.GetLineEndPos(sPluginName, iTabNumber, iLineNumber)
	iLineNumber = String.ToNumber(iLineNumber);

	 nlen = Scintilla.SendMessage(sPluginName,iTabNumber, "num",SCI_GETLINEENDPOSITION, "num", iLineNumber, "num",0);    
	return  nlen;
end

	--[[
		function Scin.GetLineLength
		Returns the length of text in a specified tab as a number. This number includes any non visible line endings.
	]]--
function Scin.GetLineLength(sPluginName, iTabNumber, iLineNumber)
	iLineNumber = String.ToNumber(iLineNumber);

	local nlen = Scintilla.SendMessage(sPluginName,iTabNumber, "num",SCI_LINELENGTH, "num", iLineNumber, "num",0);
	ret , text = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETLINE, "num", iLineNumber, "pstr", nlen);     
	return  ret;
end

	--[[
		function Scin.GetLine
		Returns the text of the specified line as a string. This string includes the line ending characters. In most cases you will want to trim the right most two characters before you use this string.
	]]--

function Scin.GetLine(sPluginName, iTabNumber, iLineNumber)
	iLineNumber = String.ToNumber(iLineNumber);

	local nlen = Scintilla.SendMessage(sPluginName,iTabNumber, "num",SCI_LINELENGTH, "num", iLineNumber, "num",0);
	ret , text = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETLINE, "num", iLineNumber, "pstr", nlen);     
	return  text;

end

	--[[
		function Scin.GetText
		Returns the text of the specified tab as a string.
	]]--
function Scin.GetText(sPluginName, iTabNumber)
	local nlen = Scintilla.SendMessage(sPluginName,iTabNumber, "num",SCI_GETLENGTH, "num", 0, "num",0);
	ret , text = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETTEXT, "num", nlen+1, "pstr", nlen);
	return text;
end

	--[[
		function Scin.GetLength
		Returns the length of text in a specified tab as a number. This number includes non visible line endings. Line endings generally count for two characters per line.
	]]--
function Scin.GetLength(sPluginName, iTabNumber)
	local nlen = Scintilla.SendMessage(sPluginName,iTabNumber, "num",SCI_GETLENGTH, "num", 0, "num",0);
	ret , text = Scintilla.SendMessage(sPluginName, iTabNumber, "num", SCI_GETTEXT, "num", nlen+1, "pstr", nlen);
	return ret;
end

	--[[
		function Scin.SetText
		Replaces the text of the specified tab.
	]]--
function Scin.SetText(sPluginName, iTabNumber, sText2Set)

	local  bRet2 = Scintilla.SetActiveTab(sPluginName, iTabNumber);
		  if (bRet2) then

            Scintilla.SendMessage(sPluginName,iTabNumber, "num",SCI_SETTEXT, "num", 0, "str",sText2Set.."\0");
          else   
    
            Dialog.Message("Notice", "Failed To Setup A New Tab", MB_OK, MB_ICONINFORMATION, MB_DEFBUTTON1); 

          end 	
end



