USE mavenfuzzyfactory;
SELECT 
   year(website_sessions.created_at) AS Yr,
   MONTH(website_sessions.created_at) AS Mo,
   COUNT(DISTINCT CASE WHEN utm_campaign = 'nonbrand' THEN website_sessions.website_session_id ELSE NULL END) AS non_brand_sessions,
   COUNT(DISTINCT CASE WHEN utm_campaign = 'nonbrand' THEN orders.order_id ELSE NULL END) AS num_orders,
   COUNT(DISTINCT CASE WHEN utm_campaign = 'brand' THEN website_sessions.website_session_id ELSE NULL END) AS non_brand_sessions,
	COUNT(DISTINCT CASE WHEN utm_campaign = 'brand' THEN orders.order_id ELSE NULL END) AS num_orders
FROM website_sessions
LEFT JOIN orders
ON website_sessions.website_session_id = orders.website_session_id
WHERE website_sessions.created_at < '2012-11-27' 
AND website_sessions.utm_source = 'gsearch'
GROUP BY 1,2;