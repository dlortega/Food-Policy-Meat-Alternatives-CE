gen treatment="C"
replace treatment="A" if treat==2
replace treatment="E" if treat==3
replace treatment="H" if treat==4
replace treatment="R" if treat==5

***summary statistics***

**gender
sum male
bys treatment: sum male
tabulate male treatment, chi2

**age
sum age
bys treatment: sum age
tabulate age group1, chi2

**income
tab income_label
tabulate income_label treatment, chi2

**education
tab edu_label
bys treatment: tab edu_label
tabulate edu_label treatment, chi2
tab edu
gen highschool_above=1
replace highschool_above=0 if edu==1
gen college_above=1
replace college_above=0 if edu==1 | edu==2 | edu==3
bys group1: sum highschool_above college_above
sum highschool_above college_above
tabulate highschool_above group1, chi2
tabulate college_above group1, chi2

**citytier
tab citytier
bys treatment: tab citytier
tabulate citytier treatment, chi2

**open ended question
sum pay_pork pay_tofu pay_plant pay_lab pay_milk pay_soy pay_oat pay_rice
bys group1: sum pay_pork pay_tofu pay_plant pay_lab pay_milk pay_soy pay_oat pay_rice

sum prem_tofu prem_plant prem_lab prem_soy prem_oat prem_rice
bys group1: sum prem_tofu prem_plant prem_lab prem_soy prem_oat prem_rice



**food restrict
sum no_restrict no_pork no_fish no_egg no_dairy no_animal no_meat
bys treatment:sum no_restrict no_pork no_fish no_egg no_dairy no_animal no_meat
tabulate no_restrict treat, chi2
tabulate no_pork treat, chi2
tabulate no_dairy treat, chi2
tabulate no_animal treat, chi2
tabulate no_meat treat, chi2
tabulate no_fish treat, chi2
tabulate no_egg treat, chi2



**neophobia score
sum neoph_score
bys treatment: sum neoph_score
mvtest means neoph_score, by(treatment)

**involvement score
sum involve_score
bys treatment: sum involve_score
mvtest means involve_score, by(treatment)

**place to buy pork
sum online in_supermarket do_supermarket meat_store wet_market
bys treatment: sum online in_supermarket do_supermarket meat_store wet_market
tabulate in_supermarket treat, chi2
tabulate do_supermarket  treat, chi2
tabulate meat_store treat, chi2
tabulate wet_market treat, chi2
tabulate online treat, chi2


**amount 
tab freq_restaurant_label 
bys treatment: tab freq_restaurant_label 
tabulate freq_restaurant treatment, chi2

tab amount_pork_label 
bys treatment: tab amount_pork_label 
tabulate amount_pork_label treatment, chi2

bys treatment: tab reduce_pork_label
tab reduce_pork_label
tabulate reduce_pork_label treatment, chi2

bys treatment: tab change_pork_label
tab change_pork_label
tabulate change_pork_label treatment, chi2

**attitudes
bys treatment: tab envir_tofu_label
tab envir_tofu_label
tabulate envir_tofu_label treatment, chi2

bys treatment: tab envir_plant_label
tab envir_plant_label
tabulate envir_plant_label treatment, chi2

bys treatment: tab envir_lab_label
tab envir_lab_label
tabulate envir_lab_label treatment, chi2

bys treatment: tab animal_tofu_label
tab animal_tofu_label
tabulate animal_tofu_label treatment, chi2

bys treatment: tab animal_plant_label
tab animal_plant_label
tabulate animal_plant_label treatment, chi2

bys treatment: tab animal_lab_label
tab animal_lab_label
tabulate animal_lab_label treatment, chi2

bys treatment: tab health_tofu_label
tab health_tofu_label
tabulate health_tofu_label treatment, chi2

bys treatment: tab health_plant_label
tab health_plant_label
tabulate health_plant_label treatment, chi2

bys treatment: tab health_lab_label
tab health_lab_label
tabulate health_lab_label treatment, chi2

////

bys treatment: tab envir_soy_label
tab envir_soy_label
tabulate envir_soy_label treatment, chi2

bys treatment: tab envir_oat_label
tab envir_oat_label
tabulate envir_oat_label treatment, chi2

bys treatment: tab envir_rice_label
tab envir_rice_label
tabulate envir_rice_label treatment, chi2

bys treatment: tab animal_soy_label
tab animal_soy_label
tabulate animal_soy_label treatment, chi2

bys treatment: tab animal_oat_label
tab animal_oat_label
tabulate animal_oat_label treatment, chi2

bys treatment: tab animal_rice_label
tab animal_rice_label
tabulate animal_rice_label treatment, chi2

bys treatment: tab health_soy_label
tab health_soy_label
tabulate health_soy_label treatment, chi2

