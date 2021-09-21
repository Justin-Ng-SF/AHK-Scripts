#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force ;

Esc::ExitApp ;

Start()
{
    Loop 1
    {


        global foods := 24 ;
        global zulrahDead := 0 ;
        global death := 0 ;

        PresetScreen() ;

        MouseClick(0, 680, 215, 500) ; equipment tab
        if(CheckImage("Bank", "", "naked.PNG")=1){
            Equip() ;
        }

        ;Inventory() ;

        Teleport() ;



        ; ---------ZULRAH FIGHT------------

        MouseClick(0, 645, 215, 100) ; inventory

        Item(2) ; range pot

        Phase1() ;

        Phase2() ;

        Phase3() ;

        Phase4() ;

        Phase5() ;

        Phase6() ;

        Phase7() ;

        Phase8() ;

        Phase9() ;

        MouseClick(0, 710, 215, 200) ; prayer tab

        MouseClick(0, 605, 365, 200) ; mage off

        MouseClick(0, 645, 440, 200) ; rigour off


        ;------------------DROP LAST 3 FOOD-------------

        if(Food > 22)
        {
            MouseClick(0, 645, 215, 750) ; inventory

            send {Shift Down} ;
            Item(5) ;
            Item(6) ;
            Item(7) ;
            Item(8) ;
            send {Shift Up} ;
        }

        ;----------------------------------------------
        MouseClick(0, 91, 118, 1500) ; incase early zulrah kill

        MouseClick(0, 190, 134, 4000) ; incase early zulrah kill

        MouseClick(0, 673, 117, 3000) ; move to top of loot pile

        Loop 10
        {
            MouseClick(0, 263, 207, 200) ; pick up loot
        }

        CheckDeath() ;
        Heal() ;






    }

return ;
}



Phase1()
{
    ;-----------PHASE 1, GREEN----------
    MouseClick(0, 663, 71, 100)  ; move to north east side

    MouseClick(0, 710, 215, 200) ; prayer tab

    MouseClick(0, 645, 440, 4500) ; rigour

    MouseClick(0, 115, 242, 13000) ; attack zulrah
}

Phase2()
{
    ;-----------PHASE 2, RED-------------
    MouseClick(0, 680, 365, 500) ; melee protect

    MouseClick(0, 57, 319, 12500) ; attack zulrah
}

Phase3()
{
    ;-----------PHASE 3, BLUE-----------------
    MouseClick(0, 607, 137, 100) ; walk to south west side

    MouseClick(0, 605, 365, 100) ; mage protect

    MouseClick(0, 645, 215, 6300) ; inventory tab

    MouseClick(0, 430, 98, 0) ; attack zulrah

    Loop 5
    {
        ;loop should be 9 seconds
        sleepTime := 1800
        if(CheckImage("", "", "83hp.PNG")=1)
        {
            CheckHP(foods) ;
            MouseClick(0, 430, 98, 100) ; attack zulrah
            sleep 200 ;

            sleepTime := 1300 ;
        }
        sleep sleepTime ;
    }
}

Phase4()
{
    ;-----------PHASE 4, GREEN-----------------
    MouseClick(0, 710, 215, 100) ; prayer tab

    MouseClick(0, 605, 365, 1000) ; mage off

    MouseClick(0, 122, 168, 13000) ; attack zulrah

    MouseClick(0, 605, 365, 100) ; mage on

    MouseClick(0, 645, 215, 100) ; inventory tab

    Item(4) ; drink prayer pot
    Sleep 2000 ;

    Item(3) ; anti
    Sleep 1300 ;

}

Phase5()
{
    ;-----------PHASE 5, BLUE-----------------
    MouseClick(0, 517, 361, 0) ; attack zulrah

    Loop 10
    {
        ;loop should be 9 seconds
        sleepTime := 1800
        if(CheckImage("", "", "83hp.PNG")=1)
        {
            CheckHP(foods) ;
            MouseClick(0, 430, 98, 100) ; attack zulrah
            sleep 200 ;

            sleepTime := 1300 ;
        }
        sleep sleepTime ;
    }



}

Phase6()
{
    ;-----------PHASE 6, RED-----------------

    MouseMove, 710, 255 ;
    sleep 100 ;
    Click, 710, 255 ; drink prayer pot
    sleep 1800 ;

    MouseMove, 660, 255 ; drink anti-venom/poison
    sleep 100 ;
    Click, 660, 255 ;
    sleep 100 ;

    MouseMove, 710, 215 ;
    sleep 100 ;
    Click, 710, 215 ; prayer tab
    sleep 100 ;

    MouseMove, 680, 365 ;
    sleep 100 ;
    Click, 680, 365 ; melee protect
    sleep 2500 ;

    MouseMove, 388, 152 ;
    sleep 100 ;
    Click, 388, 152 ; attack zulrah
    sleep 12000 ;
}

