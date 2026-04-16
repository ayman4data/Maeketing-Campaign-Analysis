-- Cost per conversion (CPA) by channel
SELECT
    channel,
    ROUND(SUM(spend_usd) / NULLIF(SUM(conversions), 0), 2) AS CPA
FROM [marketing_project].[dbo].[campaign_data]
WHERE conversions IS NOT NULL
GROUP BY channel
ORDER BY CPA ASC;