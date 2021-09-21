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
    Loop 15{
        MouseMove, 312, 197 ; bank
        sleep 100 ;
        Click, 312, 197 ; bank
        sleep 1250 ;

        MouseMove, 439, 335 ; deposit
        sleep 100 ;
        Click, 439, 335 ; deposit
        sleep 1500 ;

        MouseMove, 449, 123 ;
        sleep 100 ;
        Click, right, 449, 123 ; right click bank item [10][1]
        sleep 500 ;

        MouseMove, 449, 191 ;
        sleep 100 ;
        Click, 449, 191 ;
        sleep 500 ;

        MouseMove, 487, 42 ;
        sleep 100 ;
        Click, 487, 42 ; exit
        sleep 500 ;

        MouseMove, 707, 470 ;
        sleep 100 ;
        Loop 30{
            click, 707, 470 ;
            sleep 150 ;
        }







    }

return ;
}









`::Start() ;