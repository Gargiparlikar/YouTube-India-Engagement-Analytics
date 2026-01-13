CREATE TABLE youtube_engagement (
    video_id VARCHAR(50) PRIMARY KEY,

    title TEXT CHARACTER SET utf8mb4,
    channel TEXT CHARACTER SET utf8mb4,

    category_id VARCHAR(10),
    category VARCHAR(100) CHARACTER SET utf8mb4,

    published_at DATETIME,

    views BIGINT,
    likes BIGINT,
    comments BIGINT,

    engagement_rate FLOAT,

    publish_hour INT,
    publish_day VARCHAR(20)
);

CREATE INDEX idx_category ON youtube_engagement(category);
CREATE INDEX idx_publish_hour ON youtube_engagement(publish_hour);
CREATE INDEX idx_engagement_rate ON youtube_engagement(engagement_rate);
CREATE INDEX idx_views ON youtube_engagement(views);

DESCRIBE youtube_engagement;

## Business Questions Queries

# 1 What is the size of our dataset?

SELECT COUNT(*) AS total_videos
FROM youtube_engagement;

# 2 Which categories perform best by engagement?

SELECT
    category,
    ROUND(AVG(engagement_rate), 4) AS avg_engagement
FROM youtube_engagement
GROUP BY category
ORDER BY avg_engagement DESC;



# 3 Which categories get the highest total views?

SELECT
    category,
    SUM(views) AS total_views
FROM youtube_engagement
WHERE category IS NOT NULL
GROUP BY category
ORDER BY total_views DESC;

# 4 Do high views always mean high engagement?

SELECT
    title,
    views,
    engagement_rate
FROM youtube_engagement
ORDER BY views DESC
LIMIT 10;

# 5 Top 10 most engaging videos

SELECT
    title,
    channel,
    engagement_rate
FROM youtube_engagement
ORDER BY engagement_rate DESC
LIMIT 10;

# 6 Best time to publish videos
SELECT
    publish_hour,
    ROUND(AVG(engagement_rate), 4) AS avg_engagement
FROM youtube_engagement
GROUP BY publish_hour
ORDER BY avg_engagement DESC;

#7 Best day of the week to publish
SELECT
    publish_day,
    ROUND(AVG(engagement_rate), 4) AS avg_engagement
FROM youtube_engagement
GROUP BY publish_day
ORDER BY avg_engagement DESC;

# 8 Which channels have the most engaged audience?
SELECT
    channel,
    ROUND(AVG(engagement_rate), 4) AS avg_engagement
FROM youtube_engagement
GROUP BY channel
HAVING COUNT(*) >= 5
ORDER BY avg_engagement DESC
LIMIT 10;

# 9 Engagement vs Volume Trade-off
SELECT
    channel,
    COUNT(*) AS total_videos,
    ROUND(AVG(engagement_rate), 4) AS avg_engagement
FROM youtube_engagement
GROUP BY channel
ORDER BY total_videos DESC;

#10  Which videos underperform despite high views?
SELECT
    title,
    views,
    engagement_rate
FROM youtube_engagement
WHERE views > 1000000
AND engagement_rate < 0.01
ORDER BY views DESC;

# 11 Category-wise engagement distribution
SELECT
    category,
    MIN(engagement_rate) AS min_engagement,
    MAX(engagement_rate) AS max_engagement,
    ROUND(AVG(engagement_rate), 4) AS avg_engagement
FROM youtube_engagement
WHERE category IS NOT NULL
GROUP BY category;

# 12 Content freshness analysis

SELECT
    CASE
        WHEN published_at >= NOW() - INTERVAL 7 DAY THEN 'Last 7 Days'
        WHEN published_at >= NOW() - INTERVAL 30 DAY THEN 'Last 30 Days'
        ELSE 'Older'
    END AS video_age,
    ROUND(AVG(engagement_rate), 4) AS avg_engagement
FROM youtube_engagement
GROUP BY video_age;

# 13 Shorts vs Long-form (Proxy)
SELECT
    CASE
        WHEN title LIKE '%#shorts%' THEN 'Shorts'
        ELSE 'Long Form'
    END AS video_type,
    ROUND(AVG(engagement_rate), 4) AS avg_engagement
FROM youtube_engagement
GROUP BY video_type;

# 14 Category × Time 

SELECT
    category,
    publish_hour,
    ROUND(AVG(engagement_rate), 4) AS avg_engagement
FROM youtube_engagement
GROUP BY category, publish_hour;

# 14  Top categories for advertisers
SELECT
    category,
    ROUND(AVG(views), 0) AS avg_views,
    ROUND(AVG(engagement_rate), 4) AS avg_engagement
FROM youtube_engagement
GROUP BY category
ORDER BY avg_engagement DESC, avg_views DESC;



