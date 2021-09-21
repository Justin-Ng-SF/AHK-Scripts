#SingleInstance force ; closes previous instances of script

RunAs ; , @JustinComp, 1028 ; runs script as admin

;WinActivate, Onyx RSPS

Esc::ExitApp ;

Start(){
	loop 1000000 {


		coordMode,window
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, rockcrab.PNG
			if (ErrorLevel = 2)
			{
				send, /error level 2 ;
				return 0 ;
			}
			else if (ErrorLevel = 1)
			{
				
			}
			else
			{
				send, %FoundX%, %Foundy%
				click, %FoundX%, %Foundy% ;

		loop 10 {
			send, {BACKSPACE} ;
			afkcheck() ;
		}
			}
			

	}	
}


afkcheck() { ; checks if an npcs is with 1 sq radius
	coordMode,window
	ImageSearch, FoundX, FoundY, 643, 108, 653, 118, npcdot.PNG
		if (ErrorLevel = 2)
		{
			send, er1 ;
		}
		else if (ErrorLevel = 1)
		{
			sleep 750 ;
		}
		else
		{
			ac() ;
			ac() ;
		}
}	

ac() { ; checks if afk guard is on you
	Sleep 1000 ;
	MC(1, 267, 168, 500) ; 
	checkforguard() ;
	mouseMove, 100, 100, 1 ;

	MC(1, 297, 196, 500) ; 
	checkforguard() ;
	mouseMove, 100, 100, 1 ;

	MC(1, 259, 236, 500) ; 
	checkforguard() ;
	mouseMove, 100, 100, 1 ;

	MC(1, 230, 209, 500) ; 
	checkforguard() ;
	mouseMove, 100, 100, 1 ;
}	

checkforguard(){ 
	coordMode,window
	ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, afk.PNG
		if (ErrorLevel = 2)
		{
			send, er2 ;
		}
		else if (ErrorLevel = 1)
		{
			sleep 1000 ;
		}
		else
		{
			MC(0, FoundX, FoundY, 1000) ;
		}
}


MC(button, x, y, sleepTime){ ; button=0 left click, button=1 right click
        MouseMove, x, y ;
        sleep 100 ;
        if(button=0){
            click, x, y ;
        }
        else if(button=1){
            click, right, x, y ;
        }
    	sleep sleepTime ;
}



F1::Start() ;