use CE_data.dta
keep id responseid q45-q255 condition group block treat

* 5alternatives*9questions 
expand 45

sort responseid

* replace missing value with 0 in choice experiment questions 
// there are missing vaules if the particiapant is not in the block or group.
forvalues i=45/53{
replace q`i'=0 if q`i'==.
}

forvalues i=55/63{
replace q`i'=0 if q`i'==.
}

forvalues i=65/73{
replace q`i'=0 if q`i'==.
}

forvalues i=75/83{
replace q`i'=0 if q`i'==.
}

forvalues i=86/94{
replace q`i'=0 if q`i'==.
}

forvalues i=97/105{
replace q`i'=0 if q`i'==.
}

forvalues i=108/116{
replace q`i'=0 if q`i'==.
}

forvalues i=119/127{
replace q`i'=0 if q`i'==.
}

forvalues i=130/138{
replace q`i'=0 if q`i'==.
}

forvalues i=141/149{
replace q`i'=0 if q`i'==.
}

forvalues i=152/160{
replace q`i'=0 if q`i'==.
}

forvalues i=163/171{
replace q`i'=0 if q`i'==.
}

forvalues i=174/182{
replace q`i'=0 if q`i'==.
}
forvalues i=185/193{
replace q`i'=0 if q`i'==.
}
forvalues i=196/204{
replace q`i'=0 if q`i'==.
}
forvalues i=207/215{
replace q`i'=0 if q`i'==.
}
forvalues i=217/225{
replace q`i'=0 if q`i'==.
}
forvalues i=227/235{
replace q`i'=0 if q`i'==.
}
forvalues i=237/245{
replace q`i'=0 if q`i'==.
}
forvalues i=247/255{
replace q`i'=0 if q`i'==.
}

* creat 9 questions without distinguishing blocks and groups
gen q1=q45+q55+q65+q75+q86+q97+q108+q119+q130+q141+q152+q163+q174+q185+q196+q207+q217+q227+q237+q247
gen q2=q46+q56+q66+q76+q87+q98+q109+q120+q131+q142+q153+q164+q175+q186+q197+q208+q218+q228+q238+q248
gen q3=q47+q57+q67+q77+q88+q99+q110+q121+q132+q143+q154+q165+q176+q187+q198+q209+q219+q229+q239+q249
gen q4=q48+q58+q68+q78+q89+q100+q111+q122+q133+q144+q155+q166+q177+q188+q199+q210+q220+q230+q240+q250
gen q5=q49+q59+q69+q79+q90+q101+q112+q123+q134+q145+q156+q167+q178+q189+q200+q211+q221+q231+q241+q251
gen q6=q50+q60+q70+q80+q91+q102+q113+q124+q135+q146+q157+q168+q179+q190+q201+q212+q222+q232+q242+q252
gen q7=q51+q61+q71+q81+q92+q103+q114+q125+q136+q147+q158+q169+q180+q191+q202+q213+q223+q233+q243+q253
gen q8=q52+q62+q72+q82+q93+q104+q115+q126+q137+q148+q159+q170+q181+q192+q203+q214+q224+q234+q244+q254
gen q9=q53+q63+q73+q83+q94+q105+q116+q127+q138+q149+q160+q171+q182+q193+q204+q215+q225+q235+q245+q255

* creat 9 sets
bys responseid: gen row=_n
gen set=1
replace set=2 if row>5 & row<11
replace set=3 if row>10 & row<16
replace set=4 if row>15 & row<21
replace set=5 if row>20 & row<26
replace set=6 if row>25 & row<31
replace set=7 if row>30 & row<36
replace set=8 if row>35 & row<41
replace set=9 if row>40 & row<46

* match real choice with set
gen real_choice=0
forvalues i=1/9{
replace real_choice=q`i' if set==`i'
}

* creat 5 alternatives within each set
bys responseid set: gen alternative=_n

* creat dummy choice
gen choice=0
replace choice=1 if real_choice==alternative

* experiment price level
gen price_experiment=-1 //no buy option
replace price_experiment=2 if block=="1" & set==1 & alternative==1
replace price_experiment=1 if block=="1" & set==1 & alternative==2
replace price_experiment=2 if block=="1" & set==1 & alternative==3
replace price_experiment=1 if block=="1" & set==1 & alternative==4

replace price_experiment=1 if block=="1" & set==2 & alternative==1
replace price_experiment=1 if block=="1" & set==2 & alternative==2
replace price_experiment=5 if block=="1" & set==2 & alternative==3
replace price_experiment=5 if block=="1" & set==2 & alternative==4

replace price_experiment=4 if block=="1" & set==3 & alternative==1
replace price_experiment=4 if block=="1" & set==3 & alternative==2
replace price_experiment=3 if block=="1" & set==3 & alternative==3
replace price_experiment=5 if block=="1" & set==3 & alternative==4

