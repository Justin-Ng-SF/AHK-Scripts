#SingleInstance force ; starts even if another ahk is running

Esc::ExitApp  ;

; turn off autoretaliate, combat button 545, 212         auto retal 649, 408
; reset screen after each tp
;use the right click box as a picture to check tunnels



Start()
{
    Loop 100
    {
        torag := 0 ;
        verac := 0 ;
        dharok := 0 ;
        guthan := 0 ;
        ahrim := 0 ;
        karil := 0 ;


        MouseClick(0, 545, 215, 500) ; combat tab
        if(CheckImage("Vanguard", "", "autoOff.PNG")=1){
            MouseClick(0, 654, 408, 500) ; turn on auto retaliate
        }

        verac() ;
        torag() ;
        karil() ;
        ahrim() ;
        guthan() ;
        dharok() ;


	}
    return
}

tunnel()
{
	send, / ;
	send, {space} ; next dialogue
	sleep 1000 ;
	send, /1 ; go down tunnel
	sleep 3000 ;

	;----walk in a circle
    MouseClick(0, 265, 231, 2000) ;
	MouseClick(0, 300, 197, 2000) ;
    MouseClick(0, 266, 163, 2000) ;
    MouseClick(0, 230, 194, 2000) ;

    MouseClick(0, 545, 215, 500) ; combat tab
    if(CheckImage("Vanguard", "", "autoOff.PNG")=0){
        MouseClick(0, 654, 408, 500) ; turn off auto retaliate
    }




	coordMode,pixel
	ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, pics/se.PNG
		if (ErrorLevel = 2)
		{
			send, /error! sse ;
			send, {enter} ;
		}
		else if (ErrorLevel = 1)
		{
			coordMode,pixel
			ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, pics/ne.PNG
				if (ErrorLevel = 2)
				{
					send, /error! ssw ;
					send, {enter} ;
				}
				else if (ErrorLevel = 1)
				{
					coordMode,pixel
					ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, pics/sw.PNG
						if (ErrorLevel = 2)
						{
							send, /error! nne ;
							send, {enter} ;
						}
						else if (ErrorLevel = 1)
						{
							coordMode,pixel
							ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, pics/nw.PNG
								if (ErrorLevel = 2)
								{
									send, /error! nnw ; if picture not found?
									send, {enter} ;
								}
								else if (ErrorLevel = 1)
								{
									send, /error picture not found ;
									send, {enter} ;
								}
								else
								{
								    MoveNW() ;
								}
						}
						else
						{
						MoveSW() ;
						}
				}
				else
				{
				    MoveNE() ;
				}
		}
		else
		{
		    MoveSE() ;
		}
}

MoveNE(){
; northeast
    click, 11, 222 ;
    sleep 5000 ;
    click, 79, 188 ;
    sleep 2500 ;
    Send {Right down} ; move minimap
    sleep 750 ;
    Send {Right up} ;
    sleep 750 ;
    click, 7, 85 ; click on south door
    sleep 4500 ;
    click, 90, 205 ; click second door
    presetScreen() ;
    click, 175, 346 ; move down
    sleep 3500 ;
    click, 368, 258 ; move infront of chest
    sleep 3500 ;
    MouseClick(0, 545, 215, 500) ; combat tab

    if(CheckImage("Vanguard", "", "autoOff.PNG")=1){
        MouseClick(0, 654, 408, 500) ; turn on auto retaliate
    }
}

MoveSW(){
; southwest
    click, 505, 133 ; use east door ;
    sleep 4500 ;
    click, 430, 162 ; use second door
    sleep 2500 ;
    click, 467, 28 ; use north door ;
    sleep 4500 ;
    click, 265, 49 ; use second door
    sleep 2500 ;
    click, 271, 30 ; move infront of chest
    sleep 3500 ;
    MouseClick(0, 545, 215, 500) ; combat tab
    if(CheckImage("Vanguard", "", "autoOff.PNG")=1){
        MouseClick(0, 654, 408, 500) ; turn on auto retaliate
    }
}

