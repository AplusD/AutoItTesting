;Dzhonov Azamat Temurmalikovich, BSE143(1), 23/11/2016
;Test windows notepad(notepad.exe)


#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#include <Date.au3>

#Region ### START Koda GUI section ### Form=c:\users\asus\desktop\notepadetest\notepad.kxf
$NotePad = GUICreate("NotePad Test", 613, 228, 192, 124)
$MenuItem1 = GUICtrlCreateMenu("&About")
$MenuItem2 = GUICtrlCreateMenuItem("About program", $MenuItem1)
$Button1 = GUICtrlCreateButton("Test menu File", 104, 48, 171, 57)
$Button2 = GUICtrlCreateButton("Test menu Edit", 336, 48, 163, 57)
$Button3 = GUICtrlCreateButton("Test menu File (Using keyboard)", 104, 128, 171, 57)
$Button4 = GUICtrlCreateButton("Test menu Edit (Using keyboard)", 336, 128, 163, 57)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg

	  Case $GUI_EVENT_CLOSE
			Exit

	  Case $MenuItem2
		 MsgBox(BitOR($MB_OK, $MB_SYSTEMMODAL, $MB_OK),"About program","Test menu File and Edit function of notepad of windows(notepad.exe). Azamat Dzhonov 23/11/2016")

	  Case $Button1
		 Test_File()

	  Case $Button2
		 Test_Edit()

	  Case $Button3
		 Test_File_WithKeyboard()

	  Case $Button4
		 Test_Edit_WithKeyboard()

	EndSwitch
 WEnd

Func Test_Edit()

   AutoItSetOption("SendKeyDelay", 100)
   Run("notepad.exe")
   WinWaitActive("[CLASS:Notepad]")

   ;UNDO(Cancel) test
   Send("Test for undo.... {Enter}SomeText")
   WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "&Undo" )
   $text = ControlGetText("[CLASS:Notepad]", "", "Edit1")
   Assert($text, "", "Test for UNDO")


   ;Cut test(and Select all)
   Send("test for cut...")
   WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "Select &All" )
   Send("^x")
  ; WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "&Cut" )
   Sleep(500)
   $text = ControlGetText("[CLASS:Notepad]", "", "Edit1")
   Assert($text, "", "Test for Cut")

   ;Paste
   WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "&Paste" )
   $text = ClipGet()
   Assert($text, "test for cut...", "Test for paste")

   ;Copy test
   Sleep(500)
   WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "Select &All" )
   WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "&Copy" )

   ;Delete test
   ;WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "Delete")
   Send("{DEL}")
   $text = ControlGetText("[CLASS:Notepad]", "", "Edit1")
   Assert($text, "", "Test for deleting")

   ;Continue copy test
   WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "&Paste" )
   $text = ClipGet()
   Assert($text, "test for cut...", "Test for copy")

   ;Test Time/Date
   WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "Select &All" )
   Send("{DEL}")
   WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "Time/&Date" )
   $text = ControlGetText("[CLASS:Notepad]", "", "Edit1")
   ;Assert($text, _DateTimeFormat(_NowCalc(), 4)& " PM " &_DateTimeFormat(_NowCalc(), 2), "Test for Time/Date")

   ;Test Find and find next
   WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "Select &All" )
   Send("{DEL}")
   Send("find test thats program have to find find find ")
   WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "&Find..." )
   Send("find")
   ControlClick("Find", "", "[CLASS:Button; INSTANCE:6]", "Left") ; find button
   WinClose("Find")
   WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "&Copy" )
   Assert(ClipGet(), "find", "Test for find a word")

   WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "Find &Next")
   Assert(ClipGet(), "find", "Test for find a word")

   ;Replace
   WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "Select &All" )
   Send("{DEL}")
   Send("Test thats program have to replace")
   WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "&Replace" ) ;Replace for nothing
   Send("replace")
   ControlClick("Replace", "", "[CLASS:Button; INSTANCE:5]", "Left")
   WinClose("Replace")
   $text = ControlGetText("[CLASS:Notepad]", "", "Edit1")
   Assert($text, "Test thats program have to ", "Test for replacing")


   ;Go To
   Send("{ENTER}TEXT{ENTER}TEXT{ENTER}")
   WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "&Go To..." )
   Send("2")
   Send("{ENTER}")
   Send("!{LSHIFT}+{END}") ;select line
   WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "&Copy" )
   Assert(ClipGet(), "TEXT", "Test to go to")

   ;Exit program
   WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "Select &All" )
   Send("{DEL}")
   WinMenuSelectItem("[CLASS:Notepad]", "", "&File", "E&xit")
   MsgBox(0, "Testing over", "All tests are passed")

