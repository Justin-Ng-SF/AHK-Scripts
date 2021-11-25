#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

/*
USES WINDOW COORDINATES DEFAULT
*/

#SingleInstance force ;
/*
start with auto retaliate off
refer to setup pictures for how banking works
uses 8 supers, 17 brews, 1 range pot, 1 super cmbt pot
uses defender, warhammer, amulet
*/

Esc::ExitApp ;


Start()
{

    
    Loop 5
    { ; Loop %runs%{
        ; potion values are based off of doses
        Global supers := 32 ; supers restore 32 prayer points
        Global brews := 56 ; brews restore 16 hp
        Global outOfBrews = 0 ;
        ; Global rangePot := 3 ; range pot
        ; Global ovl := 4 ; overload

        ; Global room := start ;



        PresetScreen() ;

        Auto(0) ; off

        StartRaid() ;

        Gear(runs) ;

        Shamans() ;

        Vasa() ;

        Vanguards() ;

        IceDemon() ;

        Skeletons() ;

        Tekton() ;

        Muttadile() ;

        DeathlyMages() ;

        ; Trade() ;

        Olm() ;

        ; Heal() ;

    }
    return ;

}

;==================================ROOMS===============================

Shamans()
{
    Global room = "shamans" ;
    ; ==============assuming you have banked===============

    MouseClick(0, 658, 89, 2500) ; minimap front of door to shamans
    MouseClick(0, 279, 149, 1500) ; go through tunnel
    MouseClick(0, 651, 37, 7500) ; walk to shamans 1
    MouseClick(0, 651, 37, 7500) ; walk to shamans 2
    MouseClick(0, 654, 71, 4500) ; walk to shamans 3

    Inventory() ;
    Sleep 500 ;
    Item(5) ; drink range pot

    ProMelee() ; on

    MouseClick(0, 677, 92, 5500) ; lure 1
    MouseClick(0, 648, 89, 3000) ; lure 2
    MouseClick(0, 648, 128, 3000) ; lure 3
    MouseClick(0, 662, 88, 3000) ; lure 4
    ProMelee() ; off

    MouseClick(0, 157, 213, 500) ; attack shaman


    Fight("First Shaman", "0shaman\shamanDead.PNG", 9000) ;

    ; wait for second shaman to get in position
    sleep 3000 ; 

    MouseClick(0, 157, 213, 500) ; attack shaman
    Fight("Second Shaman", "0shaman\shamanDead.PNG", 9000) ;


    ProMelee() ; on 
    MouseClick(0, 591, 97, 7000) ; lure 1
    MouseClick(0, 654, 75, 5000) ; lure 2

    ProMelee() ; off

    MouseClick(1, 242, 262, 500) ; check for shaman


    if(!CheckImage("shaman", "", "0shaman\shaman.PNG"))
    {
        Start() ;
    }

    MouseClick(0, 242, 282, 500) ; attack shaman

    Fight("Third Shaman", "0shaman\shamanDead.PNG", 9000) ;


    CheckHpPray() ;
}

Vasa()
{
    Global room = "vasa" ;
    Global supers ;

    ProMage() ; on

    MouseClick(0, 300, 101, 2000) ; walk into vasa room
    MouseClick(0, 649, 66, 5000) ; walk to vasa

    CheckHpPray() ;
    Inventory() ;
    Sleep 500 ;
    Item(6) ; tbow

    MouseClick(0, 263, 300, 0) ; attack vasa
    Prayer() ;
    Rigour() ; on
    ;===========================================


    Loop 500
    {
        if(CheckImage("Vasa", "", "1vasa\vasaDead.PNG")=1)
        {
            send, /Vasa dead {enter} ;
            break ;
        }
        else
        {
            MouseClick(0, 263, 300, 1500) ; attack vasa
        }
        CheckPrayer(supers)
    }


    ; timeExceeded := 0 ;

    ; while(!CheckImage("Vasa", "", "1vasa\vasaDead.PNG"))
    ; {
    ;     CheckPrayer(supers)

    ;     sleep 100() ;
    ;     timeExceeded++ ;
    ;     if(timeExceeded=1500)
    ;     {
    ;         send, /Vasa dead timed out {enter} ;
    ;     }
    ; }
    ; send, /Vasa dead {enter}

    ;===========================================

    ; Fight("Vasa", "1vasa\vasaDead.PNG", 15000) ;

    Rigour() ; off
    Sleep 250 ;
    ProMage() ; off

    CheckHpPray() ;
    Inventory() ;
    Sleep 500 ;
    Item(6) ; blowpipe

    MouseClick(0, 649, 38, 6500) ; move towards vanguards after killing vasa

}
Vanguards()
{
    Global room = "vanguards" ;

    vanguard1 := 0 ;

    MouseClick(0, 270, 90, 2000) ; enter to vanguard room
    ; Auto(1) ;

    ProRange() ; on
    MouseClick(0, 666, 90, 5000) ; lure range

    ;===================Vanguard Range============================
    Rigour() ; on
    Sleep 250 ;

    MouseClick(0, 231, 40, 1500) ; attack vanguard range

    Loop 60
    {
        if(vanguard1 = 1)
        {
            break ;
        }
        Loop 40
        {
            if(CheckImage("Vanguard1", "", "2vanguard\vanguardDead.PNG")=1 || vanguard1 = 1)
            {
                vanguard1 := 1 ;
                send, /Vanguard 1 dead {enter} ;
                break ;
            }
            else 
            {
                Sleep 25 ;
            }

        }
        MouseClick(0, 231, 40, 0) ; attack vanguard range
        CheckHpPray() ;
        MouseClick(0, 231, 40, 0) ; attack vanguard range
    }
    vanguard1 := 1 ;

    CheckHpPray() ;
    ProMage()
    MouseClick(0, 649, 96, 3000) ; position for mage
    ;============================================================

    ;===================Vanguard Mage============================

    ; Inventory() ;
    ; Item(6) ; tbow
    Loop 60
    {
        if(vanguard1 = 2)
        {
            break ;
        }
        Loop 40
        {
            if(CheckImage("Vanguard1", "", "2vanguard\vanguardDead.PNG")=1 || vanguard1 = 2)
            {
                vanguard1 := 2 ;
                send, /Vanguard 2 dead {enter} ;
                break ;
            }
            else 
            {
                Sleep 25 ;
            }

        }
        MouseClick(0, 270, 104, 500) ; attack vanguard mage
        CheckHpPray() ;
        MouseClick(0, 270, 104, 500) ; attack vanguard mage
    }
    vanguard1 := 2 ;
    ; Fight("Vanguard 2", "2vanguard\vanguardDead.PNG", 15000) ;
    ;============================================================
    ;===================Vanguard Melee============================




    ProMage() ; off
    CheckHpPray() ;

    Sleep 1500 ;

    MouseClick(0, 270, 104, 3000) ; attack vanguard melee
    Rigour() ; off
    Fight("Vanguard Range", "2vanguard\vanguardDead.PNG", 6000) ;
    ;============================================================



    ; Auto(0) ; off

    CheckHpPray() ;

    Sleep 250 ;
    MouseClick(0, 638, 64, 4500) ; walk towards ice demon room 1
    Sleep 250 ;
    MouseClick(0, 643, 75, 4000) ; walk towards ice demon room 2
}

IceDemon()
{
    Global room = "iceDemon" ;

    Auto(0) ; off

    MouseClick(0, 239, 114, 3250) ; enter ice demon room

    Inventory() ;
    send {Shift Down} ; hold shift
    Item(20) ;
    Item(21) ;
    Item(25) ;
    Item(26) ;
    Item(27) ;
    send {Shift Up} ; release shift

    MouseClick(0, 295, 169, 2000) ; walk 1 tile east, 1 tile north
    MouseClick(0, 402, 136, 3500) ; take axe
    MouseClick(0, 265, 68, 4000) ; click on tree

    while(CheckImage("Ice Demon", "", "3iceDemon\fullInv.PNG")=0)
    {
        Sleep 3000 ;
        MouseClick(0, 266, 166, 0) ; chop tree until full inv
    }
    Inventory() ;
    Sleep 500 ;
    Item(5) ; drink ranger pot

    MouseClick(0, 633, 45, 3500) ; 8.5 seconds to walk to north eastern brazier

    Sleep 250 ;
    Prayer() ;
    Sleep 250 ;
    ProMelee() ; on 

    Sleep 2900 ;

    MouseClick(0, 310, 191, 1250) ; light brazier 1
    MouseClick(0, 228, 305, 2250) ; light brazier 2
    MouseClick(0, 139, 235, 2250) ; light brazier 3
    MouseClick(0, 147, 95, 3500) ; light brazier 4

    MouseClick(0, 256, 348, 2500) ; walk to safespot

    CheckHpPray() ;

    Inventory() ;
    Sleep 500 ;
    Item(6) ; tbow

    MouseClick(0, 280, 119, 500) ; attack ice demon
    ProMelee() ; off

    Fight("Ice Demon", "3iceDemon\iceDemonDead.PNG", 12000) ;



    Inventory() ;
    send {Shift Down} ; hold shift
    Item(20) ; drop axe
    send {Shift Up} ; release shift

    MouseClick(0, 680, 155, 6000) ; walk back towards dropped brews
    MouseClick(0, 635, 138, 5000) ; walk back towards dropped brews

    Inventory() ;
    Sleep 500 ;
    Item(6) ; blowpipe

    Loop 6
    {
        MouseClick(0, 257, 204, 500) ; pick up items underneath
    }

    MouseClick(0, 628, 48, 8500) ; walk towards next room
    MouseClick(0, 656, 74, 3000) ; walk infront of room entrance

    CheckHpPray() ;


}

Skeletons()
{
    Global room = "skeletons" ;

    MouseClick(0, 262, 136, 4000) ; enter next room
    MouseClick(0, 669, 60, 9500) ; move towards next room
    MouseClick(0, 658, 52, 9000) ; walk to next room entrance
    MouseClick(0, 238, 135, 4000) ; enter next room
    MouseClick(0, 663, 38, 10500) ; walk towards skeleton mage room



    MouseClick(0, 630, 44, 6000) ; walk infront of first skeleton mage
    Prayer() ;
    ProMage() ; on
    Rigour() ; on

    MouseClick(0, 257, 163, 2000) ; one tile up

    MouseClick(0, 257, 46, 1500) ; atk 1st skele
    Fight("First Skeletal Mage", "4skeletalMage\skeletonMageDead.PNG", 9000) ;

    CheckHpPray() ;


    MouseClick(0, 672, 79, 6000) ; walk infront of second skeleton
    MouseClick(0, 265, 158, 8000) ; atk 2nd skele
    sleep 100 ;
    Combat() ;
    sleep 200 ;
    Auto(1) ; on
    sleep 200 ;

    CheckHpPray() ;

    
    Fight("Second Skeletal Mage", "4skeletalMage\skeletonMageDead.PNG", 9000) ;
    
    sleep 100 ;
    Combat() ;
    sleep 200 ;
    Auto(0) ; off
    sleep 200 ;

    CheckHpPray() ;

    MouseClick(0, 591, 105, 10500) ; walk infront of 3rd skele
    MouseClick(0, 246, 140, 8000) ; attack skeletal mage

    sleep 100 ;
    Combat() ;
    sleep 500 ;
    Auto(1) ; on
    sleep 200 ;

    CheckHpPray() ;
    
    Fight("Third Skeletal Mage", "4skeletalMage\skeletonMageDead.PNG", 9000) ;

    Prayer() ;
    ProMage() ; off
    Rigour() ; off

    Auto(0) ; off
    sleep 1000 ;
    MouseClick(0, 664, 61, 6000) ; walk to front of tekton entrance

}

Tekton()
{
    Global room = "tekton" ;
    
    Sleep 5000 ;
    MouseClick(0, 248, 110, 2000) ; enter tekton room

    Inventory() ;
    Sleep 500 ;
    Item(1) ; equip defender
    Sleep 100 ;
    Item(2) ; equip hammer
    Sleep 100 ;
    Item(3) ; equip amulet
    Sleep 100 ;


    Inventory() ;
    CheckHpPray() ;


    MouseClick(0, 710, 255, 500)
    MouseClick(0, 710, 255, 3000) ; drink overload
    CheckHpPray() ;

    ProMelee() ;
    Piety() ; on
    MouseClick(0, 654, 79, 4000) ; walk to tekton




    Combat() ;
    ; Auto(1) ; on
    Special() ;
    ; Attack Tekton
    MouseClick(0, 250, 124, 1000) ;
    Special() ;
    ; Attack Tekton
    MouseClick(0, 250, 124, 1000) ;

    Loop 45{
        Loop 6{
            if(CheckImage("Tekton", "", "5tekton\tektonDead.PNG")=1)
            {
                break ;
            }
            if(CheckImage("hp", "", "other\83hp.PNG")=1)
            {
                CheckHP(brews) ;
                ; Attack Tekton
                MouseClick(0, 250, 124, 100) ;
            }
            if(CheckImage("Tekton", "", "5tekton\tektonDead.PNG")=1)
            {
                break ;
            }
            if(CheckImage("pray", "", "other\65pray.PNG")=1)
            {
                CheckPrayer(supers) ;
                ; Attack Tekton
                MouseClick(0, 250, 124, 100) ;
            }
            if(CheckImage("Tekton", "", "5tekton\tektonDead.PNG")=1)
            {
                break ;
            }
            Loop 25{
                if(CheckImage("Tekton", "", "5tekton\tektonDead.PNG")=1)
                {
                    break ;
                }
                sleep 50 ;
            }
        }
        if(CheckImage("Tekton", "", "5tekton\tektonDead.PNG")=1)
        {
                send, /Tekton dead {enter} ;
                break ;
        }
        Combat() ;
        if(CheckImage("Special", "", "other\40special.PNG")=1)
        {
            Special() ;
            Sleep 200 ;
            ; Attack Tekton
            MouseClick(0, 250, 124, 100) ;
        }
        if(CheckImage("Tekton", "", "5tekton\tektonDead.PNG")=1)
        {
                send, /Tekton dead {enter} ;
                break ;
        }
    }

    Prayer() ;
    ProMelee() ;
    Piety() ; off

    Auto(0) ;

    Inventory() ;
    Sleep 500 ;
    Item(1) ; equip blowpipe
    Sleep 100 ;
    Item(3) ; equip amulet
    Sleep 100 ;
    Item(5) ; range potion for muttadile
    CheckHpPray() ;

    MouseClick(0, 647, 69, 6000) ; walk towards muttadile room
    MouseClick(0, 644, 72, 5000) ; walk infront of muttadile entrance
}

Muttadile()
{
    Global room = "muttadile" ;

    MouseClick(0, 246, 126, 3000) ; enter muttadile room
    MouseClick(0, 649, 53, 4000) ; lure muttadile 1
    Prayer() ;
    ProMelee() ;
    Sleep 1000 ;
    MouseClick(0, 659, 73, 5000) ; lure muttadile 2
    MouseClick(0, 660, 118, 3500) ; lure muttadile 3

    MouseClick(0, 680, 365, 500) ; melee off


    MouseClick(0, 126, 160, 0) ; attack muttadile
    Fight("Muttadile", "6muttadile\muttadileDead.PNG", 10000) ;

    Prayer() ;


    CheckHpPray() ;

    MouseClick(0, 624, 75, 6000) ; walk to front of tightrope room
}

DeathlyMages()
{
    Global room = "deathlyMages" ;

    MouseClick(0, 245, 135, 3000) ; enter tightrope room
    MouseClick(0, 646, 58, 5000) ; walk towards deathly mages
    Prayer() ;
    ProMage() ; on
    Rigour() ; on
    MouseClick(0, 677, 81, 5000) ; walk in front of deathly mages

    MouseClick(0, 324, 66, 5000) ; attack deathly mage 1
    Fight("Deathly Mage 1", "7deathly\deathlyMageDead.PNG", 15000) ;

    MouseClick(0, 353, 39, 5000) ; attack deathly mage 2
    MouseClick(0, 353, 39, 1000) ; attack deathly mage 2
    MouseClick(0, 353, 39, 1000) ; attack deathly mage 2
    Fight("Deathly Mage 2", "7deathly\deathlyMageDead.PNG", 15000) ;

    MouseClick(0, 396, 75, 5000) ; attack deathly mage 3
    MouseClick(0, 396, 75, 1000) ; attack deathly mage 3
    MouseClick(0, 396, 75, 1000) ; attack deathly mage 3
    Fight("Deathly Mage 3", "7deathly\deathlyMageDead.PNG", 15000) ;

    ProMage() ; off
    Rigour() ; off

    CheckHpPray() ;

    sleep 500 ;
    Prayer() ;
    sleep 250 ;
    ProRange() ; on
    sleep 250 ;
    Rigour() ; on
    MouseClick(0, 644, 82, 5000) ; walk towards deathly rangers

    MouseClick(0, 331, 58, 5000) ; attack deathly ranger 1
    Fight("Deathly Ranger 1", "7deathly\deathlyRangerDead.PNG", 15000) ;

    MouseClick(0, 371, 92, 5000) ; attack deathly ranger 2
    MouseClick(0, 371, 92, 1000) ; attack deathly ranger 2
    MouseClick(0, 371, 92, 1000) ; attack deathly ranger 2
    Fight("Deathly Ranger 2", "7deathly\deathlyRangerDead.PNG", 15000) ;

    MouseClick(0, 403, 57, 5000) ; attack deathly ranger 3
    MouseClick(0, 403, 57, 1000) ; attack deathly ranger 3
    MouseClick(0, 403, 57, 1000) ; attack deathly ranger 3
    Fight("Deathly Ranger 3", "7deathly\deathlyRangerDead.PNG", 15000) ;

    sleep 250 ;
    ProRange() ; off
    sleep 250 ;
    Rigour() ; off
    sleep 250 ;



    MouseClick(0, 117, 76, 4000) ; enter healing room
}

Olm()
{

    Global room = "olm" ;
    Global brews ;
    Global supers ;
    Global outOfBrews ;

    Global leftClawDead := 0 ;
    Global rightClawDead := 0 ;
    Global headDead := 0 ;

    Global poison := 0 ;
    MouseClick(0, 666, 58, 2000) ; walk towards hole
    Inventory() ; 
    Sleep 500 ;

    if(outOfBrews=1)
    {
        return ;
    }

    Loop 4 
    {
        CheckHP(brews) ;
    }

    Item(4) ; use overload
    Sleep 250 ;
    Item(4) ; use overload
    sleep 4000 ;
    
    Item(6) ; tbow

    MouseClick(0, 232, 164, 2000) ; USE HEALING THING
    MouseClick(0, 159, 282, 3000) ; enter hole
    MouseClick(0, 649, 72, 5000) ; walk to olms entrance

    Prayer() ;
    ProMage() ; on
    Rigour() ; on

    MouseClick(0, 264, 164, 2000) ; enter olms room
    MouseClick(0, 639, 70, 5500) ; walk to middle
    ;==========================HIS LEFT NOT YOURS=================================
	MouseClick(0, 100, 35, 100) ; atk left hand
    Loop 500
    {
        if( outOfBrews = 1)
        {
            return ;
        }
        if(CheckImage("Olm", "", "9olm\leftClawDead.PNG")=1 || leftClawDead = 1)
        {
            leftClawDead := 1 ;
            break ;
        }
        Loop 3
        {
            if(CheckImage("Olm", "", "9olm\leftClawDead.PNG")=1 || leftClawDead = 1)
            {
                leftClawDead := 1 ;
                break ;
            }
            ; check if its dead for at least one second
            Loop 5 {
                if(CheckImage("Olm", "", "9olm\leftClawDead.PNG")=1 || leftClawDead = 1)
                {
                    leftClawDead := 1 ;
                    break ;
                }
                Sleep 200 ;
            }
            ; atk left hand
            MouseClick(0, 100, 35, 100) ; 

            ; checkpoison does the walk in the function already if poisoned
            ; if poisoned, move back 4 spaces and wait 1.5 seconds
            ; check hp 5 times, drinking takes at least 1.5 seconds
            if(CheckPoison() = 1)
            {
                if(poison > 3)
                {
                    MouseClick(0, 658, 110, 1500) ;
                    poison := 0 ;
                }
                Loop 5 {
                    if(CheckImage("Olm", "", "9olm\leftClawDead.PNG")=1 || leftClawDead = 1)
                    {
                        leftClawDead := 1 ;
                        break ;
                    }
                    else 
                    {
                        CheckHP(brews) ;
                        Sleep 100 ;
                    }
                }
                CheckPrayer(supers) ;
            }
            if(CheckHpPray() = 1)
            {
                Loop 5 {
                    if(CheckImage("Olm", "", "9olm\leftClawDead.PNG")=1 || leftClawDead = 1)
                    {
                        leftClawDead := 1 ;
                        break ;
                    }
                    else 
                    {
                        CheckHP(brews) ;
                        Sleep 100 ;
                    }
                }
                MouseClick(0, 100, 35, 100) ; atk left hand
            } ;
            i
            
        }

        if(CheckImage("Olm", "", "9olm\leftClawDead.PNG")=1 || leftClawDead = 1)
        {
            leftClawDead := 1 ;
            send, //Left Claw {enter} ;
            break ;
        }
        else
        {
            MouseClick(0, 100, 35, 100) ; atk left hand
        }
        if(CheckHpPray()=1)
        {
            MouseClick(0, 100, 35, 100) ; atk left hand
        } ;
    }


    ;==========================HIS RIGHT NOT YOURS=================================
    ; MouseClick(0, 35, 355, 100) ; atk right hand
    Loop 500
    {
        MouseClick(0, 35, 355, 100) ; atk right hand
        if(outOfBrews = 1)
        {
            return ;
        }
        if(CheckImage("Olm", "", "9olm\rightClawDead.PNG")=1 || rightClawDead = 1)
        {
            rightClawDead := 1 ;
            break ;
        }

        Loop 3
        {
            if(CheckImage("Olm", "", "9olm\rightClawDead.PNG")=1 || rightClawDead = 1)
            {
                rightClawDead := 1 ;
                break ;
            }
            ; check if its dead for at least one second
            Loop 5 {
                if(CheckImage("Olm", "", "9olm\rightClawDead.PNG")=1 || rightClawDead = 1)
                {
                    rightClawDead := 1 ;
                    break ;
                }
                Sleep 200 ;
            }
            ; atk right hand
            ; MouseClick(0, 35, 355, 100) ; atk right hand

            ; checkpoison does the walk in the function already if poisoned
            ; if poisoned, move back 4 spaces and wait 1.5 seconds
            ; check hp 5 times, drinking takes at least 1.5 seconds
            if(CheckPoison() = 1)
            {
                if(poison > 3)
                {
                    MouseClick(0, 658, 110, 1500) ;
                    poison := 0 ;
                }
                Loop 5 {
                    if(CheckImage("Olm", "", "9olm\rightClawDead.PNG")=1 || rightClawDead = 1)
                    {
                        rightClawDead := 1 ;
                        break ;
                    }
                    else 
                    {
                        CheckHP(brews) ;
                        Sleep 100 ;
                    }
                }
                CheckPrayer(supers) ;
            }


            
        }

        if(CheckImage("Olm", "", "9olm\rightClawDead.PNG")=1 || rightClawDead = 1)
        {
            rightClawDead := 1 ;
            send, //Right Claw {enter} ;
            break ;
        }
        ; else
        ; {
        ;     ; atk right hand
        ;     MouseClick(0, 35, 355, 100) ; atk right hand
        ; }
        if(CheckHpPray() = 1) 
        {
            Loop 5 {
                if(CheckImage("Olm", "", "9olm\rightClawDead.PNG")=1 || rightClawDead = 1)
                {
                    rightClawDead := 1 ;
                    break ;
                }
                else 
                {
                    CheckHP(brews) ;
                    Sleep 100 ;
                }
            }
            ; MouseClick(0, 35, 355, 100) ; atk right hand
        } ;

    }

    ;==========================Head=================================
    MouseClick(0, 100, 184, 1000) ; attack head
    Loop 500
    {
        if(CheckImage("Olm", "", "other\raidComplete.PNG")=1 || head = 1)
        {
            head := 1 ;
            break ;
        }
        if(outOfBrews=1)
        {
            return ;
        }
        Loop 3
        {
            if(CheckImage("Olm", "", "other\raidComplete.PNG")=1 || head = 1)
            {
                head := 1 ;
                break ;
            }

            if(CheckPoison() = 1)
            {
                if(poison > 2)
                {
                    MouseClick(0, 658, 110, 2500) ;
                    poison := 0 ;
                }
                MouseClick(0, 100, 184, 1000) ; attack head
            }
            if(CheckImage("Olm", "", "other\raidComplete.PNG")=1 || head = 1)
            {
                head := 1 ;
                break ;
            }
            else
            {
                MouseClick(0, 100, 184, 1000) ; attack head
            }
            if(CheckImage("Olm", "", "other\83hp.PNG")=1)
            {
                CheckHP(brews) ;

            }
        }
        if(CheckImage("Olm", "", "other\raidComplete.PNG")=1 || head = 1)
        {
            head := 1 ;
            break ;
        }
        else
        {
            MouseClick(0, 100, 184, 1000) ; attack head
        }
        if(CheckImage("Olm", "", "other\65pray.PNG")=1)
        {
            CheckPrayer(supers) ;

        }
        if(CheckImage("Olm", "", "other\raidComplete.PNG")=1 || head = 1)
        {
            head := 1 ;
            break ;
        }
        else 
        {
            MouseClick(0, 100, 184, 1000) ; attack head
        }
    }

    send, //Raid complete {enter} ;

    Prayer() ;
    ProMage() ; off
    Rigour() ; off

    ; walk forward to prepare to loot 
    Loop 4 
    {
        MouseClick(0, 645, 110, 2500) ;
    }


    Inventory() ;
    Sleep 500 ;
    Item(6) ; blowpipe
    Sleep 1000 ;


    send {Shift Down} ; hold shift
    Item(24) ; drop item[3][4]
    Item(25) ; drop item[4][4]
    Item(26) ; drop item[1][5]
    send {Shift Up} ; release shift
    MouseClick(0, 512, 72, 8000) ; loot chest


}

; =======================================INVENTORY=================================================
Inventory()
{
    MouseClick(0, 645, 215, 750) ;
}
Item(item)
{
    if(item=1)
    {
        MouseClick(0, 580, 255, 100) ;
    }
    if(item=2)
    {
        MouseClick(0, 625, 255, 100) ;
    }
    if(item=3)
    {
        MouseClick(0, 660, 255, 100) ;
    }
    if(item=4)
    {
        MouseClick(0, 710, 255, 100) ;
    }
    if(item=5)
    {
        MouseClick(0, 580, 290, 100) ;
    }
    if(item=6)
    {
        MouseClick(0, 625, 290, 100) ;
    }
    if(item=7)
    {
        MouseClick(0, 660, 290, 100) ;
    }
    if(item=8)
    {
        MouseClick(0, 710, 290, 100) ;
    }
    if(item=9)
    {
        MouseClick(0, 580, 325, 100) ;
    }
    if(item=10)
    {
        MouseClick(0, 625, 325, 100) ;
    }
    if(item=11)
    {
        MouseClick(0, 660, 325, 100) ;
    }
    if(item=12)
    {
        MouseClick(0, 710, 325, 100) ;
    }
    if(item=13)
    {
        MouseClick(0, 580, 365, 100) ;
    }
    if(item=14)
    {
        MouseClick(0, 625, 365, 100) ;
    }
    if(item=15)
    {
        MouseClick(0, 660, 365, 100) ;
    }
    if(item=16)
    {
        MouseClick(0, 710, 365, 100) ;
    }
    if(item=17)
    {
        MouseClick(0, 580, 400, 100) ;
    }
    if(item=18)
    {
        MouseClick(0, 625, 400, 100) ;
    }
    if(item=19)
    {
        MouseClick(0, 660, 400, 100) ;
    }
    if(item=20)
    {
        MouseClick(0, 710, 400, 100) ;
    }
    if(item=21)
    {
        MouseClick(0, 580, 435, 100) ;
    }
    if(item=22)
    {
        MouseClick(0, 625, 435, 100) ;
    }
    if(item=23)
    {
        MouseClick(0, 660, 435, 100) ;
    }
    if(item=24)
    {
        MouseClick(0, 710, 435, 100) ;
    }
    if(item=25)
    {
        MouseClick(0, 580, 470, 100) ;
    }
    if(item=26)
    {
        MouseClick(0, 625, 470, 100) ;
    }
    if(item=27)
    {
        MouseClick(0, 660, 470, 100) ;
    }
    if(item=28)
    {
        MouseClick(0, 710, 470, 100) ;
    }

}

;===================CHECK HP AND PRAYER============================
Prayer()
{
    MouseClick(0, 710, 215, 1000) ;
}
Rigour()
{
    MouseClick(0, 710, 215, 250) ;
    MouseClick(0, 645, 440, 500) ; 
}
ProMelee()
{
    MouseClick(0, 710, 215, 250) ;
    MouseClick(0, 680, 365, 500) ; 
}
ProMage()
{
    MouseClick(0, 710, 215, 250) ;
    MouseClick(0, 605, 365, 500) ; 
}
ProRange()
{
    MouseClick(0, 710, 215, 250) ;
    MouseClick(0, 645, 365, 500) ;
}
Piety()
{
    MouseClick(0, 710, 215, 250) ;
    MouseClick(0, 605, 440, 500) ;
}

CheckHpPray()
{
    Global drink := 0 ;
    Loop 3 
    {
        while(CheckImage("hp", "", "other\83hp.PNG")=1)
        {
            drink := 1 ;
            CheckHp(brews) ;
            sleep 500 ;
        }
    }
    Loop 2 
    {
        while(CheckImage("pray", "", "other\65pray.PNG")=1)
        {   
            drink := 1
            CheckPrayer(supers) ;
            sleep 500 ;
        }
    }
    if (drink = 1)
    {
        return 1 ;
    }
}


CheckPoison()
{
    Global room ;

    coordMode,pixel
    ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, other\poison.PNG
        if (ErrorLevel = 2)
        {
            send, //error level 2 %room% ;
            send, {enter} ;
            return 0 ;
        }
        else if (ErrorLevel = 1)
        {
            return 0 ;
        }
        else
        {
            MouseClick(0, 645, 110, 1000) ;
            poison++ ;
            return 1 ;
        }
}

CheckPrayer(Super)
{
    global supers ;
    if(CheckImage("Prayer", "", "other\65pray.PNG")=1)
    {
        Inventory() ;
        if(supers>28)
        {
            MouseClick(0, 660, 290, 1500) ; sip super at [3][2]
            return supers -= 1 ;
        }
        else if(supers>24)
        {
            MouseClick(0, 710, 290, 1500) ; sip super at [4][2]
            return supers -= 1 ;
        }
        else if(supers>20)
        {
            MouseClick(0, 580, 325, 1500) ; sip super at [1][3]
            return supers -= 1 ;
        }
        else if(supers>16)
        {
            MouseClick(0, 625, 325, 1500) ; sip super at [2][3]
            return supers -= 1 ;
        }
        else if(supers>12)
        {
            MouseClick(0, 660, 325, 1500) ; sip super at [3][3]
            return supers -= 1 ;
        }
        else if(supers>8)
        {
            MouseClick(0, 710, 325, 1500) ; sip super at [4][3]
            return supers -= 1 ;
        }
        else if(supers>4)
        {
            MouseClick(0, 580, 365, 1500) ; sip super at [1][4]
            return supers -= 1 ;
        }
        else if(supers>0)
        {
            MouseClick(0, 625, 365, 1500) ; sip brew at [2][4]
            return supers -= 1 ;
        }

        ; else if(supers<=0)
        ; {
        ;     send, /out of supers {enter} ;
        ; }
    }
}

CheckHp(Brew)
{
    Global brews ;
    if(CheckImage("HP", "", "other\83hp.PNG")=1)
    {
        Inventory() ;
        if(brews>52)
        {
            MouseClick(0, 660, 365, 1500) ; sip brew at [3][4]
            return brews -= 1 ;
        }
        if(brews>48)
        {
            MouseClick(0, 710, 365, 1500) ; sip brew at [4][4]
            return brews -= 1 ;
        }
        if(brews>44)
        {
            MouseClick(0, 580, 400, 1500) ; sip brew at [1][5]
            return brews -= 1 ;
        }
        else if(brews>40)
        {
            MouseClick(0, 625, 400, 1500) ; sip brew at [2][5]
            return brews -= 1 ;
        }
        else if(brews>36)
        {
            MouseClick(0, 660, 400, 1500) ; sip brew at [3][5]
            return brews -= 1 ;
        }
        else if(brews>32)
        {
            MouseClick(0, 710, 400, 1500) ; sip brew at [4][5]
            return brews -= 1 ;
        }
        else if(brews>28)
        {
            MouseClick(0, 580, 435, 1500) ; sip brew at [1][6]
            return brews -= 1 ;
        }
        else if(brews>24)
        {
            MouseClick(0, 625, 435, 1500) ; sip brew at [2][6]
            return brews -= 1 ;
        }
        else if(brews>20)
        {
            MouseClick(0, 660, 435, 1500) ; sip brew at [3][6]
            return brews -= 1 ;
        }
        else if(brews>16)
        {
            MouseClick(0, 710, 435, 1500) ; sip brew at [4][6]
            return brews -= 1 ;
        }
        else if(brews>12)
        {
            MouseClick(0, 580, 470, 1500) ; sip brew at [1][7]
            return brews -= 1 ;
        }
        else if(brews>8)
        {
            MouseClick(0, 625, 470, 1500) ; sip brew at [2][7]
            return brews -= 1 ;
        }
        else if(brews>4)
        {
            MouseClick(0, 660, 470, 1500) ; sip brew at [3][7]
            return brews -= 1 ;
        }
        else if(brews>0)
        {
            MouseClick(0, 710, 470, 1500) ; sip brew at [4][7]
            return brews -= 1 ;
        }
        else if(brews<=0)
        {
            send, //out of brews {enter} ;
            outOfBrews := 1 ;
            return brews ;
        }
    }
}


;=======================COMBAT AND FIGHTING========================
Combat()
{
    MouseClick(0, 545, 215, 500) ; 
}


Special()
{
    MouseClick(0, 646, 449, 3000) ;
}


Auto(isOn)
{
    Combat() ;
    if(isOn=0)
    {
        if(CheckImage("auto", "", "other\autoOff.PNG")=0)
        {
            MouseClick(0, 654, 408, 500) ;
        }
    }
    else if(isOn=1)
    {
        MouseClick(0, 654, 408, 500) ;
    }

}

Fight(monster, deadMonsterPic, fightTime)
{
    ; for simple easy to kill monsters
    timeExceeded := 0 ;
    while(!CheckImage(monster, "", deadMonsterPic))
    {
        sleep 100() ;
        timeExceeded++ ;
        if(timeExceeded=fightTime/10)
        {
            send, //%monster% dead timed out {enter} ;
            return 1 ; returns after "fightTime"/10 seconds
        }
    }
    send, //%monster% dead {enter}
}
; ==================OTHER====================
PresetScreen()
{
    MouseClick(0, 565, 50, 100) ; minimap compass

	MouseClick(3, 205, 205, 50) ;
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

CheckImage(roomName, errorMsg, screenShot)
{
    Global room ;

    coordMode,pixel
    ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %screenShot%
    {
        if (ErrorLevel = 2)
        {
            send, //error level 2 %room% ;
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
    return ;
}

MouseClick(button, x, y, sleepTime)
{
    ; offset
    x += 5 ;
    y += 5 ;
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


Gear(runs)
{
    MouseClick(1, 260, 49, 750) ; right click banker
    MouseClick(0, 260, 88, 2000) ; bank

    MouseClick(0, 88, 82, 500) ;
	MouseClick(3, 205, 205, 50) ;
    Loop 10
    {
        Send {WheelUp} ; scroll up on bank tab
        sleep 25 ;
    }

    Loop 2
    {
        MouseClick(0, 440, 340, 1000) ; deposit inventory
    }

    Loop 10
    {
        Send {WheelUp} ; scroll up on bank tab
        sleep 25 ;
    }
    ; =====hammer, defender, amulet, overload, range pot,  9 supers, 14 brews
    MouseClick(0, 445, 160, 500) ; hammer
    Sleep 100 ;
    MouseClick(0, 445, 195, 500) ; defender
    Sleep 100 ;
    MouseClick(0, 445, 270, 500) ; fury

    Sleep 100 ;
    MouseClick(0, 140, 270, 500) ; overload(4)


    Sleep 200 ;
    MouseClick(0, 230, 270, 500) ; ranger pot(3)
    Sleep 100 ;
    MouseClick(0, 272, 119, 500) ; tbow
    Sleep 100 ;
    MouseClick(1, 50, 195, 1000) ; x super pots
    MouseClick(0, 50, 275, 1000) ; 10 super pots
    send, // ;
    Sleep 50 ;
    send, 8 ;
    Sleep 50 ;
    send, {enter} ;
    sleep 500 ;
    MouseClick(1, 95, 195, 1000) ; x brews
    MouseClick(0, 95, 275, 1000) ; x brews
    send, // ;
    Sleep 50 ;
    send, 1 ;
    Sleep 50 ;
    send, 4 ;
    Sleep 50 ;
    send, {enter} ;
    sleep 1000 ;

}

StartRaid()
{
    Heal() ;

    MouseClick(0, 743, 209, 750) ; spellbook
    MouseClick(0, 566, 321, 750) ; minigames
    MouseClick(0, 228, 95, 3500) ; raids 1 tp
    MouseClick(0, 602, 60, 6000) ; walk to front of door
    MouseClick(0, 200, 126, 3000) ; start raid
}

Heal()
{
    MouseClick(0, 743, 209, 750) ; spellbook
    MouseClick(0, 567, 249, 3500) ; edgeville teleport
	MouseClick(0, 336, 155, 1500) ; heal
	MouseClick(0, 377, 188, 1000) ; pray
}

Trade()
{
    Global supers := 32 ; supers restore 32 prayer points
    Global brews := 56 ; brews restore 16 hp

    sleep 20000 ; extra time it takes for mule to run through muttadile room

    MouseClick(1, 262, 188, 2000) ; right click to check if mule is present
    if(CheckImage("trade", "/mule not found", "other\tradeJstAznx.PNG")=1)
    {
        send, //trading {enter} ;
        MouseClick(0, 262, 241, 1000) ;
    }
    while(CheckImage("trade", "", "other\tradeInterface.PNG")=0)
    {
        sleep 1000 ;
    }
    i := 7 ;
    while(i<29)
    {
        Item(i) ;
        sleep 200 ;
        Item(i) ;
        sleep 200 ;
        i++ ;
    }
    while(CheckImage("Healing Room", "", "other\muleAcceptedTrade.PNG")=0)
    {
        sleep 1000 ;
    }
    MouseClick(0, 258, 212, 3000) ; offer trade
    MouseClick(0, 218, 329, 3500) ; accept trade

}





