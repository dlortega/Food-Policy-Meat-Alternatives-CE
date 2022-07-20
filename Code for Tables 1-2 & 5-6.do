*use WTP_Analysis_Data.dta

*****************************************************
*                      Table 1                      *            
*                                                   *             
* Summary statistics of socio-demographic variables * 
*                                                   *             
*****************************************************
tab female
bys group: tab female
tabulate female group, chi2

sum age
bys group: sum age
mvtest means age, by(group)

tab income_5_group
bys group: tab income_5_group
tabulate income_label group, chi2

tab edu_code
bys group: tab edu_code
tabulate edu_code group, chi2

sum hh_size
bys group: sum hh_size
mvtest means hh_size, by(group)

tab kid
bys group: tab kid
tabulate kid group, chi2

tab citytier
bys group: tab citytier
tabulate citytier group, chi2

tab no_animal
bys group: tab no_animal
tabulate no_animal group, chi2

tab no_meat
bys group: tab no_meat
tabulate no_meat group, chi2

tab no_pork
bys group: tab no_pork
tabulate no_pork group, chi2

tab no_egg
bys group: tab no_egg
tabulate no_egg group, chi2

tab no_dairy
bys group: tab no_dairy
tabulate no_dairy group, chi2

tab restaurant_7_group
bys group: tab restaurant_7_group
tabulate freq_restaurant_label group, chi2

******************************************************************
*                            Table 2                             *
*                                                                *
* Summary statistics of food consumption and purchasing behavior * 
*                                                                *
******************************************************************
tab amount_pork
bys group: tab amount_pork
tabulate amount_pork group, chi2

tab meat_store
bys group: tab meat_store
tabulate meat_store group, chi2

tab do_supermarket
bys group: tab do_supermarket
tabulate do_supermarket group, chi2

tab wet_market
bys group: tab wet_market
tabulate wet_market group, chi2

tab in_supermarket
bys group: tab in_supermarket
tabulate in_supermarket group, chi2

tab online
bys group: tab online
tabulate online group, chi2

tab change_pork
bys group: tab change_pork
tabulate change_pork_label group, chi2

tab amount_tofu
bys group: tab amount_tofu
tabulate amount_tofu group, chi2

tab plantmeat_buy_d
bys group: tab plantmeat_buy_d
tabulate plantmeat_buy_d group, chi2

tab plantdish_buy_d
bys group: tab plantdish_buy_d
tabulate plantdish_buy_d group, chi2

tab omnipork_buy
bys group: tab omnipork_buy
tabulate omnipork_buy group, chi2

tab zhenmeat_buy
bys group: tab zhenmeat_buy
tabulate zhenmeat_buy group, chi2

tab beyond_buy
bys group: tab beyond_buy
tabulate beyond_buy group, chi2

tab godly_buy
bys group: tab godly_buy
tabulate godly_buy group, chi2

tab qishan_buy
bys group: tab qishan_buy
tabulate qishan_buy group, chi2

tab impossible_buy
bys group: tab impossible_buy
tabulate impossible_buy group, chi2

tab labmeat_hear_d
bys group: tab labmeat_hear_d
tabulate labmeat_hear_d group, chi2

****************************************************************
*                           Table 5                            *
*                                                              *
* Determinants of WTP for traditional and alternative products * 
*                                                              *
****************************************************************
reg wtp_pork age female i.income_4_group college hh_size kid no_meat i.amount_pork_re  online in_supermarket do_supermarket meat_store wet_market i.plantmeat_buy_d i.labmeat_hear_d i.treat if treat!=5, robust
reg wtp_tofu age female i.income_4_group college hh_size kid no_meat i.amount_pork_re  online in_supermarket do_supermarket meat_store wet_market i.plantmeat_buy_d i.labmeat_hear_d i.treat if treat!=5, robust 
reg wtp_plant age female i.income_4_group college hh_size kid no_meat i.amount_pork_re online in_supermarket do_supermarket meat_store wet_market i.plantmeat_buy_d i.labmeat_hear_d i.treat if treat!=5, robust
reg wtp_lab age female i.income_4_group college hh_size kid no_meat i.amount_pork_re online in_supermarket do_supermarket meat_store wet_market i.plantmeat_buy_d i.labmeat_hear_d i.treat if treat!=5, robust

****************************************************************
*                           Table 6                            *
*                                                              *
* Determinants of WTP in an away from home purchasing occasion * 
*                                                              *
****************************************************************
reg wtp_pork age female i.income_4_group college hh_size kid no_meat i.amount_pork_re  i.restaurant_5_group i.plantdish_buy_d i.labmeat_hear_d if treat==5, robust
reg wtp_tofu age female i.income_4_group college hh_size kid no_meat i.amount_pork_re i.restaurant_5_group i.plantdish_buy_d i.labmeat_hear_d if treat==5, robust 
reg wtp_plant age female i.income_4_group college hh_size kid no_meat i.amount_pork_re i.restaurant_5_group i.plantdish_buy_d i.labmeat_hear_d if treat==5, robust
reg wtp_lab age female i.income_4_group college hh_size kid no_meat i.amount_pork_re i.restaurant_5_group i.plantdish_buy_d i.labmeat_hear_d if treat==5, robust



















