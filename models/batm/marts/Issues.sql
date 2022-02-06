with resolution as (
 
 SELECT *
    from 
        raw.jira.batm_resolution
)
SELECT 
      Assignee
      ,status
      ,count(*) as num_of_Tickets
      ,sum(datediff(hour, created, updated)) hours
      ,sum(datediff(minute, created, updated)) minutes
      ,sum(datediff(second, created, updated)) seconds
     --,LAST_DAY(to_date(created)) AS ReportingPeriod
     ,to_date(created) AS ReportingPeriod
    from 
        resolution
group by Assignee, status,to_date(created)
