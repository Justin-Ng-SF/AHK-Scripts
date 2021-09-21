#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force ;

Esc::ExitApp ;


Start(){
    Loop 7{
        MouseMove, 261, 220 ; bank
        sleep 100 ;
        Click, 261, 220 ;
        sleep 1250 ;

        MouseMove, 447, 270 ; right click bank item [12][5]
        sleep 100 ;
        Click, right, 447, 270 ;
        sleep 500 ;

        MouseMove, 447, 260 ; withdraw all
        sleep 100 ;
        Click, 447, 260 ;
        sleep 1250 ;

        MouseMove, 636, 94 ; walk to altar
        sleep 100 ;
        Click, 636, 94 ;
        sleep 4000 ;

        MouseMove, 583, 254 ; right click item [1][1] bones
        sleep 100 ;
        Click, right, 583, 254 ;
        sleep 750 ;

        MouseMove, 583, 296 ; use bones
        sleep 100 ;
        Click, 583, 296 ;
        sleep 750 ;

        MouseMove, 263, 219 ; click altar
        sleep 100 ;
        Click, 263, 219 ;
        sleep 50000 ;

        MouseMove, 659, 129 ; walk back to bank
        sleep 100 ;
        Click, 659, 129 ;
        sleep 4000 ;






    }

return ;
}









`::Start() ;