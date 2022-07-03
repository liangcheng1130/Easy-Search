#NoTrayIcon
#RequireAdmin
#Region ;**** 由 AccAu3Wrapper_GUI 创建指令 ****
#AccAu3Wrapper_Icon=D:\Users\Downloads\Compressed\candy-icons\search.ico
#AccAu3Wrapper_Outfile=EasySearchV1.2.exe
#AccAu3Wrapper_UseX64=n
#AccAu3Wrapper_Res_Comment=一键搜索工具EasySearchV1.2
#AccAu3Wrapper_Res_Description=一键搜索工具EasySearchV1.2
#AccAu3Wrapper_Res_Fileversion=1.0.0.8
#AccAu3Wrapper_Res_Fileversion_AutoIncrement=y
#AccAu3Wrapper_Res_ProductVersion=1.0
#AccAu3Wrapper_Res_LegalCopyright=Made by TY
#AccAu3Wrapper_Res_Language=2052
#AccAu3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#AccAu3Wrapper_Run_Tidy=y
#AccAu3Wrapper_Run_Obfuscator=y
#Obfuscator_Parameters=/cs=1 /cn=1 /cf=1 /cv=1 /sf=1 /sv=1 /sci=0
#AccAu3Wrapper_Antidecompile=y
#AccAu3Wrapper_DBSupport=y
#EndRegion ;**** 由 AccAu3Wrapper_GUI 创建指令 ****
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=H:\Documents\AU3编程学习\EasySearch\GUI.kxf
$Temp = @ScriptDir & "\Temp"
DirRemove($Temp, 1)
DirCreate($Temp)

$Form2 = GUICreate("EasySearch V1.2", 452, 334, 254, 218, -1, BitOR($WS_EX_TOPMOST, $WS_EX_WINDOWEDGE))
GUISetBkColor(0xA6CAF0)
$GroupBox1 = GUICtrlCreateGroup("搜索关键字", 8, 9, 433, 105)
$Input = GUICtrlCreateInput("", 40, 48, 377, 28, 0)
GUICtrlSetFont(-1, 11, 400, 0, "微软雅黑")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button1 = GUICtrlCreateButton("&搜索", 81, 267, 90, 33)
$Button2 = GUICtrlCreateButton("&关于", 190, 267, 90, 33)
$Button3 = GUICtrlCreateButton("&退出", 298, 267, 90, 33)
$Group1 = GUICtrlCreateGroup("搜索范围", 40, 136, 369, 57)
$Combo1 = GUICtrlCreateCombo("", 72, 160, 313, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL, $CBS_SORT, $CBS_UPPERCASE))
GUICtrlSetData(-1, "YR+423+果核|YR专搜|423+果核", "YR+423+果核")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("YR网站搜索选项", 40, 200, 369, 49)
$Radio1 = GUICtrlCreateRadio("主站（容易无法访问）", 72, 224, 145, 17, BitOR($GUI_SS_DEFAULT_RADIO, $BS_LEFT))
$Radio2 = GUICtrlCreateRadio("备用站", 264, 224, 113, 17, BitOR($GUI_SS_DEFAULT_RADIO, $BS_LEFT))
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlSetState($Radio1, $GUI_CHECKED)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			GUISetState(@SW_HIDE)
			DirRemove($Temp)
			Exit
		Case $Button3
			GUISetState(@SW_HIDE)
			DirRemove($Temp)
			Exit
		Case $Button2
			MsgBox(0 + 64 + 8192 + 262144, "关于", "本工具是为了方便一键在网上搜索你需要的软件，而不用打开浏览器，刚开始就做了作者自己认为比较良心的绿色软件分享站，后续再补充，你们有比较好的站也可以QQ联系我，我有时间加入，软件原创者TY，转载请注明出处~（虽说这个软件也是参考别人经验写的），因为这段时间鱼大大的主站很容易没法访问，所以做了一个选框，可自定义是搜索主站还是搜索备用站，423的网站有搜索次数限制，短时间内搜索太多次会禁止搜索，其余暂未发现")
		Case $Button1
			$SechTemp = GUICtrlRead($Input)
			If $SechTemp <> "" Then
				_Search()
			ElseIf $SechTemp == "" Then
				MsgBox(0 + 64 + 8192 + 262144, "提示", "请先输入要搜索的东西，才能搜索，不然搜索个寂寞？")
			EndIf
	EndSwitch
WEnd

Func _Search()
	$Choise = GUICtrlRead($Combo1)
	$Ra1 = GUICtrlRead($Radio1)
	$Ra2 = GUICtrlRead($Radio2)
	If $Choise == "YR+423+果核" Then
		If $Ra2 == 1 Or $Ra1 == 4 Then
			FileInstall(".\Se1.bat", $Temp & "\", 1)
			ShellExecuteWait($Temp & "\Se1.bat", $SechTemp, "", "", @SW_HIDE)
			FileDelete($Temp & "\Se1.bat")
		ElseIf $Ra1 == 1 Or $Ra2 == 4 Then
			FileInstall(".\Se2.bat", $Temp & "\", 1)
			ShellExecuteWait($Temp & "\Se2.bat", $SechTemp, "", "", @SW_HIDE)
			FileDelete($Temp & "\Se2.bat")
		EndIf
	ElseIf $Choise == "YR专搜" Then
		If $Ra2 == 1 Or $Ra1 == 4 Then
			FileInstall(".\Se4.bat", $Temp & "\", 1)
			ShellExecuteWait($Temp & "\Se4.bat", $SechTemp, "", "", @SW_HIDE)
			FileDelete($Temp & "\Se4.bat")
		ElseIf $Ra1 == 1 Or $Ra2 == 4 Then
			FileInstall(".\Se5.bat", $Temp & "\", 1)
			ShellExecuteWait($Temp & "\Se5.bat", $SechTemp, "", "", @SW_HIDE)
			FileDelete($Temp & "\Se5.bat")
		EndIf
	ElseIf $Choise == "423+果核" Then
		FileInstall(".\Se3.bat", $Temp & "\", 1)
		ShellExecuteWait($Temp & "\Se3.bat", $SechTemp, "", "", @SW_HIDE)
		FileDelete($Temp & "\Se3.bat")
	EndIf
EndFunc   ;==>_Search


