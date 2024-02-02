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

I will be utilizing PostgreSQL to merge all files into a dataset and perform data cleaning. PostgreSQL stands out as a robust and versatile database system, perfectly tailored for data analysis at Cyclistic. Its scalability, performance, flexibility, security features, and the support of community make it an ideal choice.

In pgAdmin4, I've established 12 tables and imported CSV files sourced from our primary data. These tables have been combined into a singular table named 'cyclistic2023,' comprising a total of 21,242,447 rows. Below is the SQL query employed for the consolidation of all tables: [Data Union](https://github.com/Frad27/CyclisticCaseStudy/blob/93b3128db529418dc7e7d5512a346986e0acc6df/DataUnion.sql)

### Data Cleaning

1. Verifying the presence of null values within our dataset.

   ![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/11a80cb1-302b-4c81-813f-6ad976019c7f)

2. Creating a new table without null values and verifying its integrity. The new table comprises 16,058,464 rows.

   ![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/1b393dc5-17db-43b2-b84a-7d24d25f0e87)

3. Verifying the count of rides with a ride length of less than 1 minute and more than 24 hours and removing them from table. Identifying and categorizing these rides as anomalies, as their extreme durations may potentially distort the accuracy of insights derived from the data. We are left with 15,741,907 rows.

   ![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/6dd8df53-8685-43da-9d38-31f2d62052f4) 

4. Enhancing the table by adding two additional columns: "ride length" and "day of the week." The "ride length" column calculates the duration of the bike ride (end time minus start time), while the "day of the week" column indicates the day when the ride commenced.

   ![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/5a3739aa-2a83-4200-9033-bc6c388dfc11)

