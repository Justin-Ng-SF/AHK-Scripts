#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force ;

Esc::ExitApp ;


Start(){
    Loop 100{
        MouseMove, 223, 201 ; bank
        sleep 100 ;
        Click, 223, 201 ;
        sleep 1250 ;

        MouseMove, 439, 337 ; bank all
        sleep 100 ;
        Click, 439, 337 ;
        sleep 750 ;

        MouseMove, 675, 105  ; walk to iron ores
        sleep 100 ;
        Click, 675, 105 ;
        sleep 5000 ;

        Loop 6{
            MouseMove, 265, 163 ; mine north rock
            sleep 100 ;
            Click, 265, 163 ;
            sleep 3000 ;

            MouseMove, 221, 193 ; mine west rock
            sleep 100 ;
            Click, 221, 193 ;
            sleep 3000 ;

            MouseMove, 258, 228 ; mine south rock
            sleep 100 ;
            Click, 258, 228 ;
            sleep 3000 ;
        }



        MouseMove, 618, 112 ; walk infront of bank
        sleep 100 ;
        Click, 618, 112 ;
        sleep 5000 ;





    }

return ;
}









`::Start() ;