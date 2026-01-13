#  YouTube-India-Engagement-Analytics

## ❗ Problem Statement

Content creators and digital marketers on YouTube often struggle to understand what type of content drives meaningful engagement, which categories perform best, and how long-form videos compare with short-form content. While view counts indicate reach, they do not fully explain audience interaction, loyalty, or content effectiveness.

This project aims to analyze YouTube engagement data to uncover actionable insights around content performance, audience behavior, and publishing strategies, enabling creators and businesses to make data-driven content decisions.

## 🔍 Project Overview

This project analyzes YouTube video engagement data to understand content performance, audience interaction, and publishing strategies.
The analysis focuses on Long Videos vs Shorts, helping creators and businesses optimize reach, engagement, and content ROI.

The project is built as a complete end-to-end analytics pipeline using live API data, Python, SQL, and Power BI.

## 🎯 Business Objectives

The key business questions addressed in this project are:

How is YouTube engagement performing overall?

Which content categories generate the highest engagement?

Which categories deliver maximum reach (views)?

How do Long Videos and Shorts differ in performance?

Do high views always translate into high engagement?

Which videos and categories should creators focus on for better ROI?

## 🗂️ Data Source

YouTube Data API v3

Region: India

Data collected:

Video title

Channel name

Category

Views

Likes

Comments

Publish date & time

Dataset size: 2,000+ videos

## 🏗️ Project Architecture
```
YouTube Data API
      ↓
Python (Data Extraction & Cleaning)
      ↓
SQL (MySQL Database)
      ↓
Power BI (Interactive Dashboard)

```

## 🧑‍💻 Tools & Technologies

Python – API integration, data cleaning, feature engineering

SQL (MySQL) – data storage and business analysis queries

Power BI – dashboarding and storytelling

Pandas, SQLAlchemy – data processing & ETL

YouTube Data API v3

## 🧹 Data Processing & Feature Engineering

Key transformations performed in Python:

Converted raw API JSON to structured tabular format

Handled missing values and encoding issues

Mapped category IDs to category names

Created derived metrics:

Engagement Rate = (Likes + Comments) / Views

Video Type (Long Video vs Shorts)

Extracted publish day and publish hour

Handled NULL categories using "Unknown"

## 🗄️ Database Design (MySQL)

A structured table was created to store cleaned data with UTF-8 support for multilingual titles and emojis.

Key fields:

video_id (Primary Key)

category & category_id

views, likes, comments

engagement_rate

publish_day, publish_hour

video_type

## 📊 Power BI Dashboard Structure
🔹 Page 1: Overall Overview

Purpose: Executive-level summary of YouTube performance

Insights:

Overall reach and engagement KPIs

Category-wise engagement and views

Content mix (Long Videos vs Shorts)

High-level content strategy insights

🔹 Page 2: Long Videos Analysis

Purpose: Deep dive into long-form content performance

Insights:

Best categories for long videos

Top performing long videos

Reach vs engagement comparison

Day-wise performance trends

Engagement efficiency analysis

🔹 Page 3: Shorts Analysis

Purpose: Understand short-form content behavior

Insights:

Shorts engagement patterns

Viral category analysis

High-performing short videos

Comparison with long-form content

Engagement vs reach behavior

## 🔗 Live Power BI Dashboard

The interactive Power BI report for this project is published and can be accessed here:

👉 **[View Live Power BI Dashboard](https://app.powerbi.com/groups/me/reports/b9437d26-379d-4d1d-8dd2-f3b3dba4acb9/ae923beaeb659aa435e1?experience=power-bi)**


## 📈 Business Impact & Insights

Education and Technology categories show highest engagement rates

Entertainment dominates views but not engagement

Shorts deliver higher engagement, while long videos provide higher reach

High views do not always imply high engagement

Category-specific strategies can significantly improve content ROI

## 🧠 Key Learnings

End-to-end ETL pipeline design

Handling real-world API limitations and encoding issues

Data modeling and schema evolution in SQL

Business-oriented dashboard design

Translating SQL analysis into executive-friendly visuals

## 🚀 Future Enhancements

Automate daily data refresh

Add sentiment analysis on comments

Extend analysis to channel-level growth trends

Deploy dashboard using Power BI Service

## 📌 How to Use

Run Python scripts to fetch and clean data

Load data into MySQL database

Connect Power BI to MySQL

Explore interactive dashboards using navigation buttons

## 🧑‍💼 Author

Gargi Parlikar
Aspiring Data Analyst
Skills: Python | SQL | Power BI | Data Analysis | Dashboarding

## ⭐ Final Note

This project demonstrates practical data analytics skills, business thinking, and professional dashboard design, making it suitable for entry-level to early-career Data Analyst roles.