replace price_experiment=0 if block=="1" & set==4 & alternative==1
replace price_experiment=2 if block=="1" & set==4 & alternative==2
replace price_experiment=0 if block=="1" & set==4 & alternative==3
replace price_experiment=2 if block=="1" & set==4 & alternative==4

replace price_experiment=2 if block=="1" & set==5 & alternative==1
replace price_experiment=2 if block=="1" & set==5 & alternative==2
replace price_experiment=3 if block=="1" & set==5 & alternative==3
replace price_experiment=3 if block=="1" & set==5 & alternative==4

replace price_experiment=5 if block=="1" & set==6 & alternative==1
replace price_experiment=5 if block=="1" & set==6 & alternative==2
replace price_experiment=4 if block=="1" & set==6 & alternative==3
replace price_experiment=3 if block=="1" & set==6 & alternative==4

replace price_experiment=1 if block=="1" & set==7 & alternative==1
replace price_experiment=0 if block=="1" & set==7 & alternative==2
replace price_experiment=1 if block=="1" & set==7 & alternative==3
replace price_experiment=0 if block=="1" & set==7 & alternative==4

replace price_experiment=0 if block=="1" & set==8 & alternative==1
replace price_experiment=0 if block=="1" & set==8 & alternative==2
replace price_experiment=4 if block=="1" & set==8 & alternative==3
replace price_experiment=4 if block=="1" & set==8 & alternative==4

replace price_experiment=3 if block=="1" & set==9 & alternative==1
replace price_experiment=3 if block=="1" & set==9 & alternative==2
replace price_experiment=5 if block=="1" & set==9 & alternative==3
replace price_experiment=4 if block=="1" & set==9 & alternative==4

replace price_experiment=1 if block=="2" & set==1 & alternative==1
replace price_experiment=5 if block=="2" & set==1 & alternative==2
replace price_experiment=2 if block=="2" & set==1 & alternative==3
replace price_experiment=2 if block=="2" & set==1 & alternative==4

replace price_experiment=5 if block=="2" & set==2 & alternative==1
replace price_experiment=4 if block=="2" & set==2 & alternative==2
replace price_experiment=4 if block=="2" & set==2 & alternative==3
replace price_experiment=2 if block=="2" & set==2 & alternative==4

replace price_experiment=5 if block=="2" & set==3 & alternative==1
replace price_experiment=2 if block=="2" & set==3 & alternative==2
replace price_experiment=2 if block=="2" & set==3 & alternative==3
replace price_experiment=4 if block=="2" & set==3 & alternative==4

replace price_experiment=2 if block=="2" & set==4 & alternative==1
replace price_experiment=3 if block=="2" & set==4 & alternative==2
replace price_experiment=0 if block=="2" & set==4 & alternative==3
replace price_experiment=0 if block=="2" & set==4 & alternative==4

replace price_experiment=3 if block=="2" & set==5 & alternative==1
replace price_experiment=5 if block=="2" & set==5 & alternative==2
replace price_experiment=5 if block=="2" & set==5 & alternative==3
replace price_experiment=0 if block=="2" & set==5 & alternative==4

replace price_experiment=3 if block=="2" & set==6 & alternative==1
replace price_experiment=0 if block=="2" & set==6 & alternative==2
replace price_experiment=0 if block=="2" & set==6 & alternative==3
replace price_experiment=5 if block=="2" & set==6 & alternative==4

replace price_experiment=0 if block=="2" & set==7 & alternative==1
replace price_experiment=4 if block=="2" & set==7 & alternative==2
replace price_experiment=1 if block=="2" & set==7 & alternative==3
replace price_experiment=1 if block=="2" & set==7 & alternative==4

replace price_experiment=4 if block=="2" & set==8 & alternative==1
replace price_experiment=3 if block=="2" & set==8 & alternative==2
replace price_experiment=3 if block=="2" & set==8 & alternative==3
replace price_experiment=1 if block=="2" & set==8 & alternative==4

replace price_experiment=4 if block=="2" & set==9 & alternative==1
replace price_experiment=1 if block=="2" & set==9 & alternative==2
replace price_experiment=1 if block=="2" & set==9 & alternative==3
replace price_experiment=3 if block=="2" & set==9 & alternative==4

replace price_experiment=2 if block=="3" & set==1 & alternative==1
replace price_experiment=4 if block=="3" & set==1 & alternative==2
replace price_experiment=1 if block=="3" & set==1 & alternative==3
replace price_experiment=4 if block=="3" & set==1 & alternative==4

replace price_experiment=4 if block=="3" & set==2 & alternative==1
replace price_experiment=5 if block=="3" & set==2 & alternative==2
replace price_experiment=1 if block=="3" & set==2 & alternative==3
replace price_experiment=2 if block=="3" & set==2 & alternative==4

replace price_experiment=5 if block=="3" & set==3 & alternative==1
replace price_experiment=1 if block=="3" & set==3 & alternative==2
replace price_experiment=3 if block=="3" & set==3 & alternative==3
replace price_experiment=2 if block=="3" & set==3 & alternative==4

