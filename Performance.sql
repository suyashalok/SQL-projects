USE mavenfuzzyfactory;

CREATE TEMPORARY TABLE first_pv
SELECT 
  website_session_id,
  MIN(website_pageview_id) as first_view
FROM website_pageviews
WHERE website_pageview_id < 1000
GROUP BY website_session_id;

SELECT COUNT(DISTINCT first_view),pageview_url
FROM first_pv
LEFT JOIN website_pageviews 
ON first_pv.first_view = website_pageviews.website_pageview_id
GROUP BY pageview_url;

SELECT 
 COUNT(DISTINCT website_pageview_id) AS sessions,
 pageview_url
FROM website_pageviews
WHERE created_at < '2012-06-09'
GROUP BY pageview_url
ORDER BY 1 DESC;


