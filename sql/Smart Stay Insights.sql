/* Final Report

=============================================================
 SMART STAY — BUSINESS INSIGHTS SUMMARY
===============================================================

SECTION 1 — REVENUE & PERFORMANCE OVERVIEW
---------------------------------------------------------------
• Total Bookings: 115,884  
• Total Cancellations: 42,972  → Cancellation Rate = 37.1%  
• Repeat Guest Rate: 3.17% (indicates low loyalty / satisfaction)  
• Total Revenue: $25.24M  
• Average Daily Rate (ADR): $101.87  
• Average Lead Time: 104 days  
• Average Stay Duration: 3.43 nights  

→ Business Implication:
Overall booking volume and ADR are strong, but high cancellation rate and low repeat guest rate signal retention and booking policy challenges.

---------------------------------------------------------------
YEARLY PERFORMANCE TREND
---------------------------------------------------------------
| Year | Total Revenue ($) | ADR ($) | Total Bookings |  
|------|--------------------|---------|----------------|  
| 2015 | 4.51M             | 88.7    | 13,854         |  
| 2016 | 11.67M            | 96.5    | 36,370         |  
| 2017 | 9.81M             | 111.3   | 24,941         |  

→ Insight:
Revenue dropped ~30% between 2016–2017 despite ADR growth, indicating demand decline possibly due to overpricing or external market shifts.

→ Decision:
Investigate market share loss or customer sensitivity to price.

---------------------------------------------------------------
SEASONAL REVENUE DISTRIBUTION
---------------------------------------------------------------
| Season | Revenue ($) | Share |  
|---------|-------------|-------|  
| Summer  | 11.6M | 44.6% |  
| Spring  | 6.15M | 23.7% |  
| Autumn  | 5.24M | 20.1% |  
| Winter  | 3.01M | 11.6% |  

→ Insight:
Summer is the dominant revenue season followed by Spring; Winter underperforms.

→ Decision:
Focus marketing, staffing, and pricing around Summer–Spring peaks and introduce domestic deals to lift Winter occupancy.

---------------------------------------------------------------
SECTION 2 — CHANNEL & SEGMENT PERFORMANCE
---------------------------------------------------------------
| Market Segment     | Bookings | Cancel % | ADR ($) |  
|--------------------|-----------|-----------|----------|  
| Groups             | 5,894     | 58.0%     | 89.09    |  
| Offline TA/TO      | 7,325     | 24.2%     | 87.87    |  
| Aviation           | 227       | 22.5%     | 100.35   |  
| Direct             | 3,658     | 17.9%     | 125.28   |  
| Corporate          | 407       | 15.2%     | 76.70    |  
| Online TA          | 3,758     | 13.2%     | 95.79    |  
| Complementary      | 72        | 11.1%     | 1.60     |  

→ Insight:
Group bookings drive high cancellations; Direct channel offers the highest ADR with moderate risk.

→ Decision:
Tighten cancellation policies for Groups and incentivize Direct bookings (loyalty discounts, website offers).

---------------------------------------------------------------
SECTION 3 — TOURISM & GUEST ORIGIN
---------------------------------------------------------------
Total International Revenue: $20.45M (81%)  
Total Domestic Revenue: $5.54M (19%)

Top 10 International Markets by Revenue:
1. Portugal (PRT) — $5.38M  
2. United Kingdom (GBR) — $3.99M  
3. France (FRA) — $3.00M  
4. Spain (ESP) — $2.18M  
5. Germany (DEU) — $2.00M  
6. Ireland (IRL) — $1.21M  
7. Italy (ITA) — $0.85M  
8. Belgium (BEL) — $0.74M  
9. Netherlands (NLD) — $0.61M  
10. Others — $0.68M  

→ Insight:
Portugal leads domestic, but UK is top foreign source market. International guests drive majority of revenue.

→ Decision:
Maintain strong presence in UK/French markets; build domestic campaigns for resilience during low travel periods.

---------------------------------------------------------------
SECTION 4 — CUSTOMER BEHAVIOR
---------------------------------------------------------------
Lead Time & Cancellation Relationship:
| Lead Time Range | Bookings | Cancel % |
|-----------------|-----------|-----------|
| ≤ 7 days        | 19,743    | 9.6%      |
| 8–30 days       | 18,959    | 27.9%     |
| 31–90 days      | 29,553    | 37.7%     |
| 91–180 days     | 26,439    | 44.7%     |
| >180 days       | 24,691    | 57.0%     |

→ Insight:
Longer lead times correlate positively with cancellation rates.

→ Decision:
Introduce partial prepayment for bookings over 90 days in advance.

---------------------------------------------------------------
REPEAT GUEST ANALYSIS
---------------------------------------------------------------
Repeat Guests: 3,140 (3.17%)  
Non-Repeat Guests: 112,214 (96.83%)  
Repeat Guest Revenue Share: 4.2%  

→ Insight:
Loyalty is minimal, with 95% of guests not returning.

→ Decision:
Launch guest loyalty program and post-stay satisfaction follow-ups.

---------------------------------------------------------------
BOOKING CHANGE EFFECT ON CANCELLATION
---------------------------------------------------------------
| Changes Made | Bookings | Cancel % |  
|--------------|-----------|-----------|  
| 0            | 101,310   | 40.9%     |  
| 1–3          | ~17,400   | 14–20%    |  

→ Insight:
Guests who modify bookings tend to cancel less, suggesting proactive engagement helps reduce cancellations.

---------------------------------------------------------------
SECTION 5 — SUMMARY OF OPERATIONAL FINDINGS
---------------------------------------------------------------
• High cancellation rate (37%) largely driven by Group and long-lead bookings.  
• Revenue concentrated in Summer; under-utilized Winter capacity.  
• Direct bookings yield highest ADR; Groups and Offline TAs carry highest risk.  
• International tourism dominates; need stronger domestic demand generation.  
• Very low repeat rate → opportunity for loyalty/CRM program.

*/




