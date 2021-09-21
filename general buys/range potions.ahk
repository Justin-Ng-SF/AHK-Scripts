#SingleInstance force ; starts even if another ahk is running

Esc::ExitApp  ;

; turn off autoretaliate, combat button 545, 212         auto retal 649, 408
; reset screen after each tp
;use the right click box as a picture to check tunnels



Start(){

    Loop 100{
        click, 743, 209 ; click spellbook
        sleep 250 ;
        click, 572, 263 ; click edgeville teleport
        sleep 3500 ;

        MouseMove, 613, 78 ;
        sleep 100 ;
        Click, 613, 78 ; walk in general store
        sleep 6000 ;

        MouseMove, 200, 179 ;
        sleep 100 ;
        Click 200, 179 ; talk/trade chef
        sleep 500 ;

    	Loop 20
    	{
    		Send {WheelUp} ; scroll shop up
    		sleep 25 ;
    	}


        MouseMove, 230, 100 ;
        sleep 100 ;
        Click, right, 230, 100 ; right click range potions
        sleep 100 ;

        MouseMove, 230, 185 ;
        sleep 100 ;
        Click, 230, 185 ; buy x range potions
        sleep 750 ;

        Send, /27 ;
        Send {Enter} ;

        MouseMove, 496, 54 ;
        sleep 100 ;
        Click, 496, 54 ; close shop
        sleep 100 ;

        MouseMove, 743, 209 ;
        sleep 100 ;
        click, 743, 209 ; click spellbook
        sleep 250 ;

        MouseMove, 572, 410 ;
        sleep 100 ;
        click, 572, 410 ; skillers teleport
        sleep 750 ;

        MouseMove, 394, 98 ;
        sleep 100 ;
        click, 394, 98 ; teleport to lands end
        sleep 3500 ;

        MouseMove, 436, 95 ;
        sleep 100 ;
        click, 436, 95 ; use deposit box
        sleep 2000 ;

        MouseMove, 575, 474 ;
        sleep 100 ;
        click, right, 575, 474 ; right click rings
        sleep 100 ;
        click, 575, 474 ; deposit all rings
        sleep 100 ;

        MouseMove, 485, 43 ;
        sleep 100 ;
        click, 485, 43 ; use deposit box
        sleep 500 ;


	}
return
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



`::Start()








