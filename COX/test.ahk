
#SingleInstance force ;

Esc::ExitApp ;


Start(){


        PresetScreen() ;

        IceDemon() ;

        SkeletalMages() ;

        Tekton() ;

        Muttadile() ;

        TightRope() ;

        Trade() ;

        MouseClick(0, 743, 209, 750) ; click spellbook
        MouseClick(0, 644, 312, 750) ; minigames
        MouseClick(0, 228, 95, 3500) ; raids 1 tp

    return ;
}


IceDemon(){
;=====================ice demon room==========================

    while(CheckImage("Ice Demon", "", "jstaznIceDemonDead.PNG")=0){
        sleep 50 ;
    }
    MouseClick(0, 192, 63, 6000) ; enter ice demon room

    sleep 110000 ; must wait 2 minutes for items to show
    send, /passing ice demon {enter} ;
    MouseClick(0, 635, 50, 10000) ; fix position
    MouseClick(0, 641, 89, 8500) ; walk to death spot
    PickUp() ;
    MouseClick(0, 338, 60, 5000) ; enter next room
}

SkeletalMages(){
;==================== skeletal mage room====================================
    MouseClick(0, 661, 60, 5000) ; walk towards next entrance
    MouseClick(0, 673, 60, 6000) ;
    MouseClick(0, 274, 129, 3000) ; walk infront of entrance
    MouseClick(0, 273, 87, 6000) ; enter next room
    MouseClick(0, 667, 40, 5000) ; enter next room
    while(CheckImage("Skeletal Mages", "", "jstaznSkeletalMagesDead.PNG")=0){
        sleep 50 ;
    }
    sleep 120000 ; must wait 2 minutes for items to show
    send, /passing skeletons {enter} ;
    MouseClick(0, 628, 42, 8000) ; walk to front of skeletal mage room
    MouseClick(0, 673, 70, 8000) ; walk to 2nd skeletal death spot
    Pickup() ;
    MouseClick(0, 625, 126, 6000) ; walk to 1st skeletal death spot
    Pickup() ;
    MouseClick(0, 612, 94, 8000) ; third skeletal death spot
    Pickup() ;
    MouseClick(0, 673, 64, 10000) ; walk to front of tekton entrance

}
Tekton(){
;===================tekton room=============================
    while(CheckImage("Tekton", "", "jstaznTektonDead.PNG")=0){
        sleep 50 ;
    }


    sleep 120000 ; must wait 2 minutes for items to show
    send, /passing tekton {enter} ;
    MouseClick(0, 263, 134, 5000) ; enter tekton room
    MouseClick(0, 648, 73, 5000) ; walk towards deathspot
    MouseClick(0, 645, 105, 5000) ; walk on tekton death spot
    Pickup() ;
    MouseClick(0, 654, 65, 8000) ; walk towards muttadile room
    MouseClick(0, 646, 80, 8000) ; walk towards muttadile room




}
Muttadile(){
;=========mutadile room=======================================
/*
    while(CheckImage("Muttadile", "", "jstaznMuttadileDead.PNG")=0){
        sleep 50 ;
    }
    send, /passing muttadile {enter} ;
    ; sleep 120000 ; must wait 2 minutes for items to show
    MouseClick(0, 248, 128, 5000) ; enter muttadile room
    MouseClick(0, 641, 48, 5000) ; walk towards next room
    MouseClick(0, 650, 60, 6000) ; walk towards next room
    MouseClick(0, 256, 115, 3000) ; enter rightrope room
*/
    while(CheckImage("Deathly Rangers", "", "jstaznDeathlyRangersDead.PNG")=0){
        sleep 50 ;
    }

    send, /passing muttadile {enter} ;
    MouseClick(0, 248, 128, 5000) ; enter muttadile room
    MouseClick(0, 641, 48, 5000) ; walk towards next room
    MouseClick(0, 650, 60, 6000) ; walk towards next room
    MouseClick(0, 256, 115, 3000) ; enter rightrope room


    send, /passing tightrope room {enter} ;
}


TightRope(){

;=============== tightrope room=================================================
    MouseClick(0, 646, 58, 5000) ; walk towards deathly mages
    MouseClick(0, 656, 44, 6000) ; walk to front of healing room
    MouseClick(0, 254, 143, 3000) ; enter healing room
}
Trade(){
    MouseClick(1, 262, 188, 2000) ; right click to check if jstazn is present
    if(CheckImage("trade", "/jstazn not found", "tradeJstAzn.PNG")=1){
        send, /trading {enter} ;
        MouseClick(0, 262, 241, 1000) ;
    }
    while(CheckImage("trade", "", "tradeInterface.PNG")=0){
        sleep 1000 ;
    }
    i := 1 ;
    while(i<24){
        Item(i) ;
        sleep 200 ;
        Item(i) ;
        sleep 200 ;
        i++ ;
    }
    MouseClick(0, 258, 212, 3000) ; offer trade
    MouseClick(0, 218, 329, 3000) ; accept trade
    if(CheckImage("trade", "/unsuccessful trade", "successfulTrade.PNG")=1){
        send, /trade accepted {enter} ;
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


PickUp(){
    MouseClick(1, 261, 202, 1000) ;

    coordMode,pixel, window
    ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, overload2.PNG
        if (ErrorLevel = 2)
        {
            send, /error level 2 ;
            send, {enter} ;
            return 0 ;
        }
        else if (ErrorLevel = 1)
        {
            return 0 ;
        }
        else
        {
            MouseClick(0, FoundX, FoundY+5, 1000) ;
        }
}


Bank(){
; ============================= bank room===========================
    timer :=0 ;
/*
    while(CheckImage("Raid Started", "", "enteredRaid.PNG")=0){
        sleep 50 ;
        timer+=50 ;
        if(timer=30000){
            break ;
        }
    }
*/
    ;sleep 2000 ; wait to be teleported inside
    MouseClick(1, 260, 49, 750) ; right click banker
    MouseClick(0, 260, 88, 1750) ; bank
    MouseMove, 200, 200 ;
    Loop 2{
        MouseClick(0, 440, 340, 1000) ; deposit inventory
    }
    MouseClick(1, 355, 125, 750) ; right click supers
    Loop 10
    {
        Send {WheelUp} ; scroll up on bank tab
        sleep 25 ;
    }
    MouseClick(0, 355, 209, 1000) ; withdraw x
    send, /9 {enter} ; withdraw 9
    MouseClick(1, 400, 125, 750) ; right click supers
    MouseClick(0, 400, 209, 1000) ; withdraw x
    send, /14 {enter} ; withdraw 14
    sleep 1000 ;

    MouseClick(0, 658, 89, 2500) ; minimap front of door to shamans
    MouseClick(0, 279, 149, 1500) ; go through tunnel
    MouseClick(0, 645, 215, 750) ; inventory tab
}

`::Start() ;