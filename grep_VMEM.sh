#!/usr/bin/bash

# Look for 'VMEM' and dbt model name in arr list in greenplum log file

if [ $# -lt 1 ]; then
        echo "Usage: $0 <File to grep>"
        exit
else
        CSVFILE=$1
fi
BASEURL=/data/master/gpseg-1/pg_log
gunzip $BASEURL/${CSVFILE}.csv.gz
grep VMEM $BASEURL/${CSVFILE}.csv > $BASEURL/${CSVFILE}.csv.vmem
VMEMFILE=$BASEURL/${CSVFILE}.csv.vmem

# Find these arr items 
declare -a arr=(
"accounting_transaction" 
"authorizations_w_clearings_ins_2stage_authorization" 
"authorizations_w_clearings_ins_auth_match_id"
"authorizations_w_clearings_ins_auth_refnum" 
"authorizations_w_clearings_ins_balancebox" 
"authorizations_w_clearings_ins_zero_amount_auth_refunds"
"card_data__card" 
"card_data__card_intervals" 
"card_data__card_status_history" 
"card_data__card_status_history_intervals"
"creator__aaccount"
"creator__aaccount_intervals"
"debit_card_balance"
"debit_card_operations_authorizations_w_clearings"
"k_app__operation"
"k_app__user_card"
"k_app__user_card_intervals"
"k_app__users"
"k_app__users_intervals"
"market__currency_rates_official_v"
"plastic_card"
"plastic_card_assembled"
"plastic_card_card_active"
"plastic_card_credit"
"plastic_card_debit"
"plastic_card_dedup"
"plastic_card_first_card_binding"
"plastic_card_state_machine_history_pickup"
"plastic_card_statuses"
"public__cpd_state_machine"
"public__cpd_state_machine_intervals"
"public__uzum_market_order"
)

for i in "${arr[@]}"
do
#       echo "$i"
        cat $VMEMFILE | grep $i
done

rm $VMEMFILE
gzip $BASEURL/${CSVFILE}.csv