/* Brain Storming
-- Section 1: Revenue and Performance KPIs
		 total_bookings,
			'115,884', 
		 total_cancellations,
			'42,972',
		 cancellation_rate_pct,
			'37.08191%',
		 repeat_guest_rate_pct,
			'3.16696%',
		 total_revenue,
			'M 25,241,204.75',
		 average_daily_rate,
			'101.872951 $',
		 average_lead_time_days,
			'104.1375$',
		 average_stay_duration_nights
			 'd 3.4294'
     
	-- Insight: Shows the seasonality of bookings for both local and international guests.	
	-- Identify peak booking months by year to find seasonal patterns.
	-- Identifies seasonal revenue trends for both City and Resort hotels.
	
    # season, revenue, revenue_percentage
	'Summer', '11,600,847.05', '44.62%'
	'Spring', '6,147,233.51', '23.65%'
	'Autumn', '5,236,633.04', '20.14%'
	'Winter', '3,011,610.61', '11.58%'
	i: in totall the summer is the begist revenue in second comes spring then autumn then winter.
  
	-- Insight: Shows how pricing power changes throughout the year for each hotel.
	-- Decision: Informs dynamic pricing strategies. Can you increase rates during peak months?
	
    arrival_date_year, total_revenue, average_daily_rate, total_bookings
	2015, '4511559.11', '88.714191', '13854'
	2016, '11673501.43', '96.515912', '36370'
	2017, '9811263.67', '111.316755', '24941'
	i: our sales droped between 2016 and 2017 by about 30%.

Channel & Segment Performance:
	-- Insight: Identifies the most profitable sales channels (e.g., Online Travel Agents,
		Direct bookings).
        Compare the performance of "Direct" bookings vs. third-party channels (like "Online TA").
	-- Decision: Helps allocate marketing budget. Should you invest more in your website or
		partnerships with TAs?
		
		# market_segment, total_bookings, cancellation_rate_percent
		'Groups', '5894', '58.02511%'
		'Offline TA/TO', '7325', '24.15017%'
		'Aviation', '227', '22.46696%'
		'Direct', '3658', '17.85128%'
		'Corporate', '407', '15.23342%'
		'Online TA', '3758', '13.17190%'
		'Complementary', '72', '11.11111%'

		i: our highst cancelation rate is in order
		( groups ,Offline,Aviation,Direct,Corporate,Online TA,Complementary)

	-- Cancellation Rate by Market Segment:
		-- Insight: Reveals which booking channels have the highest and lowest cancellation rates.
		-- Decision: Consider implementing stricter cancellation policies (e.g., non-refundable deposits)
			for high-risk segments.
		-- Analyze the frequency of special requests.
		# avg_special_requests, avg_nights
		'0.57', '3.43'
-- ADR by Market Segment vs. Cancellation Rate
-- Evaluate revenue (avg ADR) vs risk (cancel %) per market segment
 market_segment, total_bookings, avg_adr, cancellation_rate_pct
'Groups', '5894', '89.09', '58.03%'
'Offline TA/TO', '7325', '87.87', '24.15%'
'Aviation', '227', '100.35', '22.47%'
'Direct', '3658', '125.28', '17.85%'
'Corporate', '407', '76.70', '15.23%'
'Online TA', '3758', '95.79', '13.17%'
'Complementary', '72', '1.60', '11.11%'

-- Section 2: Occupancy, Seasonality, and Tourism Insights
-- These queries analyze booking patterns and guest origins.
    and run local deals during domestic travel peaks.
	
    --Top 10 International Countries by Revenue:
		-- Insight: Identifies your most valuable international markets.
		- Decision: Focus marketing efforts (e.g., targeted ads, translated content)
				on these key countries.
			International	M 20,453,187.47
			Domestic		M 5,543,136.74

			# country, total_revenue
			'PRT', '5,383,136.92'
			'GBR', '3,994,902.30'
			'FRA', '3,002,876.39'
			'ESP', '2,176,264.20'
			'DEU', '2,002,957.99'
			'IRL', '1,205,463.56'
			'ITA', '847,236.13'
			'BEL', '738,352.15'
			'Other', '685,541.58'
			'NLD', '614,726.63'

			i: prtoges is the out top sales revenue which and britain is our most forgin revenue.

-- Section 3: Customer Behavior Metrics
-- These queries provide insights into how customers book and interact with their reservations.

	--  Average Lead Time by Customer Type:
		-- Insight: Shows how far in advance different types of customers book their stays.
		-- Decision: Helps with forecasting. Transient guests might book last-minute, while groups plan far ahead.
			# hotel, average_lead_time_days
			'City Hotel', '109.7411'
			'Resort Hotel', '92.6731'

			# lead_time_bucket, bookings, cancel_pct
			'<=7d', '19743', '9.6186%'
			'8-30d', '18959', '27.8601%'
			'31-90d', '29553', '37.6984%'
			'91-180d', '26439', '44.7105%'
			'>180d', '24691', '57.0127%'

			i: while the lead time increasing the cancelation rate increases indecating a positive realation 
			# market_segment, bookings, avg_lead_time
			'Groups', 		'5894', '160.8%'
			'Offline TA/TO', '7325', '97.0%'
			'Direct', 		'3658', '69.5%'
			'Online TA',	'3758', '69.2%'
			'Corporate', 	'407', '32.6%'
			'Complementary','72', '26.2%'
			'Aviation', 	'227', '4.4%'


	--  Repeat Guest Analysis:
		-- Insight: Measures the value of loyalty by showing the percentage of bookings and revenue from repeat guests.
		-- Decision: Justifies investment in loyalty programs. If repeat guests are highly valuable, focus on retaining them.
			# guest_type, total_bookings, total_revenue, percentage_of_bookings
			'not_repeated', '69,772', '24,771,194.28', '92.82512%'
			'repeated', '31,40', '470,010.47', '4.17748%'
			i: lower return rate for about 95% of guests indecating low gust satisfaction

	-- Impact of Booking Changes on Cancellation Rate:
		-- Insight: Do guests who change their booking end up canceling more often?
		-- Decision: Could indicate guest uncertainty.
					 Perhaps offer more flexible options upfront for certain segments.
			# booking_changes, bookings, cancel_pct
			'0', '101310', '40.8518'
			'1', '12701', '14.2272'
			'2', '3804', '20.1367'
			'3', '927', '15.5340'
			'4', '376', '17.8191'
			'5', '118', '16.9492'
			'6', '63', '28.5714'
			'7', '31', '9.6774'
			'8', '17', '23.5294'
			'9', '8', '12.5000'
			'10', '6', '16.6667'
			'11', '2', '0.0000'
			'12', '2', '0.0000'
			'13', '5', '0.0000'
			'14', '5', '20.0000'
			'15', '3', '0.0000'
			'16', '2', '50.0000'
			'17', '2', '0.0000'
			'18', '1', '0.0000'
			'20', '1', '0.0000'
			'21', '1', '0.0000'
	--i: check for corrleation between cancelation and booking_changes

		# reservation_status, cnt
		'Check-Out', '75,165'
		'Canceled', '43,013'
		'No-Show', '1,207'
	-- i:
    
   
---------------------------------------------------------------
RECOMMENDED NEXT INSIGHTS (for next phase)
---------------------------------------------------------------
1. Revenue per Available Room (RevPAR) by Hotel Type → true performance measure.  
2. Monthly Occupancy Trend by Year → visualize seasonality.  
3. ADR by Distribution Channel → refine pricing strategy.  
4. Cancellation Heatmap by Month & Market Segment → identify risk spikes.  
5. Booking Lead Time vs. ADR → detect optimal pricing window.

==============================================================
* **Insight Needed: Revenue Lost Due to Cancellations.**

* - Rationale: With a 37% cancellation rate, understanding the exact financial impact is
* critical. This KPI makes the cost of cancellations tangible and helps justify
* investments in non-refundable policies or other retention strategies.
* - Example Question to Answer: "How many millions of dollars in potential revenue were
* lost last year because of canceled bookings, particularly from the 'Groups' segment?"
    	Measure the room upgrade rate (when assigned room is better than reserved room).
		Calculate the most requested room types.
    	Determine key rates: overall cancellation rate and repeat guest rate.
		Measure core averages: Average Daily Rate (ADR), average lead time, and average stay duration.
		Compare booking volumes and revenue between the City Hotel and Resort Hotel.
		Analyze the average lead time variation by month.

Revenue & Pricing Analysis:
	Calculate the total revenue lost due to cancellations.
	Compare ADR between different hotel types and market segments.
	
Cancellation Analysis:
	Investigate the cancellation rate by market segment and distribution channel.
	Measure the impact of deposit type (e.g., "No Deposit" vs. "Non Refund") on the cancellation rate.
	Identify the top 10 countries with the highest number of cancellations.

Market & Customer Segmentation:
	Compare booking volumes from Domestic vs. International guests.
	Analyze the booking habits of repeat guests vs. new guests.
	Profile family vs. solo/couple travelers based on the number of guests.
*/

