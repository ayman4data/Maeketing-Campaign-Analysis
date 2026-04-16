--Which channel has the highest ROAS? (Revenue / Spend)

select 
	channel,
	(sum(revenue_usd)/sum(spend_usd)) as ROAS
FROM [marketing_project].[dbo].[campaign_data]
group by channel
order by ROAS desc