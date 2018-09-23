 
* load data
use 05_russia_data, clear

* summarize data
su _share all_observers

* party tabs
tab party

* Incumbent party vote share, by treatment status
tabstat _share if party == "United Russia", by(all_observers)

* make figure 1
twoway (bar mean_share party_treat if all_observers ==0, color(gs13)) (bar mean_share party_treat if all_observers ==1, color(gs6)) (rcap hi low party_treat, color(gs4)), ysc(r(0 0.5)) legend( order(2 "Treatment group" 1 "Control group") ) xlabel( 1.5 "UR" 4.5 "JR" 7.5 "LDPR" 10.5 "Communists" 13.5 "Yabloko" 16.6 "Turnout", noticks) xtitle(" ") ytitle("Mean vote shares") title("Experimental results")
drop mean_share sd m hi low
