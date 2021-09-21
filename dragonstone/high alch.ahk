#NoEnv  ; start at east side of deposit box

Esc::ExitApp  ;


ClickForMe(){
Loop 1000{
	click, 744, 212 ;
	Loop 10{

		click, 664, 363 ;
		sleep 1100 ;

	}

	}
return
}

`::ClickForMe()
