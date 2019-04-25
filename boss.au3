#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\kuhiscripts icons\logo_green.ico
#AutoIt3Wrapper_Outfile=Alexia.exe
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include <Date.au3>
#include <AutoItConstants.au3>
#include <FontConstants.au3>

;HotKeySet("t","Telegram")
HotKeySet("{END}","quit")
HotKeySet("{HOME}","visible")

Global $Lunes0015 = "Kutum & Karanda"
Global $Lunes0200 = "Karanda"
Global $Lunes0500 = "Kzarka"
Global $Lunes0900 = "Kzarka"
Global $Lunes1200 = "Offin"
Global $Lunes1600 = "Kutum"
Global $Lunes1900 = "Nouver"
Global $Lunes2215 = "Kzarka"

Global $Martes0015 = "Karanda"
Global $Martes0200 = "Kutum"
Global $Martes0500 = "Kzarka"
Global $Martes0900 = "Nouver"
Global $Martes1200 = "Kutum"
Global $Martes1600 = "Nouver"
Global $Martes1900 = "Karanda"
Global $Martes2215 = "Garmoth"

Global $Miercoles0015 = "Kutum & Kzarka"
Global $Miercoles0200 = "Karanda"
Global $Miercoles0500 = "Kzarka"
Global $Miercoles0900 = "Karanda"
Global $Miercoles1200 = "NO BOSS"
Global $Miercoles1600 = "Kutum"
Global $Miercoles1900 = "Offin"
Global $Miercoles2215 = "Karanda & Kzarka"

Global $Jueves0015 = "Nouver"
Global $Jueves0200 = "Kutum"
Global $Jueves0500 = "Nouver"
Global $Jueves0900 = "Kutum"
Global $Jueves1200 = "Nouver"
Global $Jueves1600 = "Kzarka"
Global $Jueves1900 = "Kutum"
Global $Jueves2215 = "Garmoth"

Global $Viernes0015 = "Kzarka & Karanda"
Global $Viernes0200 = "Nouver"
Global $Viernes0500 = "Karanda"
Global $Viernes0900 = "Kutum"
Global $Viernes1200 = "Karanda"
Global $Viernes1600 = "Nouver"
Global $Viernes1900 = "Kzarka"
Global $Viernes2215 = "Kutum & Kzarka"

Global $Sabado0015 = "Karanda"
Global $Sabado0200 = "Offin"
Global $Sabado0500 = "Nouver"
Global $Sabado0900 = "Kutum"
Global $Sabado1200 = "Nouver"
Global $Sabado1600 = "Quint & Muraka"
Global $Sabado1900 = "Karanda & Kzarka"
Global $Sabado2215 = "NO BOSS"

Global $Domingo0015 = "Nouver & Kutum"
Global $Domingo0200 = "Kzarka"
Global $Domingo0500 = "Kutum"
Global $Domingo0900 = "Nouver"
Global $Domingo1200 = "Kzarka"
Global $Domingo1600 = "Vell"
Global $Domingo1900 = "Garmoth"
Global $Domingo2215 = "Kzarka & Nouver"

Global $Paused = False
Global $time = "Time now: " & @HOUR & ":" & @MIN
Global $msg = ""
Global $text = $time & @LF & $msg

Global $width = 0
Global $height = 0
Global $fontsize = 0
Global $fonttype = 0
Global $X = 0
Global $Y = 0

