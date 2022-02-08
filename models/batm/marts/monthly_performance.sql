with a as 
(
  select LAST_DAY(to_date(DATETIME)) AS Month_end,serialnumber,  sum(cashamount) as volume, count(*) as Transaction_Count ,regioncode,province
  
  --from "ANALYTICS"."DBT_AKEEMLC"."PERFORMANCE" 
  from {{ ref('atm_daily')}}

 
  where year = '2021' GROUP BY SERIALNUMBER,LAST_DAY(to_date(DATETIME)),regioncode,province
 ), final as 
 (
 select serialnumber
       ,Month_end
       ,volume 
       ,Transaction_Count
       ,lag(volume) over (partition by serialnumber order by Month_end) previous_volume
       ,regioncode, province
from a
 )
 select 

  serialnumber
       ,Month_end
       ,volume 
       ,previous_volume
       ,Transaction_Count
       ,concat(round((volume - previous_volume)  * 100 /previous_volume,0)) as "MoM%"
       ,regioncode, province

from final order by 2 desc