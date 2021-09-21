#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

/*
USES WINDOW COORDINATES DEFAULT
*/

#SingleInstance force ;
/*

*/
Esc::ExitApp ;

Start(){
	PresetScreen() ;
	Inventory() ;

	Global run := 20 ;

	Loop %run%
	{
		send, //run %run% {enter}
		Loop 50
		{
			MouseClick(0, 265, 215, 1200) ;
		}

		; trade sigmund
		MouseClick(1, 230, 58, 500) ;
		MouseClick(0, 230, 98, 2500) ;

		; sell sigmund
		MouseClick(1, 581, 251, 500) ;
		MouseClick(0, 581, 338, 1000) ;
		send, //333 {enter} ;
		send, {Enter} ;

		; close interface
		MouseClick(0, 495, 54, 1500) ;
		MouseClick(0, 305, 306, 3500) ;

		run -= 1 ;

	}
	send, //finished thieving stalls {enter}
	return
}


Inventory()
{
    MouseClick(0, 645, 215, 750) ;
}
Spellbook(){
	MouseClick(0, 743, 209, 750) ; spellbook tab
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