MoveNW(){
    ; northwest
    click, 505, 185 ; click east door
    sleep 4500 ;
    click, 430, 193 ; click second door
    sleep 2500 ;
    Send {Left down} ; move minimap
    sleep 750 ;
    Send {Left up} ;
    sleep 750 ;
    click, 504, 95 ; click on south door
    sleep 4500 ;
    click, 421, 245 ; click second door

    presetScreen() ;
    click, 175, 346 ; move down
    sleep 3500 ;
    click, 368, 258 ; move infront of chest
    sleep 3500 ;
    MouseClick(0, 545, 215, 500) ; combat tab
    if(CheckImage("Vanguard", "", "autoOff.PNG")=1){
        MouseClick(0, 654, 408, 500) ; turn on auto retaliate
    }
}

MoveSE(){
    ; southeast
    click, 261, 28 ; go to north door
    sleep 4500 ;
    click, 263, 170 ; use north door
    sleep 2000 ;
    click, 220, 47 ; use second door
    sleep 2500 ;
    click, 67, 31 ; use east door ;
    sleep 4000 ;
    click, 85, 184 ; use second door
    sleep 3000 ;
    click, 63, 184 ; walk infront of chest
    sleep 3000 ;
    MouseClick(0, 545, 215, 500) ; combat tab
    if(CheckImage("Vanguard", "", "autoOff.PNG")=1){
        MouseClick(0, 654, 408, 500) ; turn on auto retaliate
    }
}

dharok(){
    barrowTP() ;
    presetScreen() ;
	MouseClick(0, 680, 174, 5000) ; walk to top of dharok
	MouseClick(0, 645, 215, 750) ; inventory
	Item(1) ;
	sleep 1500 ;
	MouseClick(0, 221, 325, 2000) ; click on dharok tomb to fight

    if(CheckImage("Dharoks","", "alreadySearched.PNG"))
    {
        return ;
    }

	coordMode,pixel
	ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%,tunnel.PNG
		if (ErrorLevel = 2)
		{
			send, /error at dharok ;
			send, {enter} ;
			barrowTP() ;
		}
		else if (ErrorLevel = 1)
		{
			MouseClick(0, 562, 129, 100) ; turn on quick prayers
            Fight("Dharoks", "dharoksDead.PNG", 3000) ;
			MouseClick(0, 562, 129, 100) ; turn off quick prayers
			dharok := 1 ;
			heal() ;
		}
		else
		{
            tunnel() ;
            MouseClick(0, 262, 145, 500) ;
            click, 262, 145 ; attempt to open chest
			MouseClick(0, 562, 129, 100) ; turn on quick prayers
            Fight("Dharoks", "dharoksDead.PNG", 3000) ;
			MouseClick(0, 562, 129, 100) ; turn off quick prayers
            MouseClick(0, 262, 145, 750) ; loot chest
            heal() ;
            bank() ;
		}
}

guthan(){
    barrowTP() ;
    presetScreen() ;
	MouseClick(0, 680, 174, 6000) ; walk to top of dharok
	MouseClick(0, 657, 177, 5000) ; walk to top of guthan
	MouseClick(0, 645, 215, 750) ; inventory
	Item(1) ;
	sleep 1500 ;
	MouseClick(0, 433, 198, 2000) ; click on guthans tomb to fight

    if(CheckImage("Guthans","", "alreadySearched.PNG"))
    {
        return ;
    }

	coordMode,pixel
	ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%,tunnel.PNG
		if (ErrorLevel = 2)
		{
			send, /error at guthan ;
			send, {enter} ;
			barrowTP() ;
		}
		else if (ErrorLevel = 1)
		{
			MouseClick(0, 562, 129, 100) ; turn on quick prayers
			Fight("Guthans", "guthansDead.PNG", 3000) ;
			MouseClick(0, 562, 129, 100) ; turn off quick prayers
			guthan := 1 ;
			heal() ;
		}
		else
		{
            tunnel() ;
            click, 262, 145 ; attempt to open chest
            sleep 750 ;
            click, 562, 129 ; turn on quick prayers
            sleep 30000 ;
            click, 562, 129 ; turn off quick prayers
            click, 262, 145 ; loot chest
            sleep 750 ;
            heal() ;
            bank() ;
		}
}

