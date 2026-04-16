--Which age group converts best?

select 
	sum(conversions) as conversions,
	age_group as age
FROM [marketing_project].[dbo].[campaign_data]
where age_group != 'Unknown'
group by age_group
order by sum(conversions) desc