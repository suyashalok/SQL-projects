USE mavenfuzzyfactory;
SELECT 
	Month(website_sessions.created_at) AS Mo,
    Year(website_sessions.created_at) AS Yr,
    COUNT(DISTINCT website_sessions.website_session_id) AS sessions,
    COUNT(DISTINCT orders.order_id) AS orders
FROM website_sessions
LEFT JOIN orders
ON website_sessions.website_session_id = orders.website_session_id
WHERE website_sessions.created_at<'2012-11-27'
	AND website_sessions.utm_source = 'gsearch'
group by 1,2;