torag(){
    barrowTP() ;
    presetScreen() ;
	click, 647, 185 ; walk down
	sleep 7000 ;
	click, 611, 169 ; walk to top of torag
	sleep 6500 ;
	click, 645, 212 ; select inventory
	sleep 750 ;
	click, 581, 255 ; use spade, first item of inventory
	sleep, 1500 ;
	click, 313, 96 ; click on torags tomb to fight
	sleep 2000 ;

    if(CheckImage("Torags","", "alreadySearched.PNG"))
    {
        return ;
    }

	coordMode,pixel
	ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%,tunnel.PNG
		if (ErrorLevel = 2)
		{
			send, /error at torag ;
			send, {enter} ;
			barrowTP() ;
		}
		else if (ErrorLevel = 1)
		{
			MouseClick(0, 562, 129, 100) ; turn on quick prayers
			Fight("Torags", "toragsDead.PNG", 3000) ;
			MouseClick(0, 562, 129, 100) ; turn off quick prayers
			torag := 1 ;
			heal() ;
		}
		else
		{
            tunnel() ;
            click, 262, 145 ; attempt to open chest
            sleep 500 ;
            MouseClick(0, 562, 129, 100) ; turn on quick prayers
			Fight("Torags", "toragsDead.PNG", 3000) ;
			MouseClick(0, 562, 129, 100) ; turn off quick prayers
            click, 262, 145 ; loot chest
            sleep 750 ;
            heal() ;
            bank() ;
		}
}

verac(){
    barrowTP() ;
    presetScreen() ;
	click, 617, 174 ; walk to top of verac
	sleep 6000 ;
	MouseClick(0, 645, 215, 750) ; inventory
	Item(1) ;
	sleep 1500 ;
	click, 101, 188 ; click on veracs tomb to fight
	sleep 2000 ;

    if(CheckImage("Torags","", "alreadySearched.PNG"))
    {
        return ;
    }

	coordMode,pixel
	ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%,tunnel.PNG
		if (ErrorLevel = 2)
		{
			send, /error at verac ;
			send, {enter} ;
			barrowTP() ;
		}
		else if (ErrorLevel = 1)
		{
			MouseClick(0, 562, 129, 100) ; turn on quick prayers
			Fight("Veracs", "veracsDead.PNG", 3000) ;
			MouseClick(0, 562, 129, 100) ; turn off quick prayers
			verac := 1 ;
			heal() ;
		}
		else
		{
            tunnel() ;
            click, 262, 145 ; attempt to open chest
            sleep 750 ;
			MouseClick(0, 562, 129, 100) ; turn on quick prayers
			Fight("Veracs", "veracsDead.PNG", 3000) ;
			MouseClick(0, 562, 129, 100) ; turn off quick prayers
            click, 262, 145 ; loot chest
            sleep 750 ;
            heal() ;
            bank() ;
		}
}

karil(){
    barrowTP() ;
    presetScreen() ;
	click, 647, 184 ; walk down
	sleep 7000 ;
	click, 647, 184 ; walk to top of karil
	sleep 7000 ;
	MouseClick(0, 645, 215, 750) ; inventory
	Item(1) ;
	sleep 1500 ;
	click, 440, 219 ; click on karil tomb to fight
	sleep 2000 ;

    if(CheckImage("Karils","", "alreadySearched.PNG"))
    {
        return ;
    }

	coordMode,pixel
	ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%,tunnel.PNG
		if (ErrorLevel = 2)
		{
			send, /error at karil ;
			send, {enter} ;
			barrowTP() ;
		}
		else if (ErrorLevel = 1)
		{
			click, 712, 212 ; open prayer tab
			sleep 750 ;
			click, 646, 362 ; turn on protect from range
			sleep 750 ;
			click, 610, 434 ; turn on piety
			Fight("Karils", "karilsDead.PNG", 3000) ;
			click, 646, 362 ; turn off protect from range
			sleep 750 ;
			click, 610, 434 ; turn off piety
			karil := 1 ;
			heal() ;
		}
		else
		{
            tunnel() ;
            click, 262, 145 ; attempt to open chest
            sleep 750 ;
            click, 712, 212 ; open prayer tab
            sleep 750 ;
            click, 646, 362 ; turn on protect from range
            sleep 750 ;
            click, 610, 434 ; turn on piety
			Fight("Karils", "karilsDead.PNG", 3000) ;
            click, 646, 362 ; turn off protect from range
            sleep 750 ;
            click, 610, 434 ; turn off piety
            click, 262, 145 ; loot chest
            sleep 750 ;
            heal() ;
            bank() ;
 		}
}

