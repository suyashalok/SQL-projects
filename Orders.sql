SELECT
  YEAR(website_sessions.created_at) AS YEAR_1 ,
  month(website_sessions.created_at) AS Month_1,
  COUNT(DISTINCT website_sessions.website_session_id) as sessions,
  COUNT(DISTINCT orders.order_id) AS orders 
FROM website_sessions
LEFT JOIN orders
ON website_sessions.website_session_id = orders.website_session_id
WHERE website_sessions.utm_source = 'gsearch'
      AND website_sessions.created_at < '2012-11-27'
GROUP BY 1,2
ORDER BY 4 DESC;
