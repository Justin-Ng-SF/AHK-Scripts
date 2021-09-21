#SingleInstance force ; starts even if another ahk is running

Esc::ExitApp  ;

; turn off autoretaliate, combat button 545, 212         auto retal 649, 408
; reset screen after each tp
;use the right click box as a picture to check tunnels



Start(){
    Loop 100{
tunnel() ;



	}
return
}

autoOn(){
    click, 545, 212 ; combat tab
    sleep 750 ;
    click, 649, 408 ; auto retal
    sleep 750 ;
    click, 649, 408 ; click auto retal again because server usually shows it as off


}

autoOff(){
    click, 545, 212 ; combat tab
    sleep 750 ;
    click, 649, 408 ; auto retal
    sleep 750 ;
    click, 649, 408 ; click auto retal again because server usually shows it as off


    if(autoOff){
        coordMode,pixel
        ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, autoOn.PNG
            if (ErrorLevel = 2)
            {
                send, /error checking auto ; if picture not found?
                send, {enter} ;
            }
            else if (ErrorLevel = 1)
            {
                return ;
            }
            else{
                click, 649, 408 ; auto retal
                sleep 750 ;
            }

    }


}

bank(){
    click, 669, 158 ; walk to bank from edge tp spot
    sleep 5000 ;
    click, 269, 232 ; use bank booth south side
    sleep 750 ;
    click, 89, 82 ;
    sleep 750 ;
    MouseMove, 200, 200 ;
	Loop 10
	{
		Send {WheelUp} ;
		sleep 25 ;
	}
	sleep 750 ;
	click, 438, 336 ;
	sleep 750 ;
	click, 52, 119 ;
	sleep 750 ;
	click, 485, 45 ;
	sleep 500 ;

    presetScreen() ;

}

presetScreen(){
	click, 556, 50 ; reset screen
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
	sleep 3000 ;
	Send {Up up} ;
}

barrowTP(){ ; teleports to barrows
	click, 743, 209 ; click spellbook
	sleep 750 ;
	click, 646, 314 ; click minigames teleport
	sleep 750 ;

	MouseMove, 393, 192 ;

	Loop 10
	{
		Send {WheelUp} ;
		sleep 25 ;
	}

	click, 393, 192 ; click barrows teleport
	sleep 3500 ;
}

heal(){
	click, 743, 209 ; click spellbook
	sleep 750 ;
	click, 572, 263 ; click edgeville teleport
	sleep 3500 ;
	click, 336, 155 ; heal aabla
	sleep 1500 ;
	click, 377, 188 ; pray
	sleep 1250 ;
}

tunnel(){
	send, / ;
	send, {space} ; next dialogue
	sleep 1000 ;
	send, /1 ; go down tunnel
	sleep 3000 ;

	;----walk in a circle
	click, 265, 231 ;
	sleep 2000 ;
    click, 300, 197 ;
    sleep 2000 ;
    click, 266, 163 ;
    sleep 2000 ;
    click, 230, 194 ;
    sleep 2000 ;


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
								    send, nw ;
								    MoveNW() ;
								}
						}
						else
						{
						send, sw ;
						MoveSW() ;
						}
				}
				else
				{
				    send, ne ;
				    MoveNE() ;
				}
		}
		else
		{
		    send, se ;
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
}

dharok(){
    barrowTP() ;
    presetScreen() ;
	click, 680, 174 ; walk to top of dharok
	sleep 5000 ;
	click, 645, 212 ; select inventory
	sleep 750 ;
	click, 581, 255 ; use spade, first item of inventory
	sleep, 1500 ;
	click, 221, 325 ; click on dharok tomb to fight
	sleep 2000 ;

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
			click, 562, 129 ; turn on quick prayers
			sleep 30000 ;
			click, 562, 129 ; turn off quick prayers
			dharok := true ;
			heal() ;
		}
		else
		{
            tunnel() ;
            click, 262, 145 ; attempt to open chest
            sleep 500 ;
            click, 562, 129 ; turn on quick prayers
            sleep 30000 ;
            click, 562, 129 ; turn off quick prayers
            click, 262, 145 ; loot chest
            sleep 750 ;
            heal() ;
            bank() ;
		}
}

guthan(){
    barrowTP() ;
    presetScreen() ;
	click, 680, 174 ; walk to top of dharok
	sleep 6000 ;
	click, 657, 177 ; walk to top of guthan
	sleep 5000 ;
	click, 645, 212 ; select inventory
	sleep 750 ;
	click, 581, 255 ; use spade, first item of inventory
	sleep, 1500 ;
	click, 433, 198 ; click on guthans tomb to fight
	sleep 2000 ;

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
			click, 562, 129 ; turn on quick prayers
			sleep 30000 ;
			click, 562, 129 ; turn off quick prayers
			guthan := true ;
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
			click, 562, 129 ; turn on quick prayers
			sleep 30000 ;
			click, 562, 129 ; turn off quick prayers
			torag := true ;
			heal() ;
		}
		else
		{
            tunnel() ;
            click, 262, 145 ; attempt to open chest
            sleep 500 ;
            click, 562, 129 ; turn on quick prayers
            sleep 30000 ;
            click, 562, 129 ; turn off quick prayers
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
	click, 645, 212 ; select inventory
	sleep 500 ;
	click, 581, 255 ; use spade, first item of inventory
	sleep, 1500 ;
	click, 101, 188 ; click on veracs tomb to fight
	sleep 2000 ;

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
			click, 562, 129 ; turn on quick prayers
			sleep 30000 ;
			click, 562, 129 ; turn off quick prayers
			verac := true ;
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

karil(){
    barrowTP() ;
    presetScreen() ;
	click, 647, 184 ; walk down
	sleep 7000 ;
	click, 647, 184 ; walk to top of karil
	sleep 7000 ;
	click, 645, 212 ; select inventory
	sleep 750 ;
	click, 581, 255 ; use spade, first item of inventory
	sleep, 1500 ;
	click, 440, 219 ; click on karil tomb to fight
	sleep 2000 ;

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
			sleep 30000 ;
			click, 646, 362 ; turn off protect from range
			sleep 750 ;
			click, 610, 434 ; turn off piety
			karil := true ;
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
            sleep 30000 ;
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
	click, 645, 212 ; select inventory
	sleep 750 ;
	click, 581, 255 ; use spade, first item of inventory
	sleep, 1500 ;
	click, 215, 311 ; click on ahrim tomb to fight
	sleep 2000 ;

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
			click, 653, 113 ; walk infront of ahrim
			sleep 30000 ;
			click, 607, 362 ; turn off protect from mage
			sleep 750 ;
			click, 610, 434 ; turn off piety
			:= true ;
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

`::Start()