replace price_experiment=0 if block=="3" & set==4 & alternative==1
replace price_experiment=5 if block=="3" & set==4 & alternative==2
replace price_experiment=2 if block=="3" & set==4 & alternative==3
replace price_experiment=5 if block=="3" & set==4 & alternative==4

replace price_experiment=5 if block=="3" & set==5 & alternative==1
replace price_experiment=3 if block=="3" & set==5 & alternative==2
replace price_experiment=2 if block=="3" & set==5 & alternative==3
replace price_experiment=0 if block=="3" & set==5 & alternative==4

replace price_experiment=3 if block=="3" & set==6 & alternative==1
replace price_experiment=2 if block=="3" & set==6 & alternative==2
replace price_experiment=4 if block=="3" & set==6 & alternative==3
replace price_experiment=0 if block=="3" & set==6 & alternative==4

replace price_experiment=1 if block=="3" & set==7 & alternative==1
replace price_experiment=3 if block=="3" & set==7 & alternative==2
replace price_experiment=0 if block=="3" & set==7 & alternative==3
replace price_experiment=3 if block=="3" & set==7 & alternative==4

replace price_experiment=3 if block=="3" & set==8 & alternative==1
replace price_experiment=4 if block=="3" & set==8 & alternative==2
replace price_experiment=0 if block=="3" & set==8 & alternative==3
replace price_experiment=1 if block=="3" & set==8 & alternative==4

replace price_experiment=4 if block=="3" & set==9 & alternative==1
replace price_experiment=0 if block=="3" & set==9 & alternative==2
replace price_experiment=5 if block=="3" & set==9 & alternative==3
replace price_experiment=1 if block=="3" & set==9 & alternative==4

replace price_experiment=1 if block=="4" & set==1 & alternative==1
replace price_experiment=5 if block=="4" & set==1 & alternative==2
replace price_experiment=3 if block=="4" & set==1 & alternative==3
replace price_experiment=4 if block=="4" & set==1 & alternative==4

replace price_experiment=1 if block=="4" & set==2 & alternative==1
replace price_experiment=2 if block=="4" & set==2 & alternative==2
replace price_experiment=4 if block=="4" & set==2 & alternative==3
replace price_experiment=1 if block=="4" & set==2 & alternative==4

replace price_experiment=5 if block=="4" & set==3 & alternative==1
replace price_experiment=2 if block=="4" & set==3 & alternative==2
replace price_experiment=0 if block=="4" & set==3 & alternative==3
replace price_experiment=4 if block=="4" & set==3 & alternative==4

replace price_experiment=2 if block=="4" & set==4 & alternative==1
replace price_experiment=3 if block=="4" & set==4 & alternative==2
replace price_experiment=4 if block=="4" & set==4 & alternative==3
replace price_experiment=5 if block=="4" & set==4 & alternative==4

replace price_experiment=2 if block=="4" & set==5 & alternative==1
replace price_experiment=0 if block=="4" & set==5 & alternative==2
replace price_experiment=5 if block=="4" & set==5 & alternative==3
replace price_experiment=2 if block=="4" & set==5 & alternative==4

replace price_experiment=3 if block=="4" & set==6 & alternative==1
replace price_experiment=0 if block=="4" & set==6 & alternative==2
replace price_experiment=1 if block=="4" & set==6 & alternative==3
replace price_experiment=5 if block=="4" & set==6 & alternative==4

replace price_experiment=0 if block=="4" & set==7 & alternative==1
replace price_experiment=4 if block=="4" & set==7 & alternative==2
replace price_experiment=5 if block=="4" & set==7 & alternative==3
replace price_experiment=3 if block=="4" & set==7 & alternative==4

replace price_experiment=0 if block=="4" & set==8 & alternative==1
replace price_experiment=1 if block=="4" & set==8 & alternative==2
replace price_experiment=3 if block=="4" & set==8 & alternative==3
replace price_experiment=0 if block=="4" & set==8 & alternative==4

replace price_experiment=4 if block=="4" & set==9 & alternative==1
replace price_experiment=1 if block=="4" & set==9 & alternative==2
replace price_experiment=2 if block=="4" & set==9 & alternative==3
replace price_experiment=3 if block=="4" & set==9 & alternative==4

* actual price level
gen price_actual=0 // no buy option
replace price_actual=price_experiment*8+12 if price_experiment!=-1 & group!="R"
replace price_actual=price_experiment*4+4 if price_experiment!=-1 & group=="R"


* products matrix
gen pork=0
replace pork=1 if alternative==1

gen tofu=0
replace tofu=1 if alternative==2

gen plant=0
replace plant=1 if alternative==3

gen lab=0
replace lab=1 if alternative==4

gen no_buy=0
replace no_buy=1 if alternative==5

sort id set alternative 



