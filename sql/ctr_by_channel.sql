--What is the CTR by channel? (Clicks / Impressions)
select 
	channel,
	round((sum(clicks)/sum(impressions)),2)  as CTR


FROM [marketing_project].[dbo].[campaign_data]
where clicks is not null and impressions is not null 

group by channel