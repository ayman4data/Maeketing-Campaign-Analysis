--Which campaign generated the most conversions?
SELECT
    campaign_name AS Campaign,
    SUM(conversions) AS Conversions
FROM [marketing_project].[dbo].[campaign_data]
WHERE conversions IS NOT NULL
GROUP BY campaign_name
ORDER BY Conversions DESC;