#NoEnv  ; start at east side of deposit box, gold ore at [12][3] in bank, 55x27 = 1500 ores, MADE FOR LAG, subtract 300ish from each sleep if not laggy


ClickForMe(){
Loop 55{
	click, 225, 194 ; click on bank, should be tile to the left
	sleep 1050 ; 
	click, right, 582, 253 ; select item in invent [1][1]
	sleep 800 ;
	click, 582, 325 ; bank all, no need for sleep after
	click, right, 450, 196 ; right click bank item [12][3]
	sleep 800 ;
	click, 450, 260 ; withdraw all
	click, 484, 43 ; close bank interface
	sleep 800 ;

	click, 197, 65 ; click on furnace
	sleep 4000 ; time to walk from bank to furnace
	click, right, 286, 440 ; right click gold bar
	sleep 500 ;
	click, 286, 503 ; smelt x DO NOT NEED TO ACTUALLY PUT IN AMT
	sleep 36000 ; time for full inv to finish

	click, 295, 303 ; move back to bank
	sleep 4000 ; time to walk back from furnace to bank

	}
return
}

`::ClickForMe()


Esc::ExitApp  ;