-- Performance KPIs
SELECT 
    MIN(adr), MAX(adr), AVG(adr), COUNT(*)
FROM
    fact_bookings;

-- This query calculates the main dashboard KPIs
SELECT 
    COUNT(*) AS total_bookings,
    SUM(f.is_canceled) AS total_cancellations,
    (SUM(f.is_canceled) * 100.0 / COUNT(*)) AS cancellation_rate_pct,
    SUM(CASE
        WHEN dgi.is_repeated_guest = 1 THEN 1
        ELSE 0
    END) * 100.0 / COUNT(*) AS repeat_guest_rate_pct,
    SUM(f.revenue) AS total_revenue,
    AVG(f.adr) AS average_daily_rate,
    AVG(f.lead_time) AS average_lead_time_days,
    AVG(dsn.total_nights_stayed) AS average_stay_duration_nights
FROM
    fact_bookings f
        JOIN
    dim_gusts_info dgi ON f.gusts_info_id = dgi.gusts_info_id
        JOIN
    dim_stayed_nights dsn ON f.nights_stayed_id = dsn.nights_stayed_id;

/*
 total_bookings,
	'115,884', 
 total_cancellations,
	'42,972',
 cancellation_rate_pct,
	'37.08191%',
 repeat_guest_rate_pct,
	'3.16696%',
 total_revenue,
	'M 25,241,204.75',
 average_daily_rate,
	'101.872951 $',
 average_lead_time_days,
	'104.1375$',
 average_stay_duration_nights
	 'd 3.4294'
*/

