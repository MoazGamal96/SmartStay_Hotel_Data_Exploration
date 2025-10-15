/* Data Set Columns:
'hotel',
'is_canceled',
'lead_time',
'arrival_date_year','arrival_date_month','arrival_date_week_number','arrival_date_day_of_month',
'stays_in_weekend_nights', 'stays_in_week_nights',
'adults','children','babies','meal','country',
'market_segment','distribution_channel',
'is_repeated_guest','previous_cancellations',
'previous_bookings_not_canceled','reserved_room_type',
'assigned_room_type','booking_changes','deposit_type',
'agent','company','days_in_waiting_list', 'customer_type',
'adr',
'required_car_parking_spaces','total_of_special_requests',
'reservation_status','reservation_status_date',
'name','email','phone-number','credit_card'
*/
-- Cleanging Data Tasks:
-- removing Duplicates
-- Standardize the Data 
-- Null Values:
	-- childern,agent,country
-- Removing Columns:
	-- company
-- Change phone number name from phone-number to phone_number
-- Replace Value indicating if the booking was canceled (1) or not (0)
-- Replace Value indicating if the booking name was from a repeated guest (1) or not (0)
-- Replace Value meals to (BB — Bed_Breakfast, HB — Half_Board, FB — Full_Board, SC — Self_Catering) in dim.
-- Replace rooms vlaues in dim !!!
-- Change lowe rate country to "other"
-- Change ADR values 
-- Change values for adultes = 1 or more where children > 0 
-- Add Column toursim type any prt = domestic if not international
-- Add Column Primary_key
-- Add Column Full arrival date 
-- Add Column quarter
-- Add Column Totall guest number
-- Add Column Totally Nights Stay
-- Add Column Revenue (ADR *Total Night Stayed)
-- When you analyze the dataset, map columns to these phases and ask:
-- Who books? When? Through which channel? Are they cancelling? How much do they pay

use smartstay;
SELECT *
FROM hotel_booking;

-- Creating a copy for cleaning process
CREATE TABLE IF NOT EXISTS booking_cleaning LIKE hotel_booking;

INSERT booking_cleaning SELECT * FROM hotel_booking;

SELECT *
FROM	booking_cleaning;
describe booking_cleaning;

-- removing Duplicates 
WITH duplicates AS (
    SELECT *, 
           ROW_NUMBER() OVER (PARTITION BY hotel, is_canceled, lead_time, arrival_date_year, 
           arrival_date_month,arrival_date_week_number,arrival_date_day_of_month, stays_in_weekend_nights, 
           stays_in_week_nights, adults, children, babies, meal, country, market_segment, distribution_channel, 
           is_repeated_guest, previous_cancellations, previous_bookings_not_canceled, reserved_room_type, 
           assigned_room_type, booking_changes, deposit_type, agent, days_in_waiting_list, 
           customer_type, adr, required_car_parking_spaces, total_of_special_requests, reservation_status, 
           reservation_status_date,`name`,email,credit_card ORDER BY phone_number) as rn
    FROM booking_cleaning
)
select * from duplicates where rn>2;

