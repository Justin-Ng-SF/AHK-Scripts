#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force ;

Esc::ExitApp ;




Start(){
    Loop 101{
        MouseMove, 255, 225 ; bank
        sleep 100 ;
        Click, 255, 225 ; bank
        sleep 1250 ;

        MouseMove, 448, 198 ;
        sleep 100 ;
        Click, right, 448, 198 ; right click bank item [10][3]
        sleep 500 ;

        MouseMove, 449, 262 ;
        sleep 100 ;
        Click, 449, 262 ; withdraw all
        sleep 500 ;

        MouseMove, 632, 82 ;
        sleep 100 ;
        Click, 632, 82 ; walk to natures
        sleep 5000 ;

        MouseMove, 255, 193 ;
        sleep 100 ;
        Click, 255, 193 ; walk to natures
        sleep 5000 ;


        MouseMove, 664, 138 ; walk to bank
        sleep 100 ;
        Click, 664, 138 ;
        sleep 5000 ;


    }

return ;
}









`::Start() ;