

ClickForMe(){
Loop 17{
	click, 300, 185 ; click on bank, should be tile to the right
	sleep 1250 ; 
	click, right, 585, 469 ; bank all
	sleep 1000 ;
	click ;
	click, right, 454, 163 ;get logs in bank at most right, second from bottom 
	sleep 700 ;
	click, 454, 239 ;
	sleep 700 ;
	click, 492, 57 ; close bank interface
	sleep 700 ;
	click, 581, 252 ; select knife
	sleep 700 ;
	click, 624, 252 ; select log to the right
	sleep 1000 ; 
	click, right, 416, 448 ; fletch bow
	sleep 1000 ;
	click, 416, 503 ; make x
	sleep 1000 ; 
	send, /27 ;
	sleep 700 ;
	send, {Enter} ;
	sleep 64000 ; wait 50 seconds for all logs to finish fletching

	}
return
}

`::ClickForMe()


Esc::ExitApp  ;