Phase7()
{
       ;------------PHASE 7, GREEN-------------
        MouseMove, 710, 215 ;
        sleep 100 ;
        Click, 710, 215 ; prayer tab
        sleep 100 ;

        MouseMove, 645, 365 ;
        sleep 100 ;
        Click, 645, 365 ; range protect
        sleep 100 ;

        MouseMove, 683, 114 ;
        sleep 100 ;
        Click, 683, 114 ; move east
        sleep 4050 ;

        MouseMove, 645, 215 ;
        sleep 100 ;
        Click, 645, 215 ; inventory tab
        sleep 100 ;

        MouseMove, 482, 153 ;
        sleep 100 ;
        Click, 482, 153 ; attack zulrah

        Loop 6
        {
            ; loop should be 10.8 seconds
            sleepTime := 1800
            if(CheckHP(foods))
            {
                MouseMove, 482, 153 ;
                sleep 100 ;
                Click, 482, 153 ; attack zulrah
                Food-- ;
                sleepTime := 1500 ;
            }
            sleep sleepTime ;
        }

        MouseMove, 710, 215 ;
        sleep 100 ;
        Click, 710, 215 ; prayer tab
        sleep 300 ;
}

Phase8()
{
        ;------------PHASE 8, BLUE-------------
        MouseMove, 611, 106 ;
        sleep 100 ;
        Click, 611, 106 ; move back west
        sleep 100 ;

        MouseMove, 605, 365 ;
        sleep 100 ;
        Click, 605, 365 ; mage protect
        sleep 100 ;

        MouseMove, 645, 215 ;
        sleep 100 ;
        Click, 645, 215 ; inventory tab
        sleep 100 ;

        MouseMove, 710, 255 ;
        sleep 100 ;
        Click, 710, 255 ; drink prayer pot
        sleep 1250 ;

        MouseMove, 660, 255 ; drink anti-venom/poison
        sleep 100 ;
        Click, 660, 255 ;
        sleep 2700 ;

        MouseMove, 514, 355 ;
        sleep 100 ;
        Click, 517, 361 ; attack zulrah

        Loop 10
        {
            ; loop should be 18 seconds
            sleepTime := 1800
            if(CheckHP(foods))
            {
                MouseMove, 517, 361 ;
                sleep 100 ;
                Click, 517, 361 ; attack zulrah
                Food-- ;
                sleepTime := 1500 ;
            }
            sleep sleepTime ;
        }
        sleep 250 ;
}

Phase9()
{
        ;------------PHASE 9, GREEN-------------
        MouseMove, 710, 255 ;
        sleep 100 ;
        Click, 710, 255 ; drink prayer pot
        sleep 1800 ;

        MouseMove, 660, 255 ; drink anti-venom/poison
        sleep 100 ;
        Click, 660, 255 ;
        sleep 100

        MouseMove, 122, 168 ;
        sleep 100 ;
        Click, 122, 168 ; attack zulrah

        Loop 25
        {
            sleepTime := 1800
            if(CheckHP(foods))
            {
                MouseMove, 122, 168 ;
                sleep 100 ;
                Click, 122, 168 ; attack zulrah
                Food-- ;
                sleepTime := 1500 ;
            }
            sleep sleepTime ;
        }
}


CheckDeath()
{
    MouseMove, 680, 215 ;
    Sleep 100 ;
    Click, 680, 215 ; equipment tab
    sleep 750 ;

    coordMode,pixel
    ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, naked.PNG
        if (ErrorLevel = 2)
        {
            send, /error! broken ; if picture not found?
            send, {enter} ;
        }
        else if (ErrorLevel = 1)
        {
            send, {enter} ;
        }
        else
        {
            send, /you have died ;
            send, {enter} ;
            Heal() ;

            MouseMove, 269, 232 ;
            Sleep 100 ;
            click, 269, 232 ; use bank booth south side
            sleep 1500 ;

            MouseMove, 89, 82 ;
            sleep 100 ;
            click, 89, 82 ;
            sleep 750 ;
            MouseMove, 200, 200 ;
            Loop 10
            {
                Send {WheelUp} ; scroll up on bank tab
                sleep 25 ;
            }
            sleep 750 ;

            MouseMove, 50, 125 ;
            sleep 100 ;
            Click, right, 50, 125 ; right click money stack
            sleep 1000 ;

            MouseMove, 50, 210 ;
            sleep 100 ;
            Click, 50, 210 ; withdraw x
            sleep 1000 ;
            Send, /500k
            sleep 100 ;
            Send, {enter} ;
            sleep 500 ;

            MouseMove, 485, 45 ;
            sleep 100 ;
            Click, 485, 45 ; close bank
            sleep 500 ;

            MouseMove, 743, 209 ;
            sleep 100 ;
            click, 743, 209 ; spellbook
            sleep 750 ;

            MouseMove, 715, 315 ;
            sleep 100 ;
            click, 715, 315 ; boss teleport
            sleep 750 ;

            MouseMove, 390, 285 ;
            {
                Send {WheelUp} ; scroll up on bank tab
                sleep 25 ;
            }
            sleep 100 ;
            click, 390, 285 ; click zulrah teleport
            sleep 3500 ;

            MouseMove, 680, 107 ;
            sleep 100 ;
            click, 680, 107 ; walk to priest
            sleep 400 ;
            PresetScreen() ;
            sleep 450 ;

            MouseMove, 303, 196 ;
            sleep 100 ;
            click, 303, 196 ; talk to priest
            sleep 1250 ;

            Send, {space} ; next dialogue
            sleep 1250 ;
            Send, 2 ; ask for lost items back
            sleep 1250 ;
            Send, {space} ; next dialogue
            sleep 1250 ;
            Send 1 ; accept
            Sleep 1250 ;

            Heal() ;
        }

}


