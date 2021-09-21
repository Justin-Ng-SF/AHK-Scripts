#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force ;

Esc::ExitApp ;

Start()
{
	PresetScreen() ;
	LandsEndTP() ;
	MouseClick(0, 364, 128, 1000) ; use bank; walks to starting tile

	Loop 100
	{
		MouseClick(0, 641, 150, 4500) ; from west of bank box, walk to north tile of trader
		; MouseClick(0, 648, 144, 4000) ; click on minimap to be in center

		; trade with trader
		MouseClick(1, 261, 220, 250) ; 
		MouseClick(0, 261, 260, 2500) ; 

		; buy x uncut drag stones
		MouseClick(1, 461, 91, 1000) ;
		MouseClick(0, 461, 175, 1250) ;
		send, /27 ;
		send, {Enter} ;
		sleep 1250 ;

		; walk to deposit box
		MouseClick(0, 656, 70, 4500) ; 

		MouseClick(0, 300, 195, 1500) ; use bank

		MouseClick(1, 578,  471, 1000) ; select bottom left most item
		MouseClick(0, 578,  471, 2000) ; bank all

		; MouseClick(0, 641, 117, 2000) ; move to teleport spot
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