ahrim(){
    barrowTP() ;
    presetScreen() ;
	click, 647, 184 ; walk down
	sleep 7000 ;
	click, 647, 132 ; walk to top of ahrim
	sleep 3000 ;
	MouseClick(0, 645, 215, 750) ; inventory
	Item(1) ;
	sleep 1500 ;
	click, 215, 311 ; click on ahrim tomb to fight
	sleep 2000 ;

    if(CheckImage("Ahrims","", "alreadySearched.PNG"))
    {
        return ;
    }

	coordMode,pixel
	ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%,tunnel.PNG
		if (ErrorLevel = 2)
		{
			send, /error at ahrim ;
			send, {enter} ;
			barrowTP() ;
		}
		else if (ErrorLevel = 1)
		{
			click, 712, 212 ; open prayer tab
			sleep 750 ;
			click, 607, 362 ; turn on protect from mage
			sleep 750 ;
			click, 610, 434 ; turn on piety
			sleep 750 ;
			Fight("Ahrims", "ahrimsDead.PNG", 3000) ;
			click, 607, 362 ; turn off protect from mage
			sleep 750 ;
			click, 610, 434 ; turn off piety
			ahrim := 1 ;
			heal() ;
		}
		else
		{
            tunnel() ;
            click, 262, 145 ; attempt to open chest
            sleep 750 ;
            click, 712, 212 ; open prayer tab
            sleep 750 ;
            click, 607, 362 ; turn on protect from mage
            sleep 750 ;
            click, 610, 434 ; turn on piety
            sleep 30000 ;
            click, 607, 362 ; turn off protect from mage
            sleep 750 ;
            click, 610, 434 ; turn off piety
            click, 262, 145 ; loot chest
            sleep 750 ;
            heal() ;
            bank() ;
		}
}


barrowTP(){ ; teleports to barrows
    MouseClick(0, 743, 209, 750) ; click spellbook

	MouseClick(0, 646, 314, 750) ; click minigames teleport

	MouseMove, 224, 241 ;

	Loop 10
	{
		Send {WheelUp} ;
		sleep 25 ;
	}

	MouseClick(0, 224, 241, 3500) ; click barrows teleport
}

heal(){
    MouseClick(0, 743, 209, 750) ; click spellbook

	MouseClick(0, 572, 263, 3500) ; click edgeville teleport

	MouseClick(0, 336, 155, 1500) ; heal aabla

	MouseClick(0, 377, 188, 1250) ; pray
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

Fight(monster, deadMonsterPic, fightTime){
    ; for simple easy to kill monsters
    timeExceeded := 0 ;
    while(!CheckImage(monster, "", deadMonsterPic)){
        sleep 100() ;
        timeExceeded++ ;
        if(timeExceeded=fightTime/10){
            send, /timed out %monster% {enter} ;
            return 1 ; returns after "fightTime"/10 seconds
        }
    }
    return ;
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

bank(){
    MouseClick(0, 669, 158, 5000) ;walk to bank from edge tp spot
    MouseClick(0, 269, 232, 750) ;use bank booth south side
    MouseClick(0, 89, 82, 750) ; first tab of bank

    MouseMove, 200, 200 ;
	Loop 10
	{
		Send {WheelUp} ;
		sleep 25 ;
	}
	sleep 750 ;
	MouseClick(0, 438, 336, 750) ;
	MouseClick(0, 52, 119, 750) ;
	MouseClick(0, 485, 45, 500) ;

    presetScreen() ;

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






`::Start()








