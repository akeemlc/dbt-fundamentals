with atm_performance as (

    select
         serialnumber,
         cashamount , datetime ,month ,YEAR ,transaction_type ,city 
    from fivetran_Database.mysql_rds_batm_dump.DMP_FINANCE_VOLUME_AND_TRANSACTIONS

)
select * from atm_performance