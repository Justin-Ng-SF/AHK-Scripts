#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force ;

Esc::ExitApp ;

; make sure bank booth is to the east, make sure bank tab is preset to main tab



Start()
{
	PresetScreen() ;
	Inventory() ;

	Loop 100{
		MouseClick(0, 300, 185, 1500) ; click on bank, should be tile to the east
		MouseClick(1, 585, 469, 500) ; select bottom left most item
		MouseClick(0, 585, 469, 500) ; select bottom left most item

		;get item in bank at most right, second from bottom [10][5]
		MouseClick(1,  447, 261, 1500) ;
		MouseClick(0,  447, 261, 1500) ;

		MouseClick(0, 484, 43, 1500) ; close bank interface
		Item(1) ;
		Sleep 1000 ;
		Item(2) ;
		Sleep 35000 ;

		}
	return
}

; ==================OTHER====================

Inventory()
{
    MouseClick(0, 645, 215, 750) ;
}
Spellbook(){
	MouseClick(0, 743, 209, 750) ; spellbook tab
}

LandsEndTP(){
	Spellbook() ;

	MouseClick(0, 617, 393, 500) ; skillers teleport
	sleep 1000 ;
	MouseClick(0, 388, 97, 250) ; lands end 
	sleep 4000 ; wait for teleport to finish
}


PresetScreen()
{
    MouseClick(0, 565, 50, 100) ; minimap compass

	MouseMove, 200, 200 ;
	sleep 50 ;
	Loop 14
	{
		Send {WheelUp} ;
		sleep 50 ;
	}
	Loop 4
	{
		Send {WheelDown} ;
		sleep 50 ;
	}
	Send {Up down} ; move screen up
	sleep 2500 ;
	Send {Up up} ;
}

CheckImage(roomName, errorMsg, screenShot)
{
    coordMode,pixel
    ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %screenShot%
    {
        if (ErrorLevel = 2)
        {
            send, /error level 2 %roomName% ;
            send, {enter} ;
            return 0 ;
        }
        else if (ErrorLevel = 1)
        {
            send, /%errorMsg% ;
			send, {enter} ;
            return 0 ;
        }
        else
        {
            return 1 ;
        }
    }
    return ;
}

MouseClick(button, x, y, sleepTime)
{
        MouseMove, x, y ;
        sleep 100 ;
        if(button=0)
        {
            click, x, y ;
        }
        else if(button=1)
        {
            click, right, x, y ;
        }
    	sleep sleepTime ;
}


`::Start() ;