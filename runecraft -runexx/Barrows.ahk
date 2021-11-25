#SingleInstance force ;
CoordMode,Mouse, Client
CoordMode,Pixel, Client



1::GroupMethod()
2::RestoreHpByNurse()
3::ExitApp


GroupMethod(){
	Global runs := 1 ;

	Loop runs
	{
		RestoreHpByNurse()
		TelePortToBarrows()
		Sleep 5000
		Dharok()
		Sleep 5000
		Verac()
		Sleep 5000
		Torag()
		Sleep 5000
		Karil()
		Sleep 5000
		Guthan()
		Sleep 5000
		Ahrims() 
	}
}



  





TelePortToBarrows(){
;Click SpellBook
MouseClick, Left,749 ,213, 1, 	
Sleep, 600
;Click MiniGameTeleport
; For Ancient MouseClick, Left , 714, 336 ,1
l(643,361)  ; For Standard
Sleep, 600
;Click Barrows
MouseClick, Left, 388 , 168, 1 
Sleep, 600
;Click Teleport
l(418,325)
;Clisk Inventory 
MouseClick, Left, 646, 207
}


RestoreHpByNurse(){
;Click SpellBook
l(749 ,213)
Sleep,600
;Click Trianing Teleport
; l(667,274)  For Ancient Magic
l(670,305)
Sleep,600
;Click Construction
l(167,190)
Sleep,600
;Click Home Portal
l(298,103)
Sleep, 7000
;Click MiniMap
l(691,106)
Sleep,6000
;Click Nurse
l(317,240)
;Click Prayer Icon
l(723,100)
l(723,100)

}





Dharok(){
	l(667,149)  ;Tile 1
	Sleep,4000  
	l(385,215)  ;Tile 2
	Sleep,1000
	clickSpade()
	Sleep,5000
	clickPrayerIcon()
	clickProtectMelee()
	;Click Coffin
	l(247,272)
	Sleep,1000
	;Walk down for brother to hit.
	l(240,299)
	Sleep,8000
	checkIfBrotherIsDead()  ; If brother is dead restore hp
}  

Verac(){
	;Tile 1
	l(47,338) 
	Sleep,3000
	;Tile 2
	l(191,250)
    Sleep,1000	
	clickSpade()
	Sleep,5000
	clickPrayerIcon()
	clickProtectMelee()
	;click Coffin
	l(148,200)
	Sleep,9000
	
	checkIfBrotherIsDead()
	
	
}

Torag(){
	;tile 1
	l(614,142)
	Sleep,4000
	;tile 2
	l(645,183)
	Sleep,8000
	clickSpade()
	
	Sleep,4000
	clickPrayerIcon()
	clickProtectMelee()
	
	;Click Coffin
	l(300,120)
	Sleep,7000
	checkIfBrotherIsDead()
}

Karil(){
 l(645,183)  ; Tile 1
 Sleep,10000
 l(650,181)   ;  Tile 2
 Sleep,10000
 Item(4)     ; Spade 
 Sleep,4000 
 clickPrayerIcon()
 Sleep,1000
 clickProtectFromRange()
 ;click coffin 
 l(380,210)
 Sleep,5000 
 ; But its just a loadout buttom
 checkIfBrotherIsDead()
 
}

Ahrims(){
l( 645,183)  ; tile 1
Sleep,8000
Item(4)   ; click deh spade
Sleep,5000
clickPrayerIcon()
Sleep,3000
clickProtectFromMage()
l( 258, 169 ) ; Click chest
Sleep,5000


loop{
	;Check if brother is dead for me
	PixelSearch, Fx,Fy, 13,69,19,83,0x119800, 50 , Fast
	if(ErrorLevel = 0) {
	  ; DO nothing	
	}	
	if (ErrorLevel = 1 ){
	 Sleep,3000
	l( 258, 169 ) ;Click the chest again for reward
	RestoreHpByNurse()
	 break
	}
}
}
Guthan(){
l(676,152)  ; Tile 1
Sleep,6000 
l( 659, 171) ; Tile 2  
Sleep,8000
l( 336, 262) ; Tile 3 
Sleep,2000
Item(4)  ; Click Spade
Sleep,3000
clickPrayerIcon()
clickProtectMelee()
l( 399 , 204 ) ;Click Coffin
Sleep,9000
checkIfBrotherIsDead()


}

l(x,y ){
	MouseClick ,Left , x, y, 1 
}

r(x,y ){
	MouseClick ,Right , x, y, 1 
}

checkIfBrotherIsDead(){
	loop{
	;Check if brother is dead for me
	PixelSearch, Fx,Fy, 13,69,19,83,0x119800, 50 , Fast
	if(ErrorLevel = 0) {
	  ; DO nothing	
	}	
	if (ErrorLevel = 1 ){
	 Sleep,3000
	 RestoreHpByNurse()
	 TelePortToBarrows()
	 break
	}
}
}

clickSpade(){	
	;Click Spade
	l(707,261)
}
clickPrayerIcon(){
	;Click PrayerIcon
	l(710,209)
	Sleep,600
	;Click Mystic Might
	l(575,393)
}
clickProtectMelee(){
	
	;Click Protect From Melee
	l(674,362)
}
clickProtectFromRange(){
l(640,357)	
}


clickProtectFromMage(){
	l(604,359)
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
























































afkcheck() { ; checks if an npcs is with 1 sq radius
	coordMode,window
	ImageSearch, FoundX, FoundY, 643, 108, 653, 118, npcdot.PNG
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
			ac() ;
		}
}	

ac() { ; checks if afk guard is on you
	sleep 2000 ;
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


`::Start() ;
Pause::Pause ;
