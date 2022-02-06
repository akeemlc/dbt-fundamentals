with downtime as (
 
 SELECT *
    FROM
         {{ source('batm', 'OFFLINE_ELAPSED_TIME') }}
       -- "FIVETRAN_DATABASE"."MYSQL_RDS_BATM_CUSTOM"."OFFLINE_ELAPSED_TIME"
)

select
       * from downtime