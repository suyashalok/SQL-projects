USE mavenfuzzyfactory;
SELECT 
	Month(website_sessions.created_at) AS Mo,
    Year(website_sessions.created_at) AS Yr,
    COUNT(DISTINCT CASE WHEN website_sessions.utm_campaign = 'nonbrand' THEN website_sessions.website_session_id ELSE NULL END) AS nonbrand_sessions,
    COUNT(DISTINCT CASE WHEN website_sessions.utm_campaign = 'brand' THEN website_sessions.website_session_id ELSE NULL END) AS brand_sessions,
    COUNT(DISTINCT CASE WHEN website_sessions.utm_campaign = 'nonbrand' THEN orders.order_id ELSE NULL END) AS nonbrand_orders,
	COUNT(DISTINCT CASE WHEN website_sessions.utm_campaign = 'brand' THEN orders.order_id ELSE NULL END) AS brand_orders
FROM website_sessions
LEFT JOIN orders
ON website_sessions.website_session_id = orders.website_session_id
WHERE website_sessions.utm_source = 'gsearch' 
	AND website_sessions.created_at<'2012-11-27'
group by 1,2;

