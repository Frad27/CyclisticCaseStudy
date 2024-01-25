# Case study: How does a bike-share navigate speedy success?

## Introduction
In this case study, I will work for a fictional company, Cyclistic. In order to answer the business questions, I will follow the steps of the data analysis process: 
Ask, Prepare, Process, Analyze, Share, and Act.

## Scenario
You are a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share
company in Chicago. The director of marketing believes the company’s future success
depends on maximizing the number of annual memberships. Therefore, your team wants to
understand how casual riders and annual members use Cyclistic bikes differently. From these
insights, your team will design a new marketing strategy to convert casual riders into annual
members. But first, Cyclistic executives must approve your recommendations, so they must be
backed up with compelling data insights and professional data visualizations.

## PHASE 1: ASK

Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?
Moreno has assigned me the first question to answer: How do annual members and casual
riders use Cyclistic bikes differently?

Business Task:
Company wants to analyze in what way do casual riders differentiate from annual members to be able to design marketing strategis aimed at converting
casual riders into annual members. Team wants to understand why casual riders would buy a membership, and how digital media could affect their marketing tactics.

Key Stakeholders:
The main stakeholders are Lily Moreno, my manager who is director of marketing and the rest of marketing analytics team.

## PHASE 2: PREPARE

I will be using public data available from [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). There are files organized by quarter, month or year and naming varies a lot. There is data available from 2013 but I will be using data for 2023
as it's more recent and relevant for our company. Data has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement). This is public data that can be used to explore
how different customer types are using Cyclistic bikes. But note that data-privacy issues
prohibit from using riders’ personally identifiable information. This means that I won’t be
able to connect pass purchases to credit card numbers to determine if casual riders live in the
Cyclistic service area or if they have purchased multiple single passes.

I downloaded data for 2023. There are 12 files organized by month and all files include these columns: member_casual, end_lng, end_lat, start_lng, start_lat, end_station_id, 
end_station_name, start_station_id, start_station_name, ended_at, started_at, rideable_type, ride_id.

## PHASE 3: PROCESS

I will be using PostgreSQL to combine all files into dataset and clean data. PostgreSQL is a powerful and versatile database system that is well-suited for analyzing data for a cyclistic company. It is scalable, performant, flexible, secure, and has a large and active community. In addition, PostgreSQL has several features that make it specifically well-suited for analyzing geospatial and time series data, which are both important types of data for a company.