-- This query calculates total revenue, average daily rate (ADR), and total bookings for each month.
-- We JOIN the fact table with the arrival date dimension to get the year and month.

SELECT 
    d.arrival_date_year,
    SUM(f.revenue) AS total_revenue,
    AVG(f.adr) AS average_daily_rate,
    COUNT(f.primary_key) AS total_bookings
FROM
    fact_bookings f
        JOIN
    dim_arrival_date d ON f.arrival_date_id = d.arrival_date_id
WHERE
    f.is_canceled = 0
GROUP BY d.arrival_date_year
ORDER BY d.arrival_date_year;

    
/*
arrival_date_year, total_revenue, average_daily_rate, total_bookings
2015, '4511559.11', '88.714191', '13854'
2016, '11673501.43', '96.515912', '36370'
2017, '9811263.67', '111.316755', '24941'
insight: our sales droped between 2016 and 2017 by about 30%
*/


SELECT
    CASE
        WHEN arrival_date_month IN ('December', 'January', 'February') THEN 'Winter'
        WHEN arrival_date_month IN ('March', 'April', 'May') THEN 'Spring'
        WHEN arrival_date_month IN ('June', 'July', 'August') THEN 'Summer'
        WHEN arrival_date_month IN ('September', 'October', 'November') THEN 'Autumn'
    END AS season,
    ROUND(SUM(adr * (stays_in_weekend_nights + stays_in_week_nights)), 2) AS revenue,
    ROUND(
        SUM(adr * (stays_in_weekend_nights + stays_in_week_nights)) * 100.0 /
        (SELECT SUM(adr * (stays_in_weekend_nights + stays_in_week_nights))
         FROM booking_modeling
         WHERE is_canceled = 0),
        2
    ) AS revenue_percentage
