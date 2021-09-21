#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force ;

Esc::ExitApp ;

global func = 5
global fo := false ; 
global foo := false ; 
global fook := false ;


Start(){
    Loop 100{
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

        MouseMove, 600, 114 ;
        sleep 100 ;
        Click, 600, 114 ; walk to natures
        sleep 10000 ;

        MouseMove, 278, 201 ;
        sleep 100 ;
        Click, 278, 201 ; make runes
        sleep 5000 ;


        MouseMove, 697, 107 ; walk to bank
        sleep 100 ;
        Click, 697, 107 ;
        sleep 10000 ;


    }

return ;
}









`::Start() ;