EndFunc

Func Test_Edit_WithKeyboard()

   AutoItSetOption("SendKeyDelay", 100)
   Run("notepad.exe")
   WinWaitActive("[CLASS:Notepad]")

   ;UNDO(Cancel) test
   Send("Test for undo.... {Enter}SomeText")
   Send("^z")
   $text = ControlGetText("[CLASS:Notepad]", "", "Edit1")
   Assert($text, "", "Test for UNDO")


   ;Cut test(and Select all)
   Send("test for cut...")
   Send("^a")
   Send("^x")
  ; WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "&Cut" )
   Sleep(500)
   $text = ControlGetText("[CLASS:Notepad]", "", "Edit1")
   Assert($text, "", "Test for Cut")

   ;Paste
   Send("^v")
   $text = ClipGet()
   Assert($text, "test for cut...", "Test for paste")

   ;Copy test
   Sleep(500)
   Send("^a")
   Send("^c")

   ;Delete test
   ;WinMenuSelectItem("[CLASS:Notepad]", "", "&Edit", "Delete")
   Send("{DEL}")
   $text = ControlGetText("[CLASS:Notepad]", "", "Edit1")
   Assert($text, "", "Test for deleting")

   ;Continue copy test
   Send("^v")
   $text = ClipGet()
   Assert($text, "test for cut...", "Test for copy")

   ;Test Time/Date
   Send("^a")
   Send("{DEL}")
   Send("{F5}")
   $text = ControlGetText("[CLASS:Notepad]", "", "Edit1")
   ;Assert($text, _DateTimeFormat(_NowCalc(), 4)& " PM " &_DateTimeFormat(_NowCalc(), 2), "Test for Time/Date")

   ;Test Find and find next
   Send("^a")
   Send("{DEL}")
   Send("find test thats program have to find find find ")
   Send("^f")
   Send("find")
   ControlClick("Find", "", "[CLASS:Button; INSTANCE:6]", "Left") ; find button

   WinClose("Find")
   Sleep(500)
   Send("{F3}")


   ;Replace
   Send("^a")
   Send("{DEL}")
   Send("Test thats program have to replace")
   Send("^h") ;Replace for nothing
   Send("replace")
   ControlClick("Replace", "", "[CLASS:Button; INSTANCE:5]", "Left")
   WinClose("Replace")
   $text = ControlGetText("[CLASS:Notepad]", "", "Edit1")
   Assert($text, "Test thats program have to ", "Test for replacing")


   ;Go To
   Send("^a")
   Send("{DEL}")
   Send("{ENTER}TEXT{ENTER}TEXT{ENTER}")
   Send("^g")
   Send("2")
   Send("{ENTER}")
   Send("!{LSHIFT}+{END}") ;select line
   Send("^c")
   Assert(ClipGet(), "TEXT", "Test to go to")

   ;Exit program
   Send("^a")
   Send("{DEL}")
   WinMenuSelectItem("[CLASS:Notepad]", "", "&File", "E&xit")
   MsgBox(0, "Testing over", "All tests are passed")

EndFunc