bys treatment: tab health_oat_label
tab health_oat_label
tabulate health_oat_label treatment, chi2

bys treatment: tab health_rice_label
tab health_rice_label
tabulate health_rice_label treatment, chi2

////
bys group1: sum zhenmeat_buy
sum zhenmeat_buy
tabulate zhenmeat_buy group1, chi2

bys group1: sum omnipork_buy
sum omnipork_buy
tabulate omnipork_buy group1, chi2

bys group1: sum beyond_buy
sum beyond_buy
tabulate beyond_buy group1, chi2

bys group1: sum impossible_buy
sum impossible_buy
tabulate impossible_buy group1, chi2

bys group1: sum qishan_buy
sum qishan_buy
tabulate qishan_buy group1, chi2

bys group1: sum godly_buy
sum godly_buy
tabulate godly_buy group1, chi2

bys group1: sum soy_buy
sum soy_buy
tabulate soy_buy group1, chi2

bys group1: sum oat_buy
sum oat_buy
tabulate oat_buy group1, chi2

bys group1: sum rice_buy
sum rice_buy
tabulate rice_buy group1, chi2


////
bys treatment: sum pay_pork, detail
sum pay_pork, detail

bys treatment: sum pay_tofu, detail
sum pay_tofu, detail

bys treatment: sum pay_plant, detail
sum pay_plant, detail

bys treatment: sum pay_lab, detail
sum pay_lab, detail

bys treatment: sum pay_milk, detail
sum pay_milk, detail

bys treatment: sum pay_soy, detail
sum pay_soy, detail

bys treatment: sum pay_oat, detail
sum pay_oat, detail

bys treatment: sum pay_rice, detail
sum pay_rice, detail

gen pay_pork_0=0
replace pay_pork_0=1 if pay_pork!=0
gen pay_tofu_0=0
replace pay_tofu_0=1 if pay_tofu!=0
gen pay_plant_0=0
replace pay_plant_0=1 if pay_plant!=0
gen pay_lab_0=0
replace pay_lab_0=1 if pay_lab!=0
gen pay_milk_0=0
replace pay_milk_0=1 if pay_milk!=0
gen pay_soy_0=0
replace pay_soy_0=1 if pay_soy!=0
gen pay_oat_0=0
replace pay_oat_0=1 if pay_oat!=0
gen pay_rice_0=0
replace pay_rice_0=1 if pay_rice!=0

bys treatment: sum prem_tofu, detail
sum prem_tofu, detail

bys treatment: sum prem_plant, detail
sum prem_plant, detail

bys treatment: sum prem_lab, detail
sum prem_lab, detail


bys treatment: sum prem_soy, detail
sum prem_soy, detail

bys treatment: sum prem_oat, detail
sum prem_oat, detail

bys treatment: sum prem_rice, detail
sum prem_rice, detail





///
tab amount_tofu_label 
bys treatment: tab amount_tofu_label 
tabulate amount_tofu_label treatment, chi2

tab amount_milk_label
bys treatment: tab amount_milk_label
tabulate amount_milk_label treatment, chi2

tab amount_soy_label 
bys treatment: tab amount_soy_label 
tabulate amount_soy_label treatment, chi2


tab amount_othermilk_label
bys group1: tab amount_othermilk_label

sum plantmeat_buy_d plantdish_buy_d plantmilk_buy_d
bys group1: sum plantmeat_buy_d plantdish_buy_d plantmilk_buy_d
tabulate plantmeat_buy_d group1, chi2
tabulate plantmilk_buy_d group1, chi2

**family member
gen household_size = num_adult+num_nonadult
tabulate num_nonadult treatment, chi2
mvtest means household_size, by(treatment)

sum household_size
bys treatment: sum household_size

gen kid=1
replace kid=0 if num_nonadult==0
mvtest means kid, by(treatment)


**plant meat consumption
bys treatment: sum plantmeat_buy_d
sum plantmeat_buy_d
tabulate plantmeat_buy_d treatment, chi2

bys treatment: sum labmeat_hear_d
sum labmeat_hear_d
tabulate labmeat_hear_d treatment, chi2

**brand
bys treatment: sum godly_buy
sum godly_buy
tabulate godly_buy treatment, chi2

bys treatment: sum qishan_buy
sum qishan_buy
tabulate qishan_buy treatment, chi2

bys treatment: sum impossible_buy
sum impossible_buy
tabulate impossible_buy treatment, chi2

bys treatment: sum beyond_buy
sum beyond_buy
tabulate beyond_buy treatment, chi2

bys treatment: sum omnipork_buy
sum omnipork_buy
tabulate omnipork_buy treatment, chi2

bys treatment: sum zhenmeat_buy
sum zhenmeat_buy
tabulate zhenmeat_buy treatment, chi2

