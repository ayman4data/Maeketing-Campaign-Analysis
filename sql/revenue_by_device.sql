--Which device drives the most revenue?

select 
	sum(revenue_usd) as highest_revenue,
	device

FROM [marketing_project].[dbo].[campaign_data]
where  device != 'Unknown'
group by device
order by highest_revenue desc

