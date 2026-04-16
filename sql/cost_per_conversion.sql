--Which region has the lowest cost per conversion? (Spend / Conversions)

select 
	region,
	(sum(spend_usd)/sum(conversions))  as CPC


from 
marketing_campaign_data_cleaned
where spend_usd is not null and conversions is not null 

group by region
order by CPC asc

