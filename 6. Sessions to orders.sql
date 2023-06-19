USE mavenfuzzyfactory;
SELECT
	quarter(website_sessions.created_at) AS QRT,
    YEAR(website_sessions.created_at) AS YR,
    COUNT(DISTINCT website_sessions.website_session_id) AS Sessions,
    COUNT(DISTINCT orders.order_id) as Orders
FROM website_sessions
LEFT JOIN orders
ON website_sessions.website_session_id = orders.website_session_id
GROUP BY 2,1
ORDER BY 2,1;
    
    
    
  