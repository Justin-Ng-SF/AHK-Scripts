#SingleInstance force ; closes previous instances of script

Esc::ExitApp ;

Start(){
	


	loop 100 {
		l(268, 170) ; use bank booth north of me
		l(402, 331) ; bank all
		l(144, 126) ; withdraw needle
		l(189, 123) ; widthdraw thread
		MC(1, 59, 128, 500) ; rigthclick leather
		l(59, 205) ; withdraw all leather
		l(492, 56) ; close bank
		l(583, 256) ; select item 0, 0
		l(583, 296) ; select item 0, 1
		MC(1, 260, 417, 500) ; right click make leather
		l(260, 492) ; make all
		loop 21 {
			afkcheck() ;
			sleep 2000 ;
		}		
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
			sleep 1000 ;
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
    	sleep 600 ;
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