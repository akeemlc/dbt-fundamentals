with terminal as (
 
 SELECT *
    from 
        "FIVETRAN_DATABASE"."MYSQL_RDS_BATM_DUMP"."TERMINALDEPLOYMENT"

)
select case when deployedto is null then 'Active' else 'In Active' end as Status , * from terminal