#Region WriteIni
If Not FileExists("settings.ini") Then
	;1=EXTRA SMALL - 2=SMALL - 3=MEDIUM - 4=BIG
	IniWriteSection("settings.ini","SETTINGS","")
	FileOpen("settings.ini",1)

	FileWriteLine("settings.ini","### WINDOW SIZE: 1=EXTRA SMALL - 2=SMALL - 3=MEDIUM - 4=BIG ###")
	IniWrite("settings.ini", "SETTINGS", "WINDOW SIZE", "1")
	FileWriteLine("settings.ini","")

	FileWriteLine("settings.ini","### WINDOW POSITION: 1=WEST - 2=NORTH-WEST - 3=NORTH - 4=NORTH-EAST - 5=EAST - 6=SOUTH-EAST - 7=SOUTH - 8=SOUTH-WEST ###")
	;1=WEST - 2=NORTH-WEST - 3=NORTH - 4=NORTH-EAST - 5=EAST - 6=SOUTH-EAST - 7=SOUTH - 8=SOUTH-WEST
	IniWrite("settings.ini", "SETTINGS", "WINDOW POSITION", "3")
	FileWriteLine("settings.ini","")

	IniWriteSection("settings.ini","TELEGRAM","")
	FileWriteLine("settings.ini","### Add to Telegram: @userinfobot ###")
	IniWrite("settings.ini","TELEGRAM","ACTIVE","False")
	IniWrite("settings.ini","TELEGRAM","USER ID","Please, write your ID here.")
	FileClose("settings.ini")
EndIf
#EndRegion WriteIni

#Region ReadIni
$windowsize = IniRead("settings.ini","SETTINGS", "WINDOW SIZE",Default)
Select
	Case $windowsize = "1"
		$width = 150
		$height = 45
		$fontsize = 6
		$fonttype = 100
	Case $windowsize = "2"
		$width = 150
		$height = 45
		$fontsize = 8
		$fonttype = 200
	Case $windowsize = "3"
		$width = 200
		$height = 60
		$fontsize = 10
		$fonttype = 300
	Case $windowsize = "4"
		$width = 250
		$height = 70
		$fontsize = 14
		$fonttype = 500
	Case Else
		MsgBox(16,"ERROR","Please change settings.ini:" & @LF & "Window size: value between 1 and 5.")
EndSelect

$windowsize = IniRead("settings.ini","SETTINGS", "WINDOW POSITION",Default)
Select
	Case $windowsize = "1"
		$X = 0
		$Y = (@DesktopHeight / 2) - ($height / 2)
	Case $windowsize = "2"
		$X = 0
		$Y = 0
	Case $windowsize = "3"
		$X = (@DesktopWidth / 2) - ($width / 2)
		$Y = 0
	Case $windowsize = "4"
		$X = @DesktopWidth - $width
		$Y = 0
	Case $windowsize = "5"
		$X = @DesktopWidth - $width
		$Y = (@DesktopHeight / 2) - ($height / 2)
	Case $windowsize = "6"
		$X = @DesktopWidth - $width
		$Y = @DesktopHeight - $height
	Case $windowsize = "7"
		$X = (@DesktopWidth / 2) - ($width / 2)
		$Y = @DesktopHeight - $height
	Case $windowsize = "8"
		$X = 0
		$Y = @DesktopHeight - $height
	Case Else
		MsgBox(16,"ERROR","Please change settings.ini:" & @LF & "Window position: value between 1 and 8.")
EndSelect
#EndRegion ReadIni

#Region ### Telegram ###
Func Telegram()

EndFunc
#EndRegion ### Telegram ###

Global $sphandle = SplashTextOn("", $text, $width, $height, $X, $Y, $DLG_NOTITLE, "Segoe UI", $fontsize, $fonttype)

While 1
	While Not $Paused
		Loop()
		print()
		Sleep(500)
	WEnd
	Sleep(500)
WEnd

Func test()
;If Not FileExists($image) Then
;	MsgBox(16,"ERROR","Unable to find " & $image)
;EndIf
;SplashImageOn($title,$image,-1,-1,0,0)
;Sleep(5000)
;SplashOff()
;SplashTextOn("",$image,200,20,0,0,$DLG_NOTITLE,"Overpass",8)
print()
EndFunc

Func visible()
If $Paused = False Then
	$Paused = True
	SplashOff()
Else
	$Paused = False
	$sphandle = SplashTextOn("", $text, $width, $height, $X, $Y, $DLG_NOTITLE, "Segoe UI", $fontsize, $fonttype)
EndIf
EndFunc

Func quit()
Exit
EndFunc

