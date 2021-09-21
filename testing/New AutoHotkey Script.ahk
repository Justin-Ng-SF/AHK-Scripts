#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force ;

Esc::ExitApp ;


Start(){
    Loop 100
    {
        coordMode,pixel
        ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, nw.PNG
            if (ErrorLevel = 2)
            {
                send, /error! broken ; if picture not found?
                send, {enter} ;
            }
            else if (ErrorLevel = 1)
            {
                send, /error picture not found ;
                send, {enter} ;
            }
            else
            {	; northwest
                click, 505, 185 ; click east door
                sleep 4500 ;
                click, 430, 193 ; click second door
                sleep 2500 ;
                Send {Left down} ; move minimap
                sleep 750 ;
                Send {Left up} ;
                sleep 750 ;
                click, 504, 95 ; click on south door
                sleep 4500 ;
                click, 421, 245 ; click second door

                presetScreen() ;
                click, 175, 346 ; move down
                sleep 3500 ;
                click, 368, 258 ; move infront of chest
                sleep 3000 ;

            }





    }

return ;
}









`::Start() ;