Teleport(){
    ; ---------GOES TO ZULRAH----------

	MouseMove, 743, 209 ;
	sleep 100 ;
	click, 743, 209 ; spellbook
	sleep 750 ;

	MouseMove, 715, 315 ;
	sleep 100 ;
	click, 715, 315 ; boss teleport
	sleep 750 ;

	MouseMove, 390, 285 ;
	sleep 100 ;
	click, 390, 285 ; click zulrah teleport
	sleep 3500 ;

	MouseMove, 680, 107 ;
	sleep 100 ;
	click, 680, 107 ; walk to priest
    sleep 400 ;
    PresetScreen() ;
    sleep 450 ;

	MouseMove, 303, 196 ;
	sleep 100 ;
	click, right, 303, 196 ; right click priest
	sleep 750 ;

	MouseClick(0, 303, 233, 8000) ; teleport to zulrah

}




Equip(){

    ;----------WITHDRAW GEAR----------

    MouseMove, 261, 221 ;
    Sleep 100 ;
    Click, 261, 221 ; use bank south of you
    sleep 1500 ;

    MouseMove, 89, 82 ;
    sleep 100 ;
    click, 89, 82 ; first tab of bank
    sleep 750 ;

    MouseMove, 440, 340 ;
    sleep 100 ;
    Click, 440, 340 ; deposit inventory
    sleep 500 ;

    MouseMove, 480, 340 ;
    sleep 100 ;
    Click, 480, 340 ; deposit equipment
    sleep 500 ;

    MouseMove, 200, 200 ;
	Loop 10
	{
		Send {WheelUp} ;
		sleep 25 ;
	}


    MouseMove, 355, 195 ;
    Sleep 100 ;
    Click, 355, 195 ; withdraw recoil
    sleep 100 ;

    MouseMove, 230, 125 ;
    Sleep 100 ;
    Click, 230, 125 ; withdraw ava
    sleep 100 ;

    MouseMove, 230, 160 ;
    Sleep 100 ;
    Click, 230, 160 ; withdraw anguish
    sleep 100 ;

    MouseMove, 230, 195 ;
    Sleep 100 ;
    Click, 230, 195 ; withdraw rangers
    sleep 100 ;

    MouseMove, 275, 125 ;
    Sleep 100 ;
    Click, 275, 125 ; withdraw coif
    sleep 100 ;

    MouseMove, 275, 160 ;
    Sleep 100 ;
    Click, 275, 160 ; withdraw body
    sleep 100 ;

    MouseMove, 275, 195 ;
    Sleep 100 ;
    Click, 275, 195 ; withdraw legs
    sleep 100 ;

    MouseMove, 310, 160 ;
    Sleep 100 ;
    Click, 310, 160 ; withdraw gloves
    sleep 100 ;

    MouseMove, 310, 195 ;
    Sleep 100 ;
    Click, 310, 195 ; withdraw blowpipe
    sleep 100 ;

    MouseMove, 355, 160 ;
    Sleep 100 ;
    Click, 355, 160 ; withdraw blessing
    sleep 100 ;


    MouseMove, 485, 45 ;
    Sleep 100 ;
    Click, 485, 45 ; close bank interface
    sleep 100 ;

    ;-----------------EQUIP--------------

    MouseMove, 645, 215 ;
    Sleep 100 ;
    Click, 645, 215 ; inventory tab
    sleep 100 ;

    MouseMove, 580, 255 ;
    Sleep 100 ;
    Click, 580, 255 ; equip recoil
    sleep 100 ;

    MouseMove, 625, 255 ;
    Sleep 100 ;
    Click, 625, 255 ; equip ava
    sleep 100 ;

    MouseMove, 660, 255 ;
    Sleep 100 ;
    Click, 660, 255 ; equip anguish
    sleep 100 ;

    MouseMove, 710, 255 ;
    Sleep 100 ;
    Click, 710, 255 ; equip boots
    sleep 100 ;

    MouseMove, 580, 290 ;
    Sleep 100 ;
    Click, 580, 290 ; equip coif
    sleep 100 ;

    MouseMove, 625, 290 ;
    Sleep 100 ;
    Click, 625, 290 ; equip body
    sleep 100 ;

    MouseMove, 660, 290 ;
    Sleep 100 ;
    Click, 660, 290 ; equip legs
    sleep 100 ;

    MouseMove, 710, 290 ;
    Sleep 100 ;
    Click, 710, 290 ; equip gloves
    sleep 100 ;

    MouseMove, 580, 325 ;
    Sleep 100 ;
    Click, 580, 325 ; equip blowpipe
    sleep 100 ;

    MouseMove, 625, 325 ;
    Sleep 100 ;
    Click, 625, 325 ; equip blessing
    sleep 100 ;

    MouseMove, 660, 325 ;
    Sleep 100 ;
    Click, 660, 325 ; equip blessing
    sleep 100 ;
}

