SELECT 
   COUNT(distinct website_pageview_id) as sessions, 
   pageview_url
FROM website_pageviews
WHERE created_at < '2012-06-09'
GROUP BY pageview_url
ORDER BY 1 DESC;