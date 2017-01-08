;Dzhonov Azamat Temurmalikovich, BSE143(1), 6/11/2016
;Test windows calculator
;Covered all test points, only test_5_1 and test_5_2 fail
;Of course they(Microsoft Corp.) coded it perfect, however homework:)


Run("calc.exe")
$hWnd = WinWaitActive("Calculator")
WinWaitActive($hWnd)
WinActive($hWnd)
Global $testFailed = " "
TestAll()

Func TestAll()
   Test_1()
   Test_2()
   Test_3()
   Test_4()
   Test_5()
   Test_6()
   MsgBox(0, "Result", ("Tests passed. Failed tests: " & $testFailed))
EndFunc


;Test base operation(-+ and +-) and all numbers(negative and with float point) using keyboard of Calculator
Func Test_1()
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:5]", "Left") ;Button 1
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:11]", "Left") ; Button 2
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:16]", "Left") ; Button 3
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:23]", "Left") ; Button +
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:4]", "Left") ;Button 4
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:10]", "Left") ; Button 5
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:15]", "Left") ; Button 6
   Sleep(1000)
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:28]", "Left") ; Button =
   Local $sText = WinGetText($hWnd)
   Assert($sText, 579, "Test_1_1") ;123 + 456 = 579

   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:22]", "Left") ; Button -
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:3]", "Left") ;Button 7
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:9]", "Left") ; Button 8
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:14]", "Left") ; Button 9
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:6]", "Left") ; Button 0
   Sleep(1000)
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:28]", "Left") ; Button =
   Local $sText = WinGetText($hWnd)
   Assert($sText, -7311, "Test_1_2") ;579 - 7890 = -7311
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:13]", "Left") ; Button:C
   Sleep(1000)

   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:5]", "Left") ;Button 1
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:10]", "Left") ; Button 5
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:17]", "Left") ; Button .
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:11]", "Left") ; Button 2
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:22]", "Left") ; Button -
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:16]", "Left") ; Button 3
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:28]", "Left") ; Button =
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:19]", "Left") ; Button +-
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:23]", "Left") ; Button +
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:5]", "Left") ;Button 1
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:6]", "Left") ; Button 0
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:6]", "Left") ; Button 0
   Sleep(1000)
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:28]", "Left") ; Button =
   Local $sText = WinGetText($hWnd)
   Assert($sText, 87.8, "Test_1_3") ; 15.2 - 3 = 12.2, make number negative + 100 = 87.8
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:13]", "Left") ; Button:C
   Sleep(1000)

EndFunc

;Test base operation(*/) using keyboard of Calculator
Func Test_2()
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:16]", "Left") ; Button 3
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:21]", "Left") ; Button *
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:10]", "Left") ; Button 5
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:28]", "Left") ; Button =
   Local $sText = WinGetText($hWnd)
   Assert($sText, 15, "Test_2_1") ; 3 * 5 = 15
   Sleep(1000)

   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:20]", "Left") ; Button /
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:5]", "Left") ;Button 1
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:10]", "Left") ; Button 5
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:28]", "Left") ; Button =
   Sleep(1000)
   Local $sText = WinGetText($hWnd)
   Assert($sText, 1, "Test_2_2") ; 15/15 = 1
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:13]", "Left") ; Button:C
   Sleep(1000)
EndFunc

;Test base operation(Sqrt,1/x, %) using keyboard of Calculator
Func Test_3()
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:16]", "Left") ; Button 3
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:15]", "Left") ; Button 6
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:25]", "Left") ; Button Sqrt
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:28]", "Left") ; Button =
   Local $sText = WinGetText($hWnd)
   Assert($sText, 6, "Test_3_1") ; Sqrt of 36 = 6
   Sleep(1000)

   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:13]", "Left") ; Button:C
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:9]", "Left") ; Button 8
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:6]", "Left") ; Button 0
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:27]", "Left") ; Button 1/x
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:28]", "Left") ; Button =
   Local $sText = WinGetText($hWnd)
   Assert($sText, 0.0125, "Test_3_2") ; 80 1/x = 0.0125
   Sleep(1000)

   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:13]", "Left") ; Button:C
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:5]", "Left") ;Button 1
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:10]", "Left") ; Button 5
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:6]", "Left") ; Button 0
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:21]", "Left") ; Button *
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:11]", "Left") ; Button 2
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:6]", "Left") ; Button 0
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:26]", "Left") ; Button %
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:28]", "Left") ; Button =
   Local $sText = WinGetText($hWnd)
   Assert($sText, 4500, "Test_3_3") ; 150*20%(=30) = 4500
   Sleep(1000)

   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:13]", "Left") ; Button:C
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:5]", "Left") ;Button 1
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:10]", "Left") ; Button 5
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:6]", "Left") ; Button 0
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:23]", "Left") ; Button +
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:11]", "Left") ; Button 2
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:6]", "Left") ; Button 0
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:26]", "Left") ; Button %
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:28]", "Left") ; Button =
   Local $sText = WinGetText($hWnd)
   Assert($sText, 180, "Test_3_4") ; 150+20% = 180
   Sleep(1000)

   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:13]", "Left") ; Button:C
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:5]", "Left") ;Button 1
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:10]", "Left") ; Button 5
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:6]", "Left") ; Button 0
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:22]", "Left") ; Button -
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:11]", "Left") ; Button 2
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:6]", "Left") ; Button 0
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:26]", "Left") ; Button %
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:28]", "Left") ; Button =
   Local $sText = WinGetText($hWnd)
   Assert($sText, 120, "Test_3_5") ; 150-20% = 120
   Sleep(1000)
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:13]", "Left") ; Button:C
   Sleep(1000)