Inventory()
{
    ;----------WITHDRAW FOOD AND POTIONS---------
    MouseClick(0, 645, 215, 100) ; inventory

    MouseMove, 261, 221 ;
    Sleep 100 ;
    Click, 261, 221 ; use bank south of you
    sleep 1500 ;

    MouseMove, 440, 340 ;
    sleep 100 ;
    Click, 440, 340 ; deposit inventory
    sleep 500 ;

    MouseMove, 355, 195 ;
    Sleep 100 ;
    Click, 355, 195 ; recoil
    sleep 100 ;

    MouseMove, 140, 160 ;
    Sleep 100 ;
    Click, 140, 160 ; withdraw range potion
    sleep 100 ;

    MouseMove, 185, 160 ;
    Sleep 100 ;
    Click, 185, 160 ; withdraw antivenom
    sleep 100 ;

    MouseMove, 140, 195 ;
    Sleep 100 ;
    Click, 140, 195 ; withdraw prayer
    sleep 100 ;

    MouseMove, 95, 230 ;
    Sleep 100 ;
    Click, Right, 95, 230 ; withdraw monkfish
    sleep 100 ;
    MouseMove, 95, 260 ;
    Sleep 100 ;
    Click, 95, 260 ; withdraw monkfish
    sleep 100 ;


    MouseMove, 485, 45 ;
    Sleep 100 ;
    Click, 485, 45 ; close bank
    sleep 100 ;

    MouseMove, 580, 255 ;
    Sleep 100 ;
    Click, right, 580, 255 ; right click recoil
    sleep 100 ;

    MouseMove, 580, 315 ;
    Sleep 100 ;
    Click, 580, 315 ; destroy recoil
    sleep 500 ;

}



Heal()
{
    MouseClick(0, 743, 209, 750) ; spellbook
    MouseClick(0, 572, 263, 3500) ; edgeville teleport
	MouseClick(0, 336, 155, 1500) ; heal
	MouseClick(0, 377, 188, 1000) ; pray
    MouseClick(0, 669, 158, 5000) ; walk to bank from altar
}

CheckHp(Food)
{
    Global foods ;
    if(CheckImage("HP", "", "83hp.PNG")=1)
    {
        if(foods = 24)
        {
            Item(5) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 23)
        {
            Item(6) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 22)
        {
            Item(7) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 21)
        {
            Item(8) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 20)
        {
            Item(9) ;
             sleep 200 ;
             return foods -= 1 ;
        }
        else if(foods = 19)
        {
            Item(10) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 18)
        {
            Item(11) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 17)
        {
            Item(12) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 16)
        {
            Item(13) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 15)
        {
            Item(14) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 14)
        {
            Item(15) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 13)
        {
            Item(16) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 12)
        {
            Item(17) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 11)
        {
            Item(18) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 10)
        {
            Item(19) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 9)
        {
            Item(20) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 8)
        {
            Item(21) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 7)
        {
            Item(22) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 6)
        {
            Item(23) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 5)
        {
            Item(24) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 4)
        {
            Item(25) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 3)
        {
            Item(26) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 2)
        {
            Item(27) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods = 1)
        {
            Item(28) ;
            sleep 200 ;
            return foods -= 1 ;
        }
        else if(foods < 0)
        {
            send, /tp out {enter} ;
            Heal() ;
            ExitApp ;
        }
    }
}






MouseClick(button, x, y, sleepTime){
    MouseMove, x, y ;
    sleep 100 ;
    if(button=0)
    {
        click, x, y ;
    }
    else if(button=1)
    {
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

PresetScreen()
{
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




`::Start() ;