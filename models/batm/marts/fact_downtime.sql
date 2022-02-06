with downtime as (
 
  select * from {{ ref('atm_offline')}}
)
,
error as (
 
   select * from {{ ref('terminal_errors')}}

)
, batm_error as 
(
   select * from downtime a left join error b on a.BT_ID = b.Terminal_ID
)

, final as 
(
select 

       BT_ID As Terminal_ID , to_date(offline_start) as date_created
      ,error_type
      ,count( error_type) as ErrorType_count
      ,sum(datediff(day, offline_start, offline_end)) day
      ,sum(datediff(hour, offline_start, offline_end)) hours
      ,sum(datediff(minute,  offline_start, offline_end)) minutes
      ,sum(datediff(second,  offline_start, offline_end)) seconds
      FROM batm_error a
      GROUP BY a.BT_ID,error_type, offline_start
    

)
select * from final   order by 2 ASC



