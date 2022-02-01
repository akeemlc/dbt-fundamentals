with location as (
 
 SELECT *
    from 
          FIVETRAN_DATABASE.MYSQL_RDS_BATM_DUMP.location
           -- FIVETRAN_DATABASE.MYSQL_RDS_BATM_DUMP.DMP_FINANCE_VOLUME_AND_TRANSACTIONS --where store_id = 'LCA1337'
    

)
select * from location