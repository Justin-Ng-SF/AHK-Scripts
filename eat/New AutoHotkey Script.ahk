#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force ;

Esc::ExitApp ;

Start(){
    Loop 1{


        Food := 24 ;



        Loop 10000
        {
            if(CheckHP(Food)){
                Food-- ;
            }
            sleep 10000 ;
        }

    }

return ;
}





CheckHp(Food){
    coordMode,pixel
    ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, 77hp.PNG
        if (ErrorLevel = 2)
        {
            send, /error! broken ; if picture not found?
            send, {enter} ;
        }
        else if (ErrorLevel = 1)
        {
            return ;
        }
        else
        {
            if(Food = 24)
            {
                MouseMove, 580, 290 ;
                sleep 100 ;
                Click, 580, 290 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 23)
            {
                MouseMove, 625, 290 ;
                sleep 100 ;
                Click, 625, 290 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 22)
            {
                MouseMove, 660, 290 ;
                sleep 100 ;
                Click, 660, 290 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 21)
            {
                MouseMove, 710, 290 ;
                sleep 100 ;
                Click, 710, 290 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 20)
            {
                MouseMove, 580, 325 ;
                sleep 100 ;
                Click, 580, 325 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 19)
            {
                MouseMove, 625, 325 ;
                sleep 100 ;
                Click, 625, 325 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 18)
            {
                MouseMove, 660, 325 ;
                sleep 100 ;
                Click, 660, 325 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 17)
            {
                MouseMove, 710, 325 ;
                sleep 100 ;
                Click, 710, 325 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 16)
            {
                MouseMove, 580, 365 ;
                sleep 100 ;
                Click, 580, 365 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 15)
            {
                MouseMove, 625, 365 ;
                sleep 100 ;
                Click, 625, 365 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 14)
            {
                MouseMove, 660, 365 ;
                sleep 100 ;
                Click, 660, 365 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 13)
            {
                MouseMove, 710, 365 ;
                sleep 100 ;
                Click, 710, 365 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 12)
            {
                MouseMove, 580, 400 ;
                sleep 100 ;
                Click, 580, 400 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 11)
            {
                MouseMove, 625, 400 ;
                sleep 100 ;
                Click, 625, 400 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 10)
            {
                MouseMove, 660, 400 ;
                sleep 100 ;
                Click, 660, 400 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 9)
            {
                MouseMove, 710, 400 ;
                sleep 100 ;
                Click, 710, 400 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 8)
            {
                MouseMove, 580, 435 ;
                sleep 100 ;
                Click, 580, 435 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 7)
            {
                MouseMove, 625, 435 ;
                sleep 100 ;
                Click, 625, 435 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 6)
            {
                MouseMove, 660, 435 ;
                sleep 100 ;
                Click, 660, 435 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 5)
            {
                MouseMove, 710, 435 ;
                sleep 100 ;
                Click, 710, 435 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 4)
            {
                MouseMove, 580, 470 ;
                sleep 100 ;
                Click, 580, 470 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 3)
            {
                MouseMove, 625, 470 ;
                sleep 100 ;
                Click, 625, 470 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 2)
            {
                MouseMove, 660, 470 ;
                sleep 100 ;
                Click, 660, 470 ;
                sleep 100 ;
                return true ;
            }
            else if(Food = 1)
            {
                MouseMove, 710, 470 ;
                sleep 100 ;
                Click, 710, 470 ;
                sleep 100 ;
                return true ;
            }
            else if(Food < 0)
            {
                ExitApp ;
            }
        }
}

`::Start() ;