Func Loop()
	#Region ### LUNES ###
	;LUNES 00:15
	If @HOUR = 22 And @WDAY = 1 Then
		If @MIN > 15 Then
			$msg = $Lunes0015 & ": 00:15"
		EndIf
	EndIf
	If @HOUR = 23 And @WDAY = 1 Then
		$msg = $Lunes0015 & ": 00:15"
	EndIf
	If @HOUR = 0 And @WDAY = 2 Then
		If @MIN < 15 Then
			$msg = $Lunes0015 & ": 00:15"
		EndIf
	EndIf

	;LUNES 02:00
	If @HOUR = 0 And @WDAY = 2 Then
		If @MIN > 15 Then
			$msg = $Lunes0200 & ": 02:00"
		EndIf
	EndIf
	If @HOUR = 1 And @WDAY = 2 Then
		$msg = $Lunes0200 & ": 02:00"
	EndIf

	;LUNES 05:00
	If @HOUR = 2 And @WDAY = 2 Then
		If @MIN > 0 Then
			$msg = $Lunes0500 & ": 05:00"
		EndIf
	EndIf
	If @HOUR = 3 And @WDAY = 2 Then
		$msg = $Lunes0500 & ": 05:00"
	EndIf
	If @HOUR = 4 And @WDAY = 2 Then
		$msg = $Lunes0500 & ": 05:00"
	EndIf

	;LUNES 09:00
	If @HOUR >=5 And @HOUR < 9 And @WDAY = 2 Then
		$msg = $Lunes0900 & ": 09:00"
	EndIf
	If @HOUR = 8 And @WDAY = 2 Then
		$msg = $Lunes0900 & ": 09:00"
	EndIf

	;LUNES 12:00
	If @HOUR >= 9 And @HOUR < 12 And @WDAY = 2 Then
		$msg = $Lunes1200 & ": 12:00"
	EndIf
	If @HOUR = 11 And @WDAY = 2 Then
		$msg = $Lunes1200 & ": 12:00"
	EndIf

	;LUNES 16:00
	If @HOUR >= 12 And @HOUR < 16 And @WDAY = 2 Then
		$msg = $Lunes1600 & ": 16:00"
	EndIf
	If @HOUR = 15 And @WDAY = 2 Then
		$msg = $Lunes1600 & ": 16:00"
	EndIf

	;LUNES 19:00
	If @HOUR >= 16 And @HOUR < 19 And @WDAY = 2 Then
		$msg = $Lunes1900 & ": 19:00"
	EndIf
	If @HOUR = 18 And @WDAY = 2 Then
		$msg = $Lunes1900 & ": 19:00"
	EndIf

	;LUNES 22:15
	If @HOUR >= 19 And @HOUR < 22 And @WDAY = 2 Then
		$msg = $Lunes2215 & ": 22:15"
	EndIf
	If @HOUR = 21 And @WDAY = 2 Then
		$msg = $Lunes2215 & ": 22:15"
	EndIf
	If @HOUR = 22 And @WDAY = 2 Then
		If @MIN < 15 Then
			$msg = $Lunes2215 & ": 22:15"
		EndIf
	EndIf
	#EndRegion

	#Region ### MARTES ###
	;MARTES 00:15
	If @HOUR = 22 And @MIN > 15 And @WDAY = 2 Then
		$msg = $Martes0015 & ": 00:15"
	EndIf
	If @HOUR = 23 And @WDAY = 2 Then
		$msg = $Martes0015 & ": 00:15"
	EndIf
	If @HOUR = 0 And @WDAY = 3 Then
		If @MIN < 15 Then
			$msg = $Martes0015 & ": 00:15"
		EndIf
	EndIf

	;MARTES 02:00
	If @HOUR = 0 And @MIN > 15 And @WDAY = 3 Then
		$msg = $Martes0200 & ": 02:00"
	EndIf
	If @HOUR = 1 And @WDAY = 3 Then
		$msg = $Martes0200 & ": 02:00"
	EndIf

	;MARTES 05:00
	If @HOUR >= 2 And @HOUR < 5 And @WDAY = 3 Then
		$msg = $Martes0500 & ": 05:00"
	EndIf
	If @HOUR = 4 And @WDAY = 3 Then
		$msg = $Martes0500 & ": 05:00"
	EndIf

	;MARTES 09:00
	If @HOUR >= 5 And @HOUR < 9 And @WDAY = 3 Then
		$msg = $Martes0900 & ": 09:00"
	EndIf
	If @HOUR = 8 And @WDAY = 3 Then
		$msg = $Martes0900 & ": 09:00"
	EndIf

	;MARTES 12:00
	If @HOUR >= 9 And @HOUR < 12 And @WDAY = 3 Then
		$msg = $Martes1200 & ": 12:00"
	EndIf
	If @HOUR = 11 And @WDAY = 3 Then
		$msg = $Martes1200 & ": 12:00"
	EndIf

	;MARTES 16:00
	If @HOUR >= 12 And @HOUR < 16 And @WDAY = 3 Then
		$msg = $Martes1600 & ": 16:00"
	EndIf
	If @HOUR = 15 And @WDAY = 3 Then
		$msg = $Martes1600 & ": 16:00"
	EndIf

	;MARTES 19:00
	If @HOUR >= 16 And @HOUR < 19 And @WDAY = 3 Then
		$msg = $Martes1900 & ": 19:00"
	EndIf
	If @HOUR = 18 And @WDAY = 3 Then
		$msg = $Martes1900 & ": 19:00"
	EndIf

	;MARTES 22:15
	If @HOUR >= 19 And @HOUR <= 22 And @WDAY = 3 Then
		If @HOUR < 22 Then
			$msg = $Martes2215 & ": 22:15"
		Else
			If @HOUR = 22 And @MIN < 15 Then
				$msg = $Martes2215 & ": 22:15"
			EndIf
		EndIf
	EndIf
	If @HOUR = 21 And @WDAY = 3 Then
		$msg = $Martes2215 & ": 22:15"
	EndIf
	If @HOUR = 22 And @WDAY = 3 Then
		If @MIN = 0 Then
			$msg = $Martes2215 & ": 22:15"
		EndIf
	EndIf
	#EndRegion
																																																																								
	#Region ### MIÉRCOLES ###
	;MIÉRCOLES 00:15
	If @HOUR = 22 And @WDAY = 3 And @MIN > 15 Then
		$msg = $Miercoles0015 & ": 00:15"
	EndIf
	If @HOUR = 23 And @WDAY = 3 Then
		$msg = $Miercoles0015 & ": 00:15"
	EndIf
	If @HOUR = 0 And @WDAY = 4 Then
		If @MIN < 15 Then
			$msg = $Miercoles0015 & ": 00:15"
		EndIf
	EndIf

	;MIÉRCOLES 02:00
	If @HOUR = 0 And @WDAY = 4 And @MIN > 15 Then
		$msg = $Miercoles0200 & ": 02:00"
	EndIf
	If @HOUR = 1 And @WDAY = 4 Then
		$msg = $Miercoles0200 & ": 02:00"
	EndIf

	;MIÉRCOLES 05:00
	If @HOUR >= 2 And @HOUR < 5 And @WDAY = 4 Then
		$msg = $Miercoles0500 & ": 05:00"
	EndIf
	If @HOUR = 4 And @WDAY = 4 Then
		$msg = $Miercoles0500 & ": 05:00"
	EndIf

	;MIÉRCOLES 09:00
	If @HOUR >= 5 And @HOUR < 9 And @WDAY = 4 Then
		$msg = $Miercoles0900 & ": 09:00"
	EndIf
	If @HOUR = 8 And @WDAY = 4 Then
		$msg = $Miercoles0900 & ": 09:00"
	EndIf

	;MIÉRCOLES 16:00
	If @HOUR >= 9 And @HOUR < 16 And @WDAY = 4 Then
		$msg = $Miercoles1600 & ": 16:00"
	EndIf
	If @HOUR = 15 And @WDAY = 4 Then
		$msg = $Miercoles1600 & ": 16:00"
	EndIf

	;MIÉRCOLES 19:00
	If @HOUR >= 16 And @HOUR < 19 And @WDAY = 4 Then
		$msg = $Miercoles1900 & ": 19:00"
	EndIf
	If @HOUR = 18 And @WDAY = 4 Then
		$msg = $Miercoles1900 & ": 19:00"
	EndIf

	;MIÉRCOLES 22:15
	If @HOUR >= 19 And @HOUR <= 22 And @WDAY = 4 Then
		If @HOUR = 22 Then
			If @MIN < 15 Then
				$msg = $Miercoles2215 & ": 22:15"
			EndIf
		Else
			$msg = $Miercoles2215 & ": 22:15"
		EndIf
	EndIf
	If @HOUR = 21 And @WDAY = 4 Then
		$msg = $Miercoles2215 & ": 22:15"
	EndIf
	If @HOUR = 22 And @WDAY = 4 Then
		If @MIN < 15 Then
			$msg = $Miercoles2215 & ": 22:15"
		EndIf
	EndIf
	#EndRegion

	#Region ### JUEVES ###
	;JUEVES 00:15
	If @HOUR = 22 And @MIN > 15 And @WDAY = 4 Then
		$msg = $Jueves0015 & ": 00:15"
	EndIf
	If @HOUR = 23 And @WDAY = 4 Then
		$msg = $Jueves0015 & ": 00:15"
	EndIf
	If @HOUR = 0 And @WDAY = 5 Then
		If @MIN < 15 Then
			$msg = $Jueves0015 & ": 00:15"
		EndIf
	EndIf

	;JUEVES 02:00
	If @HOUR = 0 And @WDAY = 5 And @MIN > 15 Then
		$msg = $Jueves0200 & ": 02:00"
	EndIf
	If @HOUR = 1 And @WDAY = 5 Then
		$msg = $Jueves0200 & ": 02:00"
	EndIf

	;JUEVES 05:00
	If @hour >= 2 and @hour < 5 and @WDAY = 5 Then
		$msg = $Jueves0500 & ": 05:00"
	EndIf
	If @HOUR = 4 And @WDAY = 5 Then
		$msg = $Jueves0500 & ": 05:00"
	EndIf

	;JUEVES 09:00
	If @HOUR >= 5 And @HOUR < 9 And @WDAY = 5 Then
		$msg = $Jueves0900 & ": 09:00"
	EndIf
	If @HOUR = 8 And @WDAY = 5 Then
		$msg = $Jueves0900 & ": 09:00"
	EndIf

	;JUEVES 12:00
	If @HOUR >= 9 And @HOUR < 12 And @WDAY = 5 Then
		$msg = $Jueves1200 & ": 12:00"
	EndIf
	If @HOUR = 11 And @WDAY = 5 Then
		$msg = $Jueves1200 & ": 12:00"
	EndIf

	;JUEVES 16:00
	If @HOUR >= 12 And @HOUR < 16 And @WDAY = 5 Then
		$msg = $Jueves1600 & ": 16:00"
	EndIf
	If @HOUR = 15 And @WDAY = 5 Then
		$msg = $Jueves1600 & ": 16:00"
	EndIf

	;JUEVES 19:00
	If @HOUR >= 16 And @HOUR < 19 And @WDAY = 5 Then
		$msg = $Jueves1900 & ": 19:00"
	EndIf
	If @HOUR = 18 And @WDAY = 5 Then
		$msg = $Jueves1900 & ": 19:00"
	EndIf

	;JUEVES 22:15
	If @HOUR >= 19 And @HOUR <= 22 And @WDAY = 5 Then
		If @HOUR = 22 Then
			If @MIN < 15 Then
				$msg = $Jueves2215 & ": 22:15"
			EndIf
		Else
			$msg = $Jueves2215 & ": 22:15"
		EndIf
	EndIf
	If @HOUR = 21 And @WDAY = 5 Then
		$msg = $Jueves2215 & ": 22:15"
	EndIf
	If @HOUR = 22 And @WDAY = 5 Then
		If @MIN < 15 Then
			$msg = $Jueves2215 & ": 22:15"
		EndIf
	EndIf
	#EndRegion

	#Region ### VIERNES ###
	;VIERNES 00:15
	If @HOUR = 22 And @WDAY = 5 And @MIN > 15 Then
		$msg = $Viernes0015 & ": 00:15"
	EndIf
	If @HOUR = 23 And @WDAY = 5 Then
		$msg = $Viernes0015 & ": 00:15"
	EndIf
	If @HOUR = 0 And @WDAY = 6 Then
		If @MIN < 15 Then
			$msg = $Viernes0015 & ": 00:15"
		EndIf
	EndIf

	;VIERNES 02:00
	If @HOUR = 0 And @MIN > 15 And @WDAY = 6 Then
		$msg = $Viernes0200 & ": 02:00"
	EndIf
	If @HOUR = 1 And @WDAY = 6 Then
		$msg = $Viernes0200 & ": 02:00"
	EndIf

	;VIERNES 05:00
	If @HOUR >= 2 and @hour < 5 and @WDAY = 6 Then
		$msg = $Viernes0500 & ": 05:00"
	EndIf
	If @HOUR = 4 And @WDAY = 6 Then
		$msg = $Viernes0500 & ": 05:00"
	EndIf

	;VIERNES 09:00
	If @hour >= 5 and @hour < 9 and @WDAY = 6 Then
		$msg = $Viernes0900 & ": 09:00"
	EndIf
	If @HOUR = 8 And @WDAY = 6 Then
		$msg = $Viernes0900 & ": 09:00"
	EndIf

	;VIERNES 12:00
	If @hour >= 9 and @hour < 12 and @WDAY = 6 Then
		$msg = $Viernes1200 & ": 12:00"
	EndIf
	If @HOUR = 11 And @WDAY = 6 Then
		$msg = $Viernes1200 & ": 12:00"
	EndIf

	;VIERNES 16:00
	If @HOUR >= 12 and @hour < 16 And @WDAY = 6 Then
		$msg = $Viernes1600 & ": 16:00"
	EndIf
	If @HOUR = 15 And @WDAY = 6 Then
		$msg = $Viernes1600 & ": 16:00"
	EndIf

	;VIERNES 19:00
	If @HOUR >= 16 And @hour < 19 And @WDAY = 6 Then
		$msg = $Viernes1900 & ": 19:00"
	EndIf
	If @HOUR = 18 And @WDAY = 6 Then
		$msg = $Viernes1900 & ": 19:00"
	EndIf

	;VIERNES 22:15
	If @HOUR >= 19 And @HOUR < 22 and @WDAY = 6 Then
		$msg = $Viernes2215 & ": 22:15"
	EndIf
	If @HOUR = 23 And @WDAY = 6 Then
		$msg = $Viernes2215 & ": 22:15"
	EndIf
	If @HOUR = 22 And @WDAY = 6 Then
		if @MIN < 15 Then
			$msg = $Viernes2215 & ": 22:15"
		EndIf
	EndIf
	#EndRegion

	#Region ### SÁBADO ###
	;SÁBADO 00:15
	If @HOUR = 22 And @WDAY = 6 And @MIN > 15 Then
		$msg = $Sabado0015 & ": 00:15"
	EndIf
	If @HOUR = 23 And @WDAY = 6 Then
		$msg = $Sabado0015 & ": 00:15"
	EndIf
	If @HOUR = 0 And @WDAY = 7 Then
		if @MIN < 15 Then
			$msg = $Sabado0015 & ": 00:15"
		EndIf
	EndIf

	;SÁBADO 02:00
	If @HOUR = 0 and @WDAY = 7 and @MIN > 15 Then
		$msg = $Sabado0200 & ": 02:00"
	EndIf
	If @HOUR = 1 And @WDAY = 7 Then
		$msg = $Sabado0200 & ": 02:00"
	EndIf

	;SÁBADO 05:00
	If @HOUR >= 2 and @HOUR < 5 And @WDAY = 7 Then
		$msg = $Sabado0500 & ": 05:00"
	EndIf
	If @HOUR = 4 And @WDAY = 7 Then
		$msg = $Sabado0500 & ": 05:00"
	EndIf

	;SÁBADO 09:00
	If @HOUR >= 5 and @HOUR < 9 and @WDAY = 7 Then
		$msg = $Sabado0900 & ": 09:00"
	EndIf
	If @HOUR = 8 And @WDAY = 7 Then
		$msg = $Sabado0900 & ": 09:00"
	EndIf

	;SÁBADO 12:00
	If @hour >= 9 And @HOUR < 12 And @WDAY = 7 Then
		$msg = $Sabado1200 & ": 12:00"
	EndIf
	If @HOUR = 11 And @WDAY = 7 Then
		$msg = $Sabado1200 & ": 12:00"
	EndIf

	;SÁBADO 16:00
	if @HOUR >= 12 and @hour < 16 and @WDAY = 7 Then
		$msg = $Sabado1600 & ": 16:00"
	EndIf
	If @HOUR = 15 And @WDAY = 7 Then
		$msg = $Sabado1600 & ": 16:00"
	EndIf

	;SÁBADO 19:00
	If @HOUR >= 16 and @HOUR < 19 and @WDAY = 7 Then
		$msg = $Sabado1900 & ": 19:00"
	EndIf
	If @HOUR = 18 And @WDAY = 7 Then
		$msg = $Sabado1900 & ": 19:00"
	EndIf
	#EndRegion

	#Region ### DOMINGO ###
	;DOMINGO 00:15
	If @hour >= 19 And @hour <= 23 and @WDAY = 7 Then
		$msg = $Domingo0015 & ": 00:15"
	EndIf
	If @HOUR = 0 And @WDAY = 1 Then
		If @MIN < 15 Then
			$msg = $Domingo0015 & ": 00:15"
		EndIf
	EndIf

	;DOMINGO 02:00
	If @HOUR = 0 and @min > 15 and @WDAY = 1 Then
		$msg = $Domingo0200 & ": 02:00"
	EndIf
	If @HOUR = 1 And @WDAY = 1 Then
		$msg = $Domingo0200 & ": 02:00"
	EndIf

	;DOMINGO 05:00
	If @HOUR >= 2 And @HOUR < 5 and @WDAY = 1 Then
		$msg = $Domingo0500 & ": 05:00"
	EndIf
	If @HOUR = 4 And @WDAY = 1 Then
		$msg = $Domingo0500 & ": 05:00"
	EndIf

	;DOMINGO 09:00
	if @hour >= 5 and @hour < 9 and @WDAY = 1 Then
		$msg = $Domingo0900 & ": 09:00"
	EndIf
	If @HOUR = 8 And @WDAY = 1 Then
		$msg = $Domingo0900 & ": 09:00"
	EndIf

	;DOMINGO 12:00
	If @hour >= 9 and @hour < 12 and @WDAY = 1 Then
		$msg = $Domingo1200 & ": 12:00"
	EndIf
	If @HOUR = 11 And @WDAY = 1 Then
		$msg = $Domingo1200 & ": 12:00"
	EndIf

	;DOMINGO 16:00
	If @HOUR >= 12 and @hour < 16 and @WDAY = 1 Then
		$msg = $Domingo1600 & ": 16:00"
	EndIf
	If @HOUR = 15 And @WDAY = 1 Then
		$msg = $Domingo1600 & ": 16:00"
	EndIf

	;DOMINGO 19:00
	if @hour >= 16 and @hour < 19 and @WDAY = 1 Then
		$msg = $Domingo1900 & ": 19:00"
	endif
	If @HOUR = 18 And @WDAY = 1 Then
		$msg = $Domingo1900 & ": 19:00"
	EndIf

	;DOMINGO 22:15
	If @hour >= 19 and @hour < 22 and @WDAY = 1 Then
		$msg = $Domingo2215 & ": 22:15"
	EndIf
	If @HOUR = 22 And @WDAY = 1 Then
		if @min < 15 Then
			$msg = $Domingo2215 & ": 22:15"
		EndIf
	EndIf
	#EndRegion
EndFunc

Func print()
$time = "Time now: " & @HOUR & ":" & @MIN
;SplashOff()
Local $text2 = $time & @LF & $msg
ControlSetText($sphandle, $text, 'Static1', $text2)
EndFunc