Now that we have successfully cleaned and prepared the data for analysis, the SQL query responsible for the data cleaning process can be found here: [Data Cleaning](https://github.com/Frad27/CyclisticCaseStudy/blob/93b3128db529418dc7e7d5512a346986e0acc6df/DataCleaning.sql).

## PHASE 4: ANALYZE

Initially making statistical analysis on the dataset to gain deeper insights. This involves calculating the average, minimum, and maximum ride lengths, as well as determining the mode of the day of the week. This  approach aims to unveil patterns, providing valuable information such as the typical ride duration and the most frequent day for bike rides.

![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/8e5b273f-6cb6-44b1-aa59-cd82be409b9a)

Calculating the average ride length categorized by the type of member and day of the week. Additionally, determining the number of rides for each day of the week categorized by the type of member.

![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/574d548b-cf55-40e4-a853-958274ae917a)

![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/48510062-a1d9-4c16-81be-f1ce113017b2)

Determine the number of rides per hour of the day and per month. This exploration aims to unveil hourly trends in ride frequency and identify the season of the year with the highest ride activity.

![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/6a3b3921-3dfe-4dc8-8d74-87b6c45c8d0f)

![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/8a0ebc62-88af-42fe-8570-6c396f078774)

The count of rides based on both starting and ending stations to identify the most frequented locations where each type of member initiates their journey. This analysis aims to reveal patterns in the preferred starting and ending points for different member types, providing valuable insights into user behavior and usage patterns.

![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/1dd46bd8-1319-4d19-94eb-c84928b4deca)

![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/a30c63fa-2fc0-403e-ba9c-57c114d15e40)

Calculating the number of bike rides categorized by bike types for different user groups. The goal is to see the predominant bike preferences within each user segment.

![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/488c491b-263f-4cff-9701-171bd4129b5f)

The analyzed data from PostgreSQL has been  saved as CSV files and subsequently uploaded to Tableau Public, marking the initiation of the fifth phase: sharing insights. This approach ensures accessibility and allows for dynamic visualization and exploration of the findings through Tableau's public platform. Here is the link to SQL query for data analysis: [DataAnalysis](https://github.com/Frad27/CyclisticCaseStudy/blob/93b3128db529418dc7e7d5512a346986e0acc6df/DataAnalysis.sql).

## PHASE 5: SHARE

Starting this phase by initially evaluating the ride distribution among different member types. The graph shows the number of rides for each type of member and subsequently calculate the percentage contribution of each member type to the total number of rides in the year 2023.

![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/682d8b91-bd34-4594-97e6-7062717c9b68)

Member riders have a total of 10,026,323 rides, making 63.69% of the overall rides in 2023. Casual riders accounted for 5,715,583 rides, representing 36.31% of the total rides. This breakdown provides a clear understanding of the distribution and contribution of each member type to the overall ride statistics for the specified period.

Moving on, let's check out which types of bikes each group likes more. We're digging into the bike choices of both members and casual riders to see what type they prefer. This part of the analysis will give us the lowdown on the most popular bike types for each crew.

![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/e3137238-9ef4-49c7-8d94-e3c9683410ca)

Observing the data, it's clear that both member and casual riders lean towards classic bikes rather than electric ones. Notably, only casual riders opt for docked bikes.

Next up, let's dive into the data to analyze how each group's ride count varies hourly, weekly, and monthly. This exploration aims to uncover distinct patterns in the riding behavior of both member and casual riders, providing insights into their preferences and usage tendencies across different timeframes.

![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/80ad73ef-b5c3-4571-8426-d21a616597ef)

Examining the ride distribution per hour of the day reveals interesting patterns. Member riders show peak usage around 8 am and 5 pm, suggesting a predominant utilization for commuting during standard working hours. On the other hand, casual riders exhibit peak usage around 5 pm, gradually tapering off afterward. This trend may indicate that casual riders predominantly use bikes post-work hours, possibly for leisure or recreational purposes.

Shifting our focus, let's take a look at the distribution of rides throughout the week. This analysis aims to identify the specific days when the highest ride activity occurs for both member and casual riders.

![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/be0ba3d3-4c2d-43e8-89d4-bc3805fc63e5)

The analysis of ride distribution throughout the week unveils distinct patterns. Member riders exhibit the highest ride activity during midweek days, reinforcing the notion that bikes are predominantly used for commuting to and from work. In contrast, casual riders show peak ride activity during the weekends, aligning with our earlier observation that they prefer bikes for leisure and recreational purposes during their free time.

Now, let's turn our attention to the monthly distribution of rides for both member and casual riders. We are looking to identify the season of the year when the highest ride activity occurs within each user group. Understanding the seasonal patterns will provide valuable insights into the riding preferences during different times of the year.

![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/5ff85fa5-164c-4b9f-bc75-0cec2e37d492)

Observing the monthly ride distribution for both member and casual riders, a consistent pattern emerges. The peak ride activity for both groups is observed during the summer months, gradually declining as winter approaches. This trend may be attributed to reduced bike usage during lower temperatures, particularly in Chicago's cold autumn and winter months, where weather conditions might not be suitable for biking.

Now, let's take a look at the most frequent starting and ending points for both member and casual riders. This analysis aims to identify the stations that are most commonly used by each user group, shedding light on preferred locations and patterns in the starting and ending points of their rides.

![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/6a58e6f0-5b30-4c82-952d-ce7f9f970042)

![image](https://github.com/Frad27/CyclisticCaseStudy/assets/157365791/de29de83-7fb6-4e3e-829b-a4cbc368dcbe)

Analyzing both maps, a clear distinction emerges. Casual riders predominantly start and end their rides along the waterfront and near tourist attractions. On the contrary, members tend to initiate or conclude their rides in the downtown and residential area of Chicago. This further validates our earlier observation that casual riders opt for bikes more for leisure and recreational purposes, while members primarily use bikes for commuting to work and university.

---

In summary, our analysis has unveiled distinct patterns in the biking behavior of members and casual riders. Member riders showcase a consistent trend of using bikes primarily for commuting, with peak hours aligning with standard working hours and a concentration of rides in the downtown area. Casual riders, on the other hand, exhibit a preference for leisurely rides, with peak usage during evenings and weekends, often near waterfronts and tourist attractions.

Examining bike preferences, both groups lean towards classic bikes, but casual riders are the sole users of docked bikes. Furthermore, the monthly analysis revealed a common pattern for both groups, with peak ride activity during summer months, suggesting a decrease in bike usage during colder seasons.

Lastly, the examination of starting and ending points highlighted that casual riders favor locations near tourist attractions and waterfronts, while members predominantly start or end their rides in the downtown area—underscoring the distinction in purpose between leisure and commuting.

These findings collectively contribute valuable insights into user behavior, aiding in the formulation of targeted strategies and service improvements for both member and casual riders.

All visualizations are available and accessible on Tableau through the following link: [Tableau](https://public.tableau.com/views/CyclisticCaseStudy_17066148978360/Totalrides?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link).

## PHASE 6: ACT

After thoroughly examining the differences between two types of riders, we now arrive at the final phase, known as "act." In light of this analysis, I would like to present the following recommendations to the marketing team:

### 1. Riding hours
Throughout the day, the majority of rides for both groups take place around 5 pm, indicating a common trend. Notably, for members, peak ride hours are also observed in the morning around 8 am. There's significant potential here to implement peak-hour promotions specifically targeted at annual members. Offering discounts during the identified peak hours, especially around 5 pm, could entice casual riders by making rides more affordable during their usual peak times. Additionally, such promotions might encourage casual riders to consider using bikes for their morning commute if early morning hours come with discounted rates. This strategy aims to leverage identified peak hours for both user groups, enhancing user engagement and promoting diverse usage patterns.

### 2. Day of the week
Tailoring incentives to cater to the distinct preferences of both casual and annual members is a strategic approach. For casual riders, offering exclusive perks such as discounts for tourist attractions or additional ride credits could serve as an attractive proposition. This not only provides incentives for casual riders to consider annual memberships, gaining discounts for leisure rides during the weekends but also encourages them to utilize bikes during weekdays.
Simultaneously, for annual members, introducing perks and discounts that align with weekend activities can stimulate increased bike usage during weekends. This comprehensive strategy aims to strike a balance, appealing to the recreational preferences of casual riders and encouraging diversified bike usage patterns among annual members.

### 3. Season
Recognizing that the peak riding seasons for both groups align with spring and summer, leveraging this insight for strategic campaigns can be impactful. To encourage the shift of casual riders towards annual memberships, I propose launching targeted campaigns featuring discounts before the spring, highlighting the seasonal benefits of an annual membership. Additionally, providing casual members with an annual membership trial, complete with all its associated benefits, could make the transition more enticing, potentially prompting them to opt for an annual membership. This approach aims to capitalize on seasonal trends and offer compelling incentives for casual riders to make the switch.

### 4. Location
Given the observation that casual riders frequently start and end their rides around waterfronts and tourist attractions, while members prefer downtown and residential areas, strategic marketing efforts can be tailored accordingly. I recommend directing marketing promotions for annual memberships specifically to downtown and residential zones. Emphasizing the convenience of commuting, these promotions could include incentives such as discounted rates, exclusive routes, or perks designed to cater to commuter needs.
Additionally, exploring options like commuter-focused memberships, with benefits tailored for daily work or university travel, can be effective in enticing casual riders to consider bikes as a practical mode of commute. This approach aims to align marketing strategies with user behavior and needs, creating a more appealing proposition for both casual and annual members.




























































   