FROM booking_modeling
WHERE is_canceled = 0
GROUP BY season
ORDER BY revenue DESC;

/*

# season, revenue, revenue_percentage

'Summer', '11,600,847.05', '44.62%'
'Spring', '6,147,233.51', '23.65%'
'Autumn', '5,236,633.04', '20.14%'
'Winter', '3,011,610.61', '11.58%'

i: in totall the summer is the begist revenue in second comes spring then autumn then winter.
*/

--  ADR by Market Segment vs. Cancellation Rate
-- Purpose: evaluate revenue (avg ADR) vs risk (cancel %) per market segment
SELECT
  m.market_segment AS market_segment,
  COUNT(*) AS total_bookings,
  ROUND(AVG(fb.adr), 2) AS avg_adr,
  ROUND(SUM(fb.is_canceled) / NULLIF(COUNT(*),0) * 100, 2) AS cancellation_rate_pct
FROM fact_bookings fb
JOIN dim_marketing m ON fb.market_key = m.market_key
GROUP BY m.market_segment
ORDER BY avg_adr DESC;
/*
# market_segment, total_bookings, avg_adr, cancellation_rate_pct
'Groups', '5894', '89.09', '58.03%'
'Offline TA/TO', '7325', '87.87', '24.15%'
'Aviation', '227', '100.35', '22.47%'
'Direct', '3658', '125.28', '17.85%'
'Corporate', '407', '76.70', '15.23%'
'Online TA', '3758', '95.79', '13.17%'
'Complementary', '72', '1.60', '11.11%'

*/
-- 2) Distribution Channel vs. ADR
-- Purpose: compare average ADR across distribution channels (e.g., OTAs vs Direct)
SELECT
  m.distribution_channel AS distribution_channel,
  COUNT(*) AS total_bookings,
  ROUND(AVG(fb.adr), 2) AS avg_adr,
  ROUND(SUM(fb.is_canceled) / NULLIF(COUNT(*),0) * 100, 2) AS cancellation_rate_pct
FROM fact_bookings fb
JOIN dim_marketing m ON fb.market_key = m.market_key
GROUP BY m.distribution_channel
ORDER BY avg_adr DESC;

/*
distribution_channel, total_bookings, avg_adr, cancellation_rate_pct
'TA/TO', '16673', '89.52', '32.94%'
'Corporate', '889', '90.59', '27.11%'
'Direct', '3778', '123.83', '19.19%'
'GDS', '1', '120.00', '0.00%'
*/

-- 3) Monthly Occupancy Rate Trend (proxy)
-- Purpose: visualize seasonality (bookings/day as occupancy proxy per hotel)
-- Note: this uses bookings-per-day in month as a proxy; divide by known room inventory externally if available.
SELECT
  h.hotel AS hotel,
  d.arrival_date_year AS year,
  d.arrival_date_month AS month_num,
  d.arrival_date_month AS month_name,
  COUNT(*) AS bookings_in_month,
  -- days in that month (compute from first/last day in dim_date for that month)
  (SELECT COUNT(*) FROM dim_arrival_date dd WHERE dd.arrival_date_year = d.arrival_date_year 
			AND dd.arrival_date_month = d.arrival_date_month) AS days_in_month,
  ROUND(COUNT(*) / NULLIF((SELECT COUNT(*) 
  FROM dim_arrival_date dd 
  WHERE dd.year = d.year AND dd.month = d.month),0),2) AS bookings_per_day_proxy
FROM fact_bookings fb
JOIN dim_arrival_date d ON fb.arrival_date_id = d.date_id
JOIN dim_booking_type h ON fb.hotel_id = h.hotel_id
GROUP BY h.hotel, d.year, d.month
ORDER BY h.hotel, d.year, d.month;

-- 4) RevPAR by Hotel Type (proxy using revenue column if present)
-- Purpose: measure hotel performance using revenue per available room proxy.
-- Assumes `fb.revenue` exists (total revenue for the booking). If not, replace with fb.adr * nights proxy.
SELECT
  h.hotel AS hotel,
  d.arrival_date_year, d.arrival_date_month AS month_num, d.arrival_date_month,
  SUM(fb.revenue) AS total_revenue,
  COUNT(*) AS bookings_count,
  -- proxy RevPAR = total_revenue / days_in_month (replace denominator with rooms_inventory*days_in_month if you know rooms_inventory)
  ROUND(SUM(fb.revenue) / NULLIF((SELECT COUNT(*) FROM dim_arrival_date dd WHERE dd.arrival_date_year = d.arrival_date_year AND dd.arrival_date_month = d.arrival_date_month),0), 2) AS revpar_proxy_per_day
