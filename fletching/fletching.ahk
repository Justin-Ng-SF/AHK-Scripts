

ClickForMe(){
Loop 17{
	click, 300, 185 ; click on bank, should be tile to the right
	sleep 750 ; 
	click, right, 585, 469 ; bank all
	sleep 500 ;
	click ;
	click, right, 447, 261 ;get logs in bank at most right, second from bottom 
	sleep 500 ;
	click ;
	sleep 500 ;
	click, 484, 43 ; close bank interface
	sleep 500 ;
	click, 581, 252 ; select knife
	sleep 500 ;
	click, 624, 252 ; select log to the right
	sleep 1000 ; 
	click, right, 318, 448 ; fletch bow
	sleep 1000 ;
	click, 318, 503 ; make x
	sleep 1000 ; 
	send, /27 ;
	sleep 500 ;
	send, {Enter} ;
	sleep 50000 ; wait 50 seconds for all logs to finish fletching

	}
return
}

`::ClickForMe()


Esc::ExitApp  ;