-- Counting null values in each coulmn
SELECT 
    SUM(CASE WHEN hotel IS NULL THEN 1 ELSE 0 END) AS null_hotel,
    SUM(CASE WHEN hotel IS NOT NULL AND CAST(hotel AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_hotel,
    SUM(CASE WHEN is_canceled IS NULL THEN 1 ELSE 0 END) AS null_is_canceled,
    SUM(CASE WHEN is_canceled IS NOT NULL AND CAST(is_canceled AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_is_canceled,
    SUM(CASE WHEN lead_time IS NULL THEN 1 ELSE 0 END) AS null_lead_time,
    SUM(CASE WHEN lead_time IS NOT NULL AND CAST(lead_time AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_lead_time,
    SUM(CASE WHEN arrival_date_year IS NULL THEN 1 ELSE 0 END) AS null_arrival_date_year,
    SUM(CASE WHEN arrival_date_year IS NOT NULL AND CAST(arrival_date_year AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_arrival_date_year,
    SUM(CASE WHEN arrival_date_month IS NULL THEN 1 ELSE 0 END) AS null_arrival_date_month,
    SUM(CASE WHEN arrival_date_month IS NOT NULL AND CAST(arrival_date_month AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_arrival_date_month,
    SUM(CASE WHEN arrival_date_week_number IS NULL THEN 1 ELSE 0 END) AS null_arrival_date_week_number,
    SUM(CASE WHEN arrival_date_week_number IS NOT NULL AND CAST(arrival_date_week_number AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_arrival_date_week_number,
    SUM(CASE WHEN arrival_date_day_of_month IS NULL THEN 1 ELSE 0 END) AS null_arrival_date_day_of_month,
    SUM(CASE WHEN arrival_date_day_of_month IS NOT NULL AND CAST(arrival_date_day_of_month AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_arrival_date_day_of_month,
    SUM(CASE WHEN stays_in_weekend_nights IS NULL THEN 1 ELSE 0 END) AS null_stays_in_weekend_nights,
    SUM(CASE WHEN stays_in_weekend_nights IS NOT NULL AND CAST(stays_in_weekend_nights AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_stays_in_weekend_nights,
    SUM(CASE WHEN stays_in_week_nights IS NULL THEN 1 ELSE 0 END) AS null_stays_in_week_nights,
    SUM(CASE WHEN stays_in_week_nights IS NOT NULL AND CAST(stays_in_week_nights AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_stays_in_week_nights,
    SUM(CASE WHEN adults IS NULL THEN 1 ELSE 0 END) AS null_adults,
    SUM(CASE WHEN adults IS NOT NULL AND CAST(adults AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_adults,
    SUM(CASE WHEN children IS NULL THEN 1 ELSE 0 END) AS null_children,
    SUM(CASE WHEN children IS NOT NULL AND CAST(children AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_children,
    SUM(CASE WHEN babies IS NULL THEN 1 ELSE 0 END) AS null_babies,
    SUM(CASE WHEN babies IS NOT NULL AND CAST(babies AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_babies,
    SUM(CASE WHEN meal IS NULL THEN 1 ELSE 0 END) AS null_meal,
    SUM(CASE WHEN meal IS NOT NULL AND CAST(meal AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_meal,
    SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS null_country,
    SUM(CASE WHEN country IS NOT NULL AND CAST(country AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_country,
    SUM(CASE WHEN market_segment IS NULL THEN 1 ELSE 0 END) AS null_market_segment,
    SUM(CASE WHEN market_segment IS NOT NULL AND CAST(market_segment AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_market_segment,
    SUM(CASE WHEN distribution_channel IS NULL THEN 1 ELSE 0 END) AS null_distribution_channel,
    SUM(CASE WHEN distribution_channel IS NOT NULL AND CAST(distribution_channel AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_distribution_channel,
    SUM(CASE WHEN is_repeated_guest IS NULL THEN 1 ELSE 0 END) AS null_is_repeated_guest,
    SUM(CASE WHEN is_repeated_guest IS NOT NULL AND CAST(is_repeated_guest AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_is_repeated_guest,
    SUM(CASE WHEN previous_cancellations IS NULL THEN 1 ELSE 0 END) AS null_previous_cancellations,
    SUM(CASE WHEN previous_cancellations IS NOT NULL AND CAST(previous_cancellations AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_previous_cancellations,
    SUM(CASE WHEN previous_bookings_not_canceled IS NULL THEN 1 ELSE 0 END) AS null_previous_bookings_not_canceled,
    SUM(CASE WHEN previous_bookings_not_canceled IS NOT NULL AND CAST(previous_bookings_not_canceled AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_previous_bookings_not_canceled,
    SUM(CASE WHEN reserved_room_type IS NULL THEN 1 ELSE 0 END) AS null_reserved_room_type,
    SUM(CASE WHEN reserved_room_type IS NOT NULL AND CAST(reserved_room_type AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_reserved_room_type,
    SUM(CASE WHEN assigned_room_type IS NULL THEN 1 ELSE 0 END) AS null_assigned_room_type,
    SUM(CASE WHEN assigned_room_type IS NOT NULL AND CAST(assigned_room_type AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_assigned_room_type,
    SUM(CASE WHEN booking_changes IS NULL THEN 1 ELSE 0 END) AS null_booking_changes,
    SUM(CASE WHEN booking_changes IS NOT NULL AND CAST(booking_changes AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_booking_changes,
    SUM(CASE WHEN deposit_type IS NULL THEN 1 ELSE 0 END) AS null_deposit_type,
    SUM(CASE WHEN deposit_type IS NOT NULL AND CAST(deposit_type AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_deposit_type,
    SUM(CASE WHEN agent IS NULL THEN 1 ELSE 0 END) AS null_agent,
    SUM(CASE WHEN agent IS NOT NULL AND CAST(agent AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_agent,
    SUM(CASE WHEN days_in_waiting_list IS NULL THEN 1 ELSE 0 END) AS null_days_in_waiting_list,
    SUM(CASE WHEN days_in_waiting_list IS NOT NULL AND CAST(days_in_waiting_list AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_days_in_waiting_list,
    SUM(CASE WHEN customer_type IS NULL THEN 1 ELSE 0 END) AS null_customer_type,
    SUM(CASE WHEN customer_type IS NOT NULL AND CAST(customer_type AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_customer_type,
    SUM(CASE WHEN adr IS NULL THEN 1 ELSE 0 END) AS null_adr,
    SUM(CASE WHEN adr IS NOT NULL AND CAST(adr AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_adr,
    SUM(CASE WHEN required_car_parking_spaces IS NULL THEN 1 ELSE 0 END) AS null_required_car_parking_spaces,
    SUM(CASE WHEN required_car_parking_spaces IS NOT NULL AND CAST(required_car_parking_spaces AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_required_car_parking_spaces,
    SUM(CASE WHEN total_of_special_requests IS NULL THEN 1 ELSE 0 END) AS null_total_of_special_requests,
    SUM(CASE WHEN total_of_special_requests IS NOT NULL AND CAST(total_of_special_requests AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_total_of_special_requests,
    SUM(CASE WHEN reservation_status IS NULL THEN 1 ELSE 0 END) AS null_reservation_status,
    SUM(CASE WHEN reservation_status IS NOT NULL AND CAST(reservation_status AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_reservation_status,
    SUM(CASE WHEN reservation_status_date IS NULL THEN 1 ELSE 0 END) AS null_reservation_status_date,
    SUM(CASE WHEN reservation_status_date IS NOT NULL AND CAST(reservation_status_date AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_reservation_status_date,
    SUM(CASE WHEN name IS NULL THEN 1 ELSE 0 END) AS null_name,
    SUM(CASE WHEN name IS NOT NULL AND CAST(name AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_name,
    SUM(CASE WHEN email IS NULL THEN 1 ELSE 0 END) AS null_email,
    SUM(CASE WHEN email IS NOT NULL AND CAST(email AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_email,
    SUM(CASE WHEN `phone_number` IS NULL THEN 1 ELSE 0 END) AS null_phone_number,
    SUM(CASE WHEN `phone_number` IS NOT NULL AND CAST(`phone_number` AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_phone_number,
    SUM(CASE WHEN credit_card IS NULL THEN 1 ELSE 0 END) AS null_credit_card,
    SUM(CASE WHEN credit_card IS NOT NULL AND CAST(credit_card AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_credit_card
FROM booking_cleaning;

-- replacing null in country with unk
UPDATE booking_cleaning
SET country = 'UNK'
WHERE country IS NULL OR country = '';

-- replacing null in children coulmn with 0
UPDATE booking_cleaning
SET children = 0
WHERE children IS NULL OR children = '';


-- replacing nulls in agent with -1 → "Direct Booking / No Agent"
UPDATE hotel_booking
SET agent = 0
WHERE agent IS NULL OR agent = ' ';

-- Rows with negative ADR
SELECT *
FROM booking_cleaning
WHERE CAST(adr AS DECIMAL(10,2)) < 0;

-- Rows with ADR = 0 but status indicates a stay (suspicious)
SELECT *
FROM booking_cleaning
WHERE CAST(adr AS DECIMAL(10,2)) = 0
  AND reservation_status = 'Check-Out';
  
-- removing coulmn company
alter TABLE booking_cleaning
drop COLUMN company;
  
  -- Add flags and a cleaned ADR column (safe approach: set negative -> NULL; keep zeros but flag)
  ALTER TABLE booking_cleaning
  ADD COLUMN adr_num DECIMAL(10,2) GENERATED ALWAYS AS (CAST(adr AS DECIMAL(10,2))) STORED,
  ADD COLUMN adr_flag VARCHAR(32),
  ADD COLUMN adr_clean DECIMAL(10,2);

UPDATE booking_cleaning
SET
  adr_flag = CASE
    WHEN adr_num < 0 THEN 'NEGATIVE'
    WHEN adr_num = 0 AND reservation_status IN ('Canceled','No-Show') THEN 'ZERO_OK'
    WHEN adr_num = 0 AND reservation_status = 'Check-Out' THEN 'ZERO_SUSPICIOUS'
    ELSE 'VALID'
  END,
  adr_clean = CASE
    WHEN adr_num < 0 THEN NULL  -- set negative to NULL; we'll impute later if needed
    ELSE adr_num
  END;

select 
	SUM(CASE WHEN adr_clean  IS NULL THEN 1 ELSE 0 END) AS null_adr,
	SUM(CASE WHEN adr_clean IS NOT NULL AND CAST(adr_clean AS CHAR) = '' THEN 1 ELSE 0 END) AS blank_adr
from booking_cleaning;

-- deleting null vlaue
DELETE FROM booking_cleaning
WHERE adr_clean IS NULL;

-- Count low-ADR bookings by market segment, hotel, and customer type
SELECT
    market_segment,
    hotel,
    customer_type,
    COUNT(*) AS number_of_bookings,
    AVG(adr_clean) AS average_adr
FROM
    booking_modeling
WHERE
    adr_clean BETWEEN 1 AND 20
GROUP BY
    market_segment,
    hotel,
    customer_type
ORDER BY
    number_of_bookings DESC;

-- Analyze low-ADR bookings by guest origin and stay details
SELECT
    country,
    assigned_room_type,
    total_nights_stayed,
    COUNT(*) AS number_of_bookings
FROM
    booking_modeling
WHERE
    adr_clean BETWEEN 1 AND 20
GROUP BY
    country,
    assigned_room_type,
    total_nights_stayed
ORDER BY
    number_of_bookings DESC; -- Show the top 20 most common combinations

-- Create revenue = adr_clean * total_nights only for completed stays
-- Add the column if it doesn't exist 
ALTER TABLE booking_cleaning
ADD COLUMN realized_revenue DECIMAL(12,2) NOT NULL DEFAULT 0;

-- Only count revenue for completed stays (Check-Out) and positive ADR 

UPDATE booking_cleaning
SET realized_revenue =
  CASE
 
    WHEN reservation_status = 'Check-Out'
         AND COALESCE(adr_clean, CAST(adr AS DECIMAL(10,2))) > 0
    THEN
      COALESCE(adr_clean, CAST(adr AS DECIMAL(10,2)))
      *
      (COALESCE(CAST(stays_in_weekend_nights AS SIGNED), 0)
       + COALESCE(CAST(stays_in_week_nights AS SIGNED), 0))
    ELSE 0
  END;

select * from booking_cleaning;

-- count each vlaue in adr_flag 
SELECT adr_flag, COUNT(*) AS count_of_values
FROM booking_cleaning
GROUP BY adr_flag;

-- Adding Coulmn Full arrival date
ALTER TABLE booking_cleaning
ADD COLUMN full_arrival_date DATE;

UPDATE booking_cleaning
SET full_arrival_date = STR_TO_DATE(
    CONCAT(arrival_date_year, '-', arrival_date_month, '-', arrival_date_day_of_month),
    '%Y-%M-%e'
);

-- Add Column quarter arrival_date_month,reservation_status_date
ALTER TABLE booking_cleaning
ADD COLUMN arrival_quarter VARCHAR(10);

UPDATE booking_cleaning
SET arrival_quarter = CASE
    WHEN COALESCE(TRIM(full_arrival_date), '') = '' THEN NULL
    ELSE CONCAT('Q', QUARTER(DATE(reservation_status_date)))
END;

 -- add column reservation_quarter
ALTER TABLE booking_cleaning
ADD COLUMN reservation_quarter VARCHAR(10);

UPDATE booking_cleaning
SET reservation_quarter = CASE
    WHEN COALESCE(TRIM(reservation_status_date), '') = '' THEN NULL
    ELSE CONCAT('Q', QUARTER(DATE(reservation_status_date)))
END;
ALTER TABLE booking_cleaning
DROP COLUMN reservation_quarter;

-- null VALUES chicking for both (arrival_quarter, reservation_quarter)
SELECT
  SUM(arrival_quarter IS NULL) AS arrival_quarter_nulls,
  SUM(arrival_quarter IS NULL) AS reservation_quarter_nulls
FROM booking_cleaning;

-- Change low rate country to "other"
SELECT country, COUNT(*) AS cnt
FROM booking_cleaning
GROUP BY country
ORDER BY cnt ASC;

UPDATE booking_cleaning
SET country = 'Other'
WHERE country IN (
    SELECT c.country
    FROM (
        SELECT country
        FROM booking_cleaning
        GROUP BY country
        HAVING COUNT(*) < 150
    ) c
);

-- Adding coulmn toursim_type
ALTER TABLE booking_cleaning
ADD COLUMN tourism_type VARCHAR(20);

UPDATE booking_cleaning
SET tourism_type = CASE
    WHEN country = 'PRT' THEN 'Domestic'
    ELSE 'International'
END;

-- Change values for adultes = 1 or more where children > 0 
UPDATE booking_cleaning
SET adults = 1
WHERE COALESCE(CAST(NULLIF(adults,'') AS SIGNED), 0) = 0
  AND COALESCE(CAST(NULLIF(children,'') AS SIGNED), 0) > 0;

SELECT * from booking_cleaning 
WHERE adults >0 AND children >=1;

--  Add Coulmn Totall guest number 
ALTER TABLE booking_cleaning
ADD COLUMN totall_guest INT;

UPDATE booking_cleaning
SET totall_guest = 
    COALESCE(adults,0) + COALESCE(children,0) + COALESCE(babies,0);

-- Add Column Total Nights Stay in fact_boking
Alter table booking_cleaning
add column total_nights_stayed INT;

update booking_cleaning
set total_nights_stayed = 
	coalesce(stays_in_weekend_nights,0)+ coalesce(stays_in_week_nights,0);


-- Add Column Primary_key
ALTER TABLE booking_cleaning
ADD COLUMN primary_key BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
-- null chicking
SELECT
  SUM(primary_key IS NULL) AS key_nulls
FROM booking_cleaning;

/*
Add Column meals name  (BB — Bed_Breakfast, HB — Half_Board, FB — Full_Board,
 SC — Self_Catering) in dim
*/

ALTER TABLE booking_cleaning
ADD COLUMN meal_name VARCHAR(50);

UPDATE booking_cleaning
SET meal_name = CASE meal
    WHEN 'BB' THEN 'Bed & Breakfast'
    WHEN 'HB' THEN 'Half Board'
    WHEN 'FB' THEN 'Full Board'
    WHEN 'SC' THEN 'Self Catering'
    ELSE 'Other/Unknown'
END;

SELECT meal, meal_name
FROM booking_cleaning;

/*
Add Column Values  indicating if the booking name was from a repeated guest (1) or not (0) 
*/
ALTER TABLE booking_cleaning
ADD COLUMN is_repeated_str VARCHAR(50);

UPDATE booking_cleaning
SET is_repeated_str = CASE is_repeated_guest
    WHEN '1' THEN 'repeated'
    ELSE 'not_repeated'
END;

SELECT is_repeated_guest, is_repeated_str
FROM booking_cleaning;


-- Add Column Values indicating if the booking was canceled (1) or not (0) 

ALTER TABLE booking_cleaning
ADD COLUMN is_canceled_str VARCHAR(50);

UPDATE booking_cleaning
SET is_canceled_str = CASE is_canceled
    WHEN '1' THEN 'canceled'
    ELSE 'not_canceled'
END;

SELECT is_canceled_str, is_canceled
FROM booking_cleaning;

ALTER TABLE booking_cleaning
rename column realized_revenue to revenue;

-- adr testing vlaues
SELECT MIN(adr_clean), MAX(adr_clean), AVG(adr_clean), COUNT(*) 
FROM booking_cleaning;

SELECT adr_clean, hotel, arrival_date_year, country 
FROM booking_cleaning
WHERE adr BETWEEN 0 AND 50;



