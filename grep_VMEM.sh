if [ $# -lt 1 ]; then
        echo "Usage: $0 <File to grep>"
        exit    
else                    
        CSVFILE=$1
fi      
gunzip /data/master/gpseg-1/pg_log/${CSVFILE}.csv.gz
grep VMEM /data/master/gpseg-1/pg_log/${CSVFILE}.csv > /data/master/gpseg-1/pg_log/${CSVFILE}.csv.vmem
VMEMFILE=/data/master/gpseg-1/pg_log/${CSVFILE}.csv.vmem
cat $VMEMFILE | grep accounting_transaction
cat $VMEMFILE | grep authorizations_w_clearings_ins_2stage_authorization
cat $VMEMFILE | grep authorizations_w_clearings_ins_auth_match_id
cat $VMEMFILE | grep authorizations_w_clearings_ins_auth_refnum
cat $VMEMFILE | grep authorizations_w_clearings_ins_balancebox
cat $VMEMFILE | grep authorizations_w_clearings_ins_zero_amount_auth_refunds
cat $VMEMFILE | grep card_data__card
cat $VMEMFILE | grep card_data__card_intervals
cat $VMEMFILE | grep card_data__card_status_history
cat $VMEMFILE | grep card_data__card_status_history_intervals
cat $VMEMFILE | grep creator__aaccount
cat $VMEMFILE | grep creator__aaccount_intervals
cat $VMEMFILE | grep debit_card_balance
cat $VMEMFILE | grep debit_card_operations_authorizations_w_clearings
cat $VMEMFILE | grep k_app__operation2
cat $VMEMFILE | grep k_app__user_card
cat $VMEMFILE | grep k_app__user_card_intervals
cat $VMEMFILE | grep k_app__users
cat $VMEMFILE | grep k_app__users_intervals
cat $VMEMFILE | grep market__currency_rates_official_v
cat $VMEMFILE | grep plastic_card
cat $VMEMFILE | grep plastic_card_assembled
cat $VMEMFILE | grep plastic_card_card_active
cat $VMEMFILE | grep plastic_card_credit
cat $VMEMFILE | grep plastic_card_debit
cat $VMEMFILE | grep plastic_card_dedup
cat $VMEMFILE | grep plastic_card_first_card_binding
cat $VMEMFILE | grep plastic_card_state_machine_history_pickup
cat $VMEMFILE | grep plastic_card_statuses
cat $VMEMFILE | grep public__cpd_state_machine
cat $VMEMFILE | grep public__cpd_state_machine_intervals
cat $VMEMFILE | grep public__uzum_market_order
rm $VMEMFILE
gzip /data/master/gpseg-1/pg_log/${CSVFILE}.csv
