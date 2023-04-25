SELECT 
	COUNT(distinct website_sessions.website_session_id) as sessions, 
	COUNT(distinct orders.order_id) as orders,
	website_sessions.device_type,
    COUNT(distinct orders.order_id)/COUNT(distinct website_sessions.website_session_id) as Conv_rt
FROM website_sessions
LEFT JOIN orders 
    ON orders.website_session_id = website_sessions.website_session_id 
WHERE 
   website_sessions.utm_source = 'gsearch' 
   AND website_sessions.created_at<'2012-05-11'
   AND website_sessions.utm_campaign = 'nonbrand' 
GROUP BY 3;