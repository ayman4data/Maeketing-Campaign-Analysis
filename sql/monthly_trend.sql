--How does performance trend month over month?
WITH monthly_totals AS (
    SELECT 
        DATEFROMPARTS(YEAR(date), MONTH(date), 1) as month_start,
        FORMAT(date, 'yyyy-MM') as month,
        SUM(conversions) as total_conversions
    FROM [marketing_project].[dbo].[campaign_data]
    WHERE conversions IS NOT NULL
    GROUP BY DATEFROMPARTS(YEAR(date), MONTH(date), 1), FORMAT(date, 'yyyy-MM')
)
SELECT 
    month,
    total_conversions,
    LAG(total_conversions) OVER (ORDER BY month_start) as previous_month_conversions,
    CASE 
        WHEN LAG(total_conversions) OVER (ORDER BY month_start) IS NULL THEN NULL
        ELSE ROUND(
            (total_conversions - LAG(total_conversions) OVER (ORDER BY month_start)) * 100.0 / 
            LAG(total_conversions) OVER (ORDER BY month_start), 2
        )
    END as percent_change
FROM monthly_totals
ORDER BY month_start;