#SingleInstance force ;
/*
readme
*/
Esc::ExitApp ;
F1::Start() ;
F2::Test() ;


; natures only,
; make sure first quick teleport in skills is natures
; order of quick tele's are organized alphebetical
; make sure spellbook is open, normal spells
Start(){
    Global runs := 1000 ;
        afkcheck() ;
    ; Loop %runs%{
    ;     send, ::meet {enter} ;
    ;     sleep 4000 ;
    ;     l(144, 191) ; click banker
    ;     sleep 2000 ; waiting to walk
    ;     l(404, 332) ; bank all 
    ;     lr(321, 277, 354) ; withdraw all
    ;     l(491, 57) ; exit bank
    ;     l(669, 313) ; skilling tp
    ;     sleep 1000 ;
    ;     l(341, 311) ; tp last place
    ;     sleep 4000 ;
    ;     l(302, 201) ;
    ;     afkcheck() ;
    ; }
    return ;

}

Test(){
	send, r ;
}

afkcheck() { ; checks if an npcs is with 1 sq radius
	coordMode,window
	ImageSearch, FoundX, FoundY, 641, 106, 655, 122, npcdot.PNG
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
    	sleep 500 ;
}

r(x, y){ ; button=0 left click, button=1 right click
        MouseMove, x, y ;
        sleep 100 ;
        click, right, x, y ;
    	sleep 1000 ;
}

lr(x, y1, y2){ ; button=0 left click, button=1 right click
        MouseMove, x, y1 ;
        sleep 100 ;
        click, right, x, y1 ;
        sleep 300 ;
        MouseMove, x, y2 ;
        sleep 100 ;
        click, x, y2 ;
    	sleep 300 ;

}



PresetScreen(){
    MouseClick(0, 565, 50, 100) ; minimap compass

	MouseMove, 200, 200 ;
	sleep 50 ;
	Loop 14
	{
		Send {WheelUp} ;
		sleep 50 ;
	}
	Loop 4
	{
		Send {WheelDown} ;
		sleep 50 ;
	}
	Send {Up down} ; move screen up
	sleep 2500 ;
	Send {Up up} ;
}

CheckImage(roomName, errorMsg, screenShot){
    coordMode,pixel
    ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %screenShot%
        if (ErrorLevel = 2)
        {
            send, /error level 2 %roomName% ;
            send, {enter} ;
            return 0 ;
        }
        else if (ErrorLevel = 1)
        {
            send, %errorMsg% ;
            return 0 ;
        }
        else
        {
            return 1 ;
        }
}


MouseClick(button, x, y, sleepTime){
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

Item(item){
    if(item=1){
        MouseClick(0, 580, 255, 0) ;
    }
    if(item=2){
        MouseClick(0, 625, 255, 0) ;
    }
    if(item=3){
        MouseClick(0, 660, 255, 0) ;
    }
    if(item=4){
        MouseClick(0, 710, 255, 0) ;
    }
    if(item=5){
        MouseClick(0, 580, 290, 0) ;
    }
    if(item=6){
        MouseClick(0, 625, 290, 0) ;
    }
    if(item=7){
        MouseClick(0, 660, 290, 0) ;
    }
    if(item=8){
        MouseClick(0, 710, 290, 0) ;
    }
    if(item=9){
        MouseClick(0, 580, 325, 0) ;
    }
    if(item=10){
        MouseClick(0, 625, 325, 0) ;
    }
    if(item=11){
        MouseClick(0, 660, 325, 0) ;
    }
    if(item=12){
        MouseClick(0, 710, 325, 0) ;
    }
    if(item=13){
        MouseClick(0, 580, 365, 0) ;
    }
    if(item=14){
        MouseClick(0, 625, 365, 0) ;
    }
    if(item=15){
        MouseClick(0, 660, 365, 0) ;
    }
    if(item=16){
        MouseClick(0, 710, 365, 0) ;
    }
    if(item=17){
        MouseClick(0, 580, 400, 0) ;
    }
    if(item=18){
        MouseClick(0, 625, 400, 0) ;
    }
    if(item=19){
        MouseClick(0, 660, 400, 0) ;
    }
    if(item=20){
        MouseClick(0, 710, 400, 0) ;
    }
    if(item=21){
        MouseClick(0, 580, 435, 0) ;
    }
    if(item=22){
        MouseClick(0, 625, 435, 0) ;
    }
    if(item=23){
        MouseClick(0, 660, 435, 0) ;
    }
    if(item=24){
        MouseClick(0, 710, 435, 0) ;
    }
    if(item=25){
        MouseClick(0, 580, 470, 0) ;
    }
    if(item=26){
        MouseClick(0, 625, 470, 0) ;
    }
    if(item=27){
        MouseClick(0, 660, 470, 0) ;
    }
    if(item=28){
        MouseClick(0, 710, 470, 0) ;
    }

}

