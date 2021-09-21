#NoEnv  ; start at east side of deposit box, make sure preset withdraw is 13, 13 rings per inv



ClickForMe(){
Loop 150{
	click, 225, 194 ; click on bank, should be tile to the left
	sleep 750 ;
	click, right, 582, 253 ; select item in invent [1][1]
	sleep 500 ;
	click, 582, 325 ; bank all
	sleep 300 ;


	click, right, 404, 273 ; right click item [11][5] in bank
	sleep 300 ;
	click, 404, 293 ; withdraw 13
	sleep 300 ;
	click, right, 448, 273 ; right click item [12][5] in bank
	sleep 300 ;
	click, 448, 293 ; withdraw 13
	sleep 300 ;
	click, 485, 45 ; close bank
	sleep 300 ;

	click, 258, 36 ; clicks on pottery oven
	sleep 2700 ;
	click, right, 302, 130 ; right click dragonstone ring
	sleep 300 ;
	click, 302, 179 ; make 10
	sleep 750 ;
	click, 256, 168 ; click on furnace again ;
	sleep 750 ;
	click, right, 302, 130 ; right click dragonstone ring
	sleep 300 ;
	click, 302, 179 ; make 10
	sleep 500 ;
	click, 648, 130 ; move to bank side
	sleep 2700 ;
	



	}
return
}

`::ClickForMe()


Esc::ExitApp  ;