Func Test_File()

   AutoItSetOption("SendKeyDelay", 100)
   Run("notepad.exe")
   WinWaitActive("[CLASS:Notepad]")

  ;Print text in notepad
   Send("Hello from Notepad.{ENTER}1 2 3 4 5 6 7 8 9 10{ENTER}Azamat Dzhonov")

   ;Save file test
   WinMenuSelectItem("[CLASS:Notepad]", "", "&File", "Save" )
   Send("File.txt")
   ControlClick("Save As", "", "[CLASS:Button; INSTANCE:1]", "Left") ; Save button


   while WinExists("Confirm Save As") ; make new file anyway
	  ControlClick("Confirm Save As", "", "[CLASS:Button; INSTANCE:1]", "Left") ;
   WEnd


   Sleep(500)
   Local $sText = WinGetTitle("[active]")
   Assert($sText, "File.txt - Notepad", "Test for saving file") ;For save file, title must change to file-name


   ;New file test
    WinMenuSelectItem("[CLASS:Notepad]", "", "&File", "&New" )
    Local $sText = WinGetTitle("[active]");
	Assert($sText, "Untitled - Notepad", "Test for create new file") ;For new file, there is a standart title


   ;Open file
   WinMenuSelectItem("[CLASS:Notepad]", "", "&File", "&Open" )
   Send("File.txt")
   ControlClick("Open", "", "[CLASS:Button; INSTANCE:1]", "Left")

   Sleep(500)
   Local $sText = WinGetTitle("[active]")
   Assert($sText, "File.txt - Notepad", "Test for opening file") ;For oepn file, title must change to file-name

   ;Save file as test
   Send("{ENTER}Save as...{ENTER}")
   Sleep(500)
   WinMenuSelectItem("[CLASS:Notepad]", "", "&File", "Save &As..." )
   Send("FileSaveAs.txt")
   Sleep(500)
   ControlClick("Save As", "", "[CLASS:Button; INSTANCE:1]", "Left") ;

   while WinExists("Confirm Save As") ; make new file anyway
	  ControlClick("Confirm Save As", "", "[CLASS:Button; INSTANCE:1]", "Left") ;
   WEnd

   Sleep(500)
   Local $sText = WinGetTitle("[active]");
   Assert($sText, "FileSaveAs.txt - Notepad", "Test for saving file") ;For save as file test, title must change to file-name


   ;Page Setup
   WinMenuSelectItem("[CLASS:Notepad]", "", "&File", "Page Set&up...")
   Sleep(500)
   if WinActive("Page Setup") then
	 WinClose("Page Setup")
   Else
	  MsgBox(BitOR($MB_OK, $MB_SYSTEMMODAL, $MB_ICONEXCLAMATION),"Error","Page setup is not open!")
   EndIf

   ;Print testiT
   WinMenuSelectItem("[CLASS:Notepad]", "", "&File", "&Print...")
   Sleep(500)
   if WinActive("Print") then
	 WinClose("Print")
   Else
	  MsgBox(BitOR($MB_OK, $MB_SYSTEMMODAL, $MB_ICONEXCLAMATION),"Error","Print is not open!")
   EndIf

   ;Exit test
   WinMenuSelectItem("[CLASS:Notepad]", "", "&File", "E&xit")
   MsgBox(0, "Testing over", "All tests are passed")


EndFunc

Func Test_File_WithKeyboard()

   AutoItSetOption("SendKeyDelay", 100)
   Run("notepad.exe")
   WinWaitActive("[CLASS:Notepad]")

  ;Print text in notepad
   Send("Hello from Notepad.{ENTER}1 2 3 4 5 6 7 8 9 10{ENTER}Azamat Dzhonov")

   ;Save file test
   Send("^s")
   Sleep(500)
   Send("File.txt")
   ControlClick("Save As", "", "[CLASS:Button; INSTANCE:1]", "Left") ; Save button


   while WinExists("Confirm Save As") ; make new file anyway
	  ControlClick("Confirm Save As", "", "[CLASS:Button; INSTANCE:1]", "Left") ;
   WEnd


   Sleep(500)
   Local $sText = WinGetTitle("[active]")
   Assert($sText, "File.txt - Notepad", "Test for saving file") ;For save file, title must change to file-name


   ;New file test
    Send("^n")
    Local $sText = WinGetTitle("[active]");
	Assert($sText, "Untitled - Notepad", "Test for create new file") ;For new file, there is a standart title


   ;Open file
   Send("^o")
   Send("File.txt")
   ControlClick("Open", "", "[CLASS:Button; INSTANCE:1]", "Left")

   Sleep(500)
   Local $sText = WinGetTitle("[active]")
   Assert($sText, "File.txt - Notepad", "Test for opening file") ;For oepn file, title must change to file-name

   ;Save as and Page Setup... do not have any keyboard combination


   ;Print testiT
   Send("^p")
   Sleep(500)
   if WinActive("Print") then
	 WinClose("Print")
   Else
	  MsgBox(BitOR($MB_OK, $MB_SYSTEMMODAL, $MB_ICONEXCLAMATION),"Error","Print is not open!")
   EndIf

	  ;Exit test
	  Send("^n")
   WinMenuSelectItem("[CLASS:Notepad]", "", "&File", "E&xit")
   MsgBox(0, "Testing over", "All tests are passed")


EndFunc


Func Assert($vVar1, $vVar2, $TestNum)
   If $vVar1 <> $vVar2 Then
	  MsgBox(0, $TestNum, "Result is not equal expected value: " & $vVar1 & " " & $vVar2)
   EndIf
EndFunc