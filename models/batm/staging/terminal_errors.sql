 SELECT 
        BT_ID as Terminal_ID
        ,Error_Type 
        ,Notification_Timestamp
    from 
             {{ source('batm', 'TERMINAL_ERRORS') }}

       -- "FIVETRAN_DATABASE"."MYSQL_RDS_BATM_CUSTOM"."TERMINAL_ERRORS"

