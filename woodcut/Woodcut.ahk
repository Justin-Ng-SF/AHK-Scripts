#SingleInstance force ; closes previous instances of script

Esc::ExitApp ;

Start(){
	l(745, 213) ;click spellbook
	l(669, 312) ; click skilling tp
	l(131, 116) ; click woodcutting
	l(290, 113) ; click seers village
	sleep 3000 ; time to finish teleport
	l(657, 86) ; walk to back booth
	sleep 8000 ; time to walk to bank from tp 
	loop 500 {
		l(268, 170) ; use bank booth north of me
		sleep 1000 ; 
		l(402, 331) ; bank all
		l(657, 169) ; walk to maple tree
		sleep 11000 ; time to walk to tree

		while(CheckImage("fullinv.PNG")=0){
			l(294, 207) ; chop tree
			afkCheck() ;
			Sleep 3000 ;
		}
		send, /. {ENTER} ;
		l(651, 73) ; walk back to bank
		sleep 11000 ;

	}	
}


afkcheck() { ; checks if an npcs is with 1 sq radius
	coordMode,window
	ImageSearch, FoundX, FoundY, 600, 50, 700, 150, npcdot.PNG
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

l(x, y){ ; button=0 left click, button=1 right click
        MouseMove, x, y ;
        sleep 100 ;
        click, x, y ;
    	sleep 1000 ;
}

CheckImage(screenShot){
    coordMode,pixel
    ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %screenShot%
        if (ErrorLevel = 2)
        {
            send, er
            return 0 ;
        }
        else if (ErrorLevel = 1)
        {
            return 0 ;
        }
        else
        {
            return 1 ;
        }
}

F1::Start() ;