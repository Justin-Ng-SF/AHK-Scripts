#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force ;

Esc::ExitApp ;


Start(){
    Loop 200{
        MouseMove, 269, 232 ;
        Sleep 1000 ;
        click, 269, 232 ; use bank booth south side
        sleep 1000 ;

        Sleep 2000 ; 

        MouseMove, 50, 125 ; right click bank item [1][1]
        sleep 1000 ;
        Click, right, 50, 125 ;
        sleep 1000 ;

        MouseMove, 50, 195 ; withdraw all
        sleep 1000 ;
        Click, 50, 195 ;
        sleep 2050 ;

        MouseMove, 633, 67 ; walk to altar
        sleep 2000 ;
        Click, 633, 67 ;
        sleep 7000 ;

        MouseMove, 583, 254 ; right click item [1][1] bones
        sleep 2000 ;
        Click, right, 583, 254 ;
        sleep 2000 ;

        MouseMove, 583, 296 ; use bones
        sleep 1000 ;
        Click, 583, 296 ;
        sleep 2000 ;

        MouseMove, 257, 138 ; click altar
        sleep 1000 ;
        Click, 257, 138 ;
        sleep 60000 ;

        MouseMove, 662, 155 ; walk back to bank
        sleep 1000 ;
        Click, 662, 155 ;
        sleep 7000 ;

    }

    return ;
}




Inventory()
{
    MouseClick(0, 645, 215, 750) ;
}


; ==================OTHER====================
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