EndFunc

;Memory calculator test(MS,MR,MC,M+,M+)
Func Test_4()
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:5]", "Left") ;Button 1
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:6]", "Left") ; Button 0
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:6]", "Left") ; Button 0
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:12]", "Left") ; Button MS
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:13]", "Left") ; Button:C
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:5]", "Left") ;Button 1
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:6]", "Left") ; Button 0
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:6]", "Left") ; Button 0
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:18]", "Left") ; Button M+
    ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:13]", "Left") ; Button:C
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:10]", "Left") ; Button 5
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:6]", "Left") ; Button 0
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:24]", "Left") ; Button M-
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:13]", "Left") ; Button:C
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:7]", "Left") ; Button MR
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:1]", "Left") ; Button MC
   Sleep(1000)
   Local $sText = WinGetText($hWnd)
   Assert($sText, 150, "Test_4_1") ; Put 100, + 100 - 50 and get from memory, and clean memory
   Sleep(1000)

   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:13]", "Left") ; Button:C
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:7]", "Left") ; Button MR
   Local $sText = WinGetText($hWnd)
   Assert($sText, 0, "Test_4_2") ; Empty memory, must return 0
   Sleep(1000)
EndFunc

;Work with 33 symbols(with float point) test
Func Test_5()
   for $i = 1 To 33 Step 1
	  ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:5]", "Left") ;Button 1
   Next
   Local $sText = WinGetText($hWnd)
   Assert($sText, "111111111111111111111111111111111", "Test_5_1")
   ;9223372036854775807 max value of Int64, must compare strings
   Sleep(1000)
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:13]", "Left") ; Button:C

   for $i = 1 To 13 Step 1
	  ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:5]", "Left") ;Button 1
   Next
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:17]", "Left") ; Button .
   for $i = 1 To 19 Step 1
	   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:5]", "Left") ;Button 1
   Next
   Local $sText = WinGetText($hWnd)
   Assert($sText, "1111111111111.1111111111111111111", "Test_5_2")
   Sleep(1000)
   ControlClick($hWnd, "", "[CLASS:Button; INSTANCE:13]", "Left") ; Button:C
EndFunc

;Test all operation that can be use by PC keyboard
Func Test_6()
   AutoItSetOption("SendKeyDelay", 50)
   Send("{1}{6}")
   Send("{@}") ;Sqrt of number
   Send("{Enter}")
   Local $sText = WinGetText($hWnd)
   Assert($sText, 4, "Test_6_1") ;Press {1} {6} {@} {Enter} = SQRT(16)
   Send("{ESC}")

   Send("{1}{0}{0}")
   Send("{r}"); 1/x
   Send("{Enter}")
   Local $sText = WinGetText($hWnd)
   Assert($sText, 0.01, "Test_6_2") ; Press 100 and R  = 100 1/100 = 0.01
   Send("{F9}") ;+/-
   Send("{*}")
   Send("{1}{5}")
   Send("{Enter}")
   Local $sText = WinGetText($hWnd)
   Assert($sText, -0.15, "Test_6_3") ; Make 0.01 negative and multiply to 15
   Send("{ESC}")

   Send("{1}{6}{6}") ;enter 166
   Send("{BACKSPACE}") ; remove last number, due to 16
   Send("^{M}"); save in memory equal CTRL+M
   Send("{ESC}"); Refresh field
   Send("{4}") ; Enter 4
   Send("^{P}"); Plus to value in memory
   Send("^{R}") ;Read value from memory
   Send("^{L}") ;Clean memory
   Local $sText = WinGetText($hWnd)
   Assert($sText,20, "Test_6_4") ; 16 + 4

   Send("{ESC}"); Refresh field
   Send("^{R}") ;Read value from memory, memory is empty, should return 0
   Local $sText = WinGetText($hWnd)
   Assert($sText,0, "Test_6_5")

EndFunc


Func Assert(ByRef $vVar1, ByRef $vVar2, ByRef $TestNum)
   If $vVar1 <> $vVar2 Then
	  MsgBox(0, $TestNum, "Result is not equal expected value: " & $vVar1 & " " & $vVar2)
	  $testFailed = $testFailed & $TestNum & " "
   EndIf
EndFunc