FROM fact_bookings fb
JOIN dim_booking_type h ON fb.booking_type_id = h.booking_type_id
JOIN dim_arrival_date d ON fb.arrival_date_id = d.arrival_date_id
GROUP BY h.hotel, d.arrival_date_year, d.arrival_date_month
ORDER BY h.hotel, d.arrival_date_year, d.arrival_date_month;

-- 5) Correlation between Booking Changes and Repeat Guests
-- Purpose: check relationship between booking_changes_num and repeat-guest flag.
-- Two parts: A) average booking changes by repeat flag; B) Pearson correlation (booking_changes_num vs is_repeated_guest 0/1)
-- A) Average & counts
SELECT
  gi.is_repeated_guest AS is_repeated_guest,
  COUNT(*) AS bookings,
  ROUND(AVG(fb.booking_changes),2) AS avg_booking_changes,
  ROUND(SUM(fb.is_canceled) / NULLIF(COUNT(*),0) * 100, 2) AS cancel_rate_pct
FROM fact_bookings fb
JOIN dim_gusts_info gi ON fb.gusts_info_id = gi.gusts_info_id
GROUP BY gi.is_repeated_guest
ORDER BY gi.is_repeated_guest DESC;

/*
# is_repeated_guest, bookings, avg_booking_changes, cancel_rate_pct
'1', '3670', '0.26', '14.44'
'0', '112214', '0.22', '37.82'
*/

-- B) Pearson correlation (booking_changes_num vs is_repeated_guest binary)
SELECT
  -- inputs
  COUNT(*) AS n,
  SUM(fb.booking_changes) AS sum_x,
  SUM(CASE WHEN gi.is_repeated_guest THEN 1 ELSE 0 END) AS sum_y,
  SUM(fb.booking_changes * CASE WHEN gi.is_repeated_guest THEN 1 ELSE 0 END) AS sum_xy,
  SUM(POW(fb.booking_changes,2)) AS sum_x2,
  SUM(POW(CASE WHEN gi.is_repeated_guest THEN 1 ELSE 0 END,2)) AS sum_y2,
  -- Pearson correlation formula
  ( (COUNT(*) * SUM(fb.booking_changes * CASE WHEN gi.is_repeated_guest THEN 1 ELSE 0 END) 
		- SUM(fb.booking_changes) * SUM(CASE WHEN gi.is_repeated_guest THEN 1 ELSE 0 END)) /
    SQRT(
      (COUNT(*) * SUM(POW(fb.booking_changes,2)) - POW(SUM(fb.booking_changes),2))
      *
      (COUNT(*) * SUM(POW(CASE WHEN gi.is_repeated_guest THEN 1 ELSE 0 END,2)) 
			- POW(SUM(CASE WHEN gi.is_repeated_guest THEN 1 ELSE 0 END),2))
    )
  ) AS pearson_corr_bookingChanges_repeatFlag
FROM fact_bookings fb
JOIN dim_gusts_info gi ON fb.gusts_info_id = gi.gusts_info_id
WHERE fb.booking_changes IS NOT NULL
;
/*
# n, sum_x, sum_y, sum_xy, sum_x2, sum_y2, pearson_corr_bookingChanges_repeatFlag
'115884', '25631', '3670', '963', '54787', '3670', '0.011450021058583282'

*/

-- ADR by Market Segment vs Cancellation Rate
SELECT 
    m.market_segment AS Market_Segment,
    COUNT(*) AS Total_Bookings,
    ROUND(AVG(fb.adr), 2) AS Avg_ADR,
    ROUND(SUM(fb.is_canceled) / COUNT(*) * 100, 2) AS Cancellation_Rate_Percent
FROM fact_bookings fb
JOIN dim_marketing m 
    ON fb.market_key = m.market_key
GROUP BY m.market_segment
ORDER BY Avg_ADR DESC;

/*
# Market_Segment, Total_Bookings, Avg_ADR, Cancellation_Rate_Percent
'Groups', '5894', '89.09', '58.03'
'Offline TA/TO', '7325', '87.87', '24.15'
'Aviation', '227', '100.35', '22.47'
'Direct', '3658', '125.28', '17.85'
'Corporate', '407', '76.70', '15.23'
'Online TA', '3758', '95.79', '13.17'
'Complementary', '72', '1.60', '11.11'

*/

-- Seasonal occupancy proxy: average bookings per day-of-week
-- Purpose: staffing and weekday/weekend strategy.
SELECT d.weekday_name, COUNT(*) AS bookings
FROM fact_bookings fb
JOIN dim_arrival_date d ON fb.arrival_date_id = d.date_id
GROUP BY d.weekday_name
ORDER BY FIELD(d.weekday_name,'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

-- This query calculates the cancellation rate for each market segment.
-- The rate is (canceled bookings / total bookings) * 100.
SELECT
    m.market_segment,
    COUNT(f.primary_key) AS total_bookings,
    -- We use AVG on a CASE statement to easily calculate the percentage.
    AVG(CASE WHEN f.is_canceled = 1 THEN 1.0 ELSE 0.0 END) * 100 AS cancellation_rate_percent
FROM
    fact_bookings f
JOIN
    dim_marketing m ON f.market_key = m.market_key
GROUP BY
    m.market_segment
ORDER BY
    cancellation_rate_percent DESC;
    
/*
# market_segment, total_bookings, cancellation_rate_percent
'Groups', '5894', '58.02511%'
'Offline TA/TO', '7325', '24.15017%'
'Aviation', '227', '22.46696%'
'Direct', '3658', '17.85128%'
'Corporate', '407', '15.23342%'
'Online TA', '3758', '13.17190%'
'Complementary', '72', '11.11111%'

i: our highst cancelation rate is in order
( groups ,Offline,Aviation,Direct,Corporate,Online TA,Complementary)
*/

-- 2. Geographic & Tourism Insights

-- This query finds the top 10 countries by total revenue.
-- We only count revenue from bookings that were not canceled.
SELECT
    g.country,
    SUM(f.revenue) AS total_revenue
FROM
    fact_bookings f
JOIN
    dim_gusts_info g ON f.gusts_info_id = g.gusts_info_id
WHERE
    f.is_canceled = 0
GROUP BY
    g.country
ORDER BY
    total_revenue DESC
LIMIT 10;

/*
International	54094	M 20,453,187.47
Domestic		21071	M 5,543,136.74
*/
-- This query compares domestic vs. international guests on booking volume and revenue.
SELECT
    c.tourism_type,
    COUNT(f.primary_key) AS total_bookings,
    SUM(f.revenue) AS total_revenue
FROM
    fact_bookings f
JOIN
    dim_customer_type c ON f.customer_type_id = c.customer_type_id
WHERE
    f.is_canceled = 0
GROUP BY
    c.tourism_type;

/*
International	54094	M 20,453,187.47
Domestic		21071	M 5,543,136.74

# country, total_revenue
'PRT', '5,383,136.92'
'GBR', '3,994,902.30'
'FRA', '3,002,876.39'
'ESP', '2,176,264.20'
'DEU', '2,002,957.99'
'IRL', '1,205,463.56'
'ITA', '847,236.13'
'BEL', '738,352.15'
'Other', '685,541.58'
'NLD', '614,726.63'

i: prtoges is the out top sales revenue which and britain is our most forgin revenue.

*/

--  3. Customer Behavior Metrics
-- This query calculates the average number of days between booking and arrival for each hotel type.
SELECT
    b.hotel,
    AVG(f.lead_time) AS average_lead_time_days
FROM
    fact_bookings f
JOIN
    dim_booking_type b ON f.booking_type_id = b.booking_type_id
GROUP BY
    b.hotel;
-- Creating a bucket for lead time
SELECT
  CASE 
    WHEN lead_time <= 7 THEN '<=7d'
    WHEN lead_time <= 30 THEN '8-30d'
    WHEN lead_time <= 90 THEN '31-90d'
    WHEN lead_time <= 180 THEN '91-180d'
    ELSE '>180d' END AS lead_time_bucket,
  COUNT(*) AS bookings,
  SUM(is_canceled)/COUNT(*)*100 AS cancel_pct
FROM fact_bookings
GROUP BY lead_time_bucket
ORDER BY FIELD(lead_time_bucket, '<=7d','8-30d','31-90d','91-180d','>180d');

SELECT m.market_segment, 
       COUNT(*) AS bookings,
       ROUND(AVG(fb.lead_time),1) AS avg_lead_time
FROM fact_bookings fb
JOIN dim_marketing m ON fb.market_key = m.market_key
GROUP BY m.market_segment
ORDER BY avg_lead_time DESC;
/*
# hotel, average_lead_time_days
'City Hotel', '109.7411'
'Resort Hotel', '92.6731'

# lead_time_bucket, bookings, cancel_pct
'<=7d', 	'19743', '9.6186%'
'8-30d', 	'18959', '27.8601%'
'31-90d', 	'29553', '37.6984%'
'91-180d', 	'26439', '44.7105%'
'>180d', 	'24691', '57.0127%'

# market_segment, bookings, avg_lead_time
'Groups', 		'5894', '160.8%'
'Offline TA/TO', '7325', '97.0%'
'Direct', 		'3658', '69.5%'
'Online TA',	'3758', '69.2%'
'Corporate', 	'407', '32.6%'
'Complementary','72', '26.2%'
'Aviation', 	'227', '4.4%'


i: while the lead time increasing the cancelation rate increases indecating a positive realation 
*/

-- This query calculates the percentage of bookings made by repeat guests.
-- It also shows how much revenue comes from new vs. returning guests.
SELECT
    g.is_repeated_str AS guest_type,
    COUNT(f.primary_key) AS total_bookings,
    SUM(f.revenue) AS total_revenue,
    -- This calculates the percentage of total bookings for each group.
    COUNT(f.primary_key) * 100.0 / (SELECT COUNT(*) FROM fact_bookings WHERE is_canceled = 0) AS percentage_of_bookings
FROM
    fact_bookings f
JOIN
    dim_gusts_info g ON f.gusts_info_id = g.gusts_info_id
WHERE
    f.is_canceled = 0
GROUP BY
    g.is_repeated_str;
    
SELECT h.hotel, d.arrival_date_month, ROUND(AVG(fb.adr),2) AS avg_adr, COUNT(*) AS bookings
FROM fact_bookings fb
JOIN dim_arrival_date d ON fb.arrival_date_id = d.arrival_date_id
JOIN dim_booking_type h ON fb.hotel_id = h.hotel_id
GROUP BY h.hotel, d.month_name
ORDER BY h.hotel, d.year, d.month;

SELECT gi.is_repeated_guest,
       COUNT(*) AS bookings,
       ROUND(AVG(fb.adr),2) AS avg_adr,
       SUM(fb.is_canceled)/COUNT(*)*100 AS cancel_pct
FROM fact_bookings fb
JOIN dim_guests_types gi ON fb.gusts_info_id = gi.gusts_info_id
JOIN dim_guests_types gi ON fb.is_repeated_guest = gi.is_repeated_guest
GROUP BY gi.is_repeated_guest;


/*
# guest_type, total_bookings, total_revenue, percentage_of_bookings
'not_repeated', '69772', '24771194.28', '92.82512'
'repeated', '3140', '470010.47', '4.17748'
i: lower return rate for about 95% of guests indecating low gust satisfaction
*/

-- Average length of stay and distribution Purpose: operational planning (housekeeping/staffing).

SELECT 
  ROUND(AVG(total_of_special_requests + 0),2) AS avg_special_requests,  -- sanity line (keep)
  ROUND(AVG((SELECT stays_in_weekend_nights + stays_in_week_nights FROM dim_stayed_nights sn WHERE sn.nights_stayed_id = fb.nights_stayed_id)),2) AS avg_nights
FROM fact_bookings fb;

/*
# avg_special_requests, avg_nights
'0.57', '3.43'
*/

SELECT fb.booking_changes, COUNT(*) AS bookings, SUM(fb.is_canceled)/COUNT(*)*100 AS cancel_pct
FROM fact_bookings fb
GROUP BY fb.booking_changes
ORDER BY fb.booking_changes;

/*
			# booking_changes, bookings, cancel_pct
			'0', '101310', '40.8518'
			'1', '12701', '14.2272'
			'2', '3804', '20.1367'
			'3', '927', '15.5340'
			'4', '376', '17.8191'
			'5', '118', '16.9492'
			'6', '63', '28.5714'
			'7', '31', '9.6774'
			'8', '17', '23.5294'
			'9', '8', '12.5000'
			'10', '6', '16.6667'
			'11', '2', '0.0000'
			'12', '2', '0.0000'
			'13', '5', '0.0000'
			'14', '5', '20.0000'
			'15', '3', '0.0000'
			'16', '2', '50.0000'
			'17', '2', '0.0000'
			'18', '1', '0.0000'
			'20', '1', '0.0000'
			'21', '1', '0.0000'
	--i: check for corrleation between cancelation and booking_changes
    */

-- No-show vs canceled vs checked-out counts (reservation outcomes)
-- Purpose: outcome mix for revenue recovery strategies.
SELECT rs.reservation_status, COUNT(*) AS cnt
FROM fact_bookings fb
JOIN dim_reservation_status rs ON fb.reservation_status_id = rs.reservation_status_id
GROUP BY rs.reservation_status
ORDER BY cnt DESC;

/*
# reservation_status, cnt
'Check-Out', '75,165'
'Canceled', '43,013'
'No-Show', '1,207'
*/





















































