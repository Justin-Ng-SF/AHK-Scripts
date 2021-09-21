#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force ;

Esc::ExitApp ;

; put 2 items to be used on upper right of bank, bank should be on east side


Start(){
    Loop 13{
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

        MouseMove, 449, 223 ;
        sleep 100 ;
        Click, 449, 223 ;
        sleep 500 ;

        MouseMove, 405, 123 ;
        sleep 100 ;
        Click, right, 405, 123 ; right click bank item [10][1]
        sleep 500 ;

        MouseMove, 405, 223 ;
        sleep 100 ;
        Click, 405, 223 ;
        sleep 500 ;

        MouseMove, 487, 42 ;
        sleep 100 ;
        Click, 487, 42 ; exit
        sleep 500 ;

        MouseMove, 583, 363 ;
        sleep 100 ;
        Click, 583, 363 ;
        sleep 250 ;

        MouseMove, 583, 405 ;
        sleep 100 ;
        Click, 583, 405 ;
        sleep 20000







    }

return ;
}









`::Start() ;