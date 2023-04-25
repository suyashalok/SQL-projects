SELECT COUNT(website_session_id) as sessions, utm_source, utm_campaign, http_referer
FROM website_sessions
WHERE created_at < '2012-04-12'
GROUP BY utm_source,utm_campaign,http_referer
ORDER BY sessions DESC;


