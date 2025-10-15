/*Model Plan:

	fact:
		Primary_key,lead_time,days_in_waiting_list,adr,revenue,
        total_of_special_requests,booking_changes,is_canceled
        
	dim_customer_type:
		customer_type,tourism_type
        
	dim_deposit_type:
        deposit_type
        
	dim_reservation_status:
        reservation_status
        
    dim_booking_type:
		hotel
		
	dim_marketing:
		market_segment,distribution_channel,agent
		
	dim_gusts_info:
		name,email,phone-number,credit_card,country,
		is_repeated_guest,is_repeated_str,previous_cancellations,previous_bookings_not_canceled, tourism_type
		
	dim_dates_arrivals:
		arrival_full_date,arrival_date_year,arrival_date_month,arrival_date_day_of_month,
		arrival_date_week_number,arrival_quarter
	
    dim_dates_resrvations:
        reservation_status_date,reservation_quarter
	
    dim_stayed_nigts
        total_nights,
        stays_in_weekend_nights,
        stays_in_week_nights
        
	dim_guest_type:
		adults,children,babies,total_guests
		
	dim_resrvation_details:
		meal,meal_name,required_car_parking_spaces,reserved_room_type,assigned_room_type
*/

-- Creating a copy from the cleaning for the modeling 

DROP TABLE IF EXISTS booking_modeling;
CREATE TABLE booking_modeling AS
SELECT
    -- Select all columns EXCEPT the temporary row number 'rn'
    primary_key, hotel, is_canceled, lead_time, arrival_date_year, arrival_date_month,
    arrival_date_week_number, arrival_date_day_of_month, stays_in_weekend_nights,
    stays_in_week_nights, adults, children, babies, meal, country, market_segment,
    distribution_channel, is_repeated_guest, previous_cancellations,
    previous_bookings_not_canceled, reserved_room_type, assigned_room_type,
    booking_changes, deposit_type, agent, days_in_waiting_list, customer_type, adr,
    required_car_parking_spaces, total_of_special_requests, reservation_status,
    reservation_status_date,reservation_quarter, name, email, phone_number, credit_card,
	adr_clean, revenue, full_arrival_date, arrival_quarter,
    tourism_type, totall_guest, total_nights_stayed, meal_name, is_repeated_str,
    is_canceled_str
FROM (
    SELECT
        *,
        ROW_NUMBER() OVER(
            PARTITION BY
                -- This PARTITION clause now includes ALL relevant columns
                hotel, is_canceled, lead_time, arrival_date_year, arrival_date_month,
                arrival_date_week_number, arrival_date_day_of_month, stays_in_weekend_nights,
                stays_in_week_nights, adults, children, babies, meal, country,
                market_segment, distribution_channel, is_repeated_guest, previous_cancellations,
                previous_bookings_not_canceled, reserved_room_type, assigned_room_type,
                booking_changes, deposit_type, agent, days_in_waiting_list, customer_type,
                adr, required_car_parking_spaces, total_of_special_requests,
                reservation_status, reservation_status_date,reservation_quarter, name, email, phone_number,
                credit_card, adr_clean, revenue, full_arrival_date, arrival_quarter,
                tourism_type, totall_guest, total_nights_stayed, meal_name, is_repeated_str,
                is_canceled_str
            ORDER BY
                primary_key -- Keep the first instance of any duplicate group
        ) as rn
    FROM
        booking_cleaning
) AS temp
WHERE rn = 1;


/* dim_booking_type:
		hotel
*/

DROP TABLE IF EXISTS dim_booking_type ;
CREATE TABLE dim_booking_type AS
SELECT
  ROW_NUMBER() OVER (ORDER BY hotel) AS booking_type_id,
  hotel
FROM (
  SELECT DISTINCT hotel
  FROM booking_modeling
) t;

/* dim_customer_type:
		'customer_type',
*/
DROP TABLE IF EXISTS dim_customer_type;

CREATE TABLE dim_customer_type as
	SELECT
		ROW_NUMBER() OVER (ORDER BY customer_type) AS customer_type_id,
        customer_type,
        tourism_type
	FROM (
		SELECT DISTINCT 
        customer_type,
        tourism_type
        FROM booking_modeling) s;
        
/*dim_deposit_type:
        'deposit_type',
*/
DROP TABLE IF EXISTS dim_deposit_type ;
CREATE TABLE dim_deposit_type as
	SELECT
		ROW_NUMBER() OVER (ORDER BY deposit_type) AS deposit_type_id,
        deposit_type
	FROM (
		SELECT DISTINCT deposit_type
        FROM booking_modeling) s;
        
/* dim_reservation_status:
        'reservation_status',
*/

DROP TABLE IF EXISTS dim_reservation_status;
CREATE TABLE dim_reservation_status as
	SELECT
		ROW_NUMBER() OVER (ORDER BY reservation_status) AS reservation_status_id,
        reservation_status
	FROM (
		SELECT DISTINCT reservation_status
        FROM booking_modeling) s;

/*dim_gusts_info:
	name,email,phone-number,credit_card,country,
    is_repeated_guest,previous_cancellations,previous_bookings_not_canceled
*/

-- Step 2.1: Drop the old, incorrect dimension table
DROP TABLE IF EXISTS dim_gusts_info;

-- Step 2.2: Recreate the table, ensuring one record per guest (email)
CREATE TABLE dim_gusts_info AS
WITH RankedGuests AS (
    SELECT
        name,
        email,
        phone_number,
        credit_card,
        country,
        is_repeated_guest,
        is_repeated_str,
        previous_cancellations,
        previous_bookings_not_canceled,
        -- This ranks records for the same email; we will only keep the first one
        ROW_NUMBER() OVER(PARTITION BY email ORDER BY name) as rn
    FROM (
        -- Select distinct combinations from the source table
        SELECT DISTINCT * FROM booking_modeling
    ) s
)
SELECT
    -- We need to generate a new primary key
    ROW_NUMBER() OVER (ORDER BY email) AS gusts_info_id,
    name,
    email,
    phone_number,
    credit_card,
    country,
    is_repeated_guest,
    is_repeated_str,
    previous_cancellations,
    previous_bookings_not_canceled
FROM
    RankedGuests
WHERE
    rn = 1; -- This is the crucial step that keeps only ONE record per email
    
    
-- Find guests with multiple profiles
SELECT
    name,
    email,
    country,
    COUNT(*) AS profile_count
FROM
    dim_gusts_info
GROUP BY
    name,
    email,
    country
HAVING
    COUNT(*) > 1
ORDER BY
    profile_count DESC;

/* dim_stayed_nights:
	'total_nights','stays_in_weekend_nights','stays_in_week_nights',
*/
DROP TABLE IF EXISTS dim_stayed_nights;
CREATE TABLE IF NOT EXISTS dim_stayed_nights AS
SELECT 
	ROW_NUMBER() OVER (ORDER BY total_nights_stayed ) as nights_stayed_id,
    total_nights_stayed,
    stays_in_weekend_nights,
    stays_in_week_nights
FROM (
  SELECT DISTINCT
	total_nights_stayed,
    stays_in_weekend_nights,
    stays_in_week_nights
  FROM booking_modeling) s;

/* dim_arrival_date:
	'arrival_full_date','arrival_date_year','arrival_date_month','arrival_date_day_of_month',
    'arrival_date_week_number',arrival_quarter
*/
DROP TABLE IF EXISTS dim_arrival_date;

CREATE TABLE dim_arrival_date AS
SELECT
    ROW_NUMBER() OVER (ORDER BY full_arrival_date) as arrival_date_id,
    full_arrival_date,
    arrival_date_day_of_month,
    arrival_date_month,
    arrival_date_year,
    arrival_date_week_number,
    arrival_quarter
FROM (
    SELECT
        full_arrival_date,
        MIN(arrival_date_day_of_month) as arrival_date_day_of_month,
        MIN(arrival_date_month) as arrival_date_month,
        MIN(arrival_date_year) as arrival_date_year,
        MIN(arrival_date_week_number) as arrival_date_week_number,
        MIN(arrival_quarter) as arrival_quarter
    FROM
        booking_modeling -- Use your clean source table
    GROUP BY
        full_arrival_date -- This forces one unique row per date
) s;
  
  
/*dim_marketing:
	'market_segment','distribution_channel','agent'
*/
DROP TABLE IF EXISTS dim_marketing;

CREATE TABLE dim_marketing AS
WITH RankedMarketing AS (
    SELECT
        agent,
        market_segment,
        distribution_channel,
        -- This ranks records for the same agent; we will only keep the first one
        ROW_NUMBER() OVER(PARTITION BY agent ORDER BY market_segment, distribution_channel) as rn
    FROM (
        SELECT DISTINCT agent, market_segment, distribution_channel FROM booking_modeling
    ) s
)
SELECT
    ROW_NUMBER() OVER (ORDER BY agent) AS market_key,
    agent,
    market_segment,
    distribution_channel
FROM
    RankedMarketing
WHERE
    rn = 1; -- Keep only ONE record per agent
    
ALTER TABLE dim_marketing ADD PRIMARY KEY (market_key);
ALTER TABLE dim_marketing MODIFY COLUMN market_key BIGINT UNSIGNED NOT NULL;

/*dim_guest_type:
	'adults','children','babies',total_guests
*/
DROP TABLE IF EXISTS dim_guests_types;
CREATE TABLE IF NOT EXISTS dim_guests_types AS
SELECT 
	ROW_NUMBER() OVER (ORDER BY totall_guest ) as guest_type_id,
    totall_guest,
    adults,
    children,
    babies
FROM (
  SELECT DISTINCT
	totall_guest,
    adults,
    children,
    babies
  FROM booking_modeling) s;
  
/*dim_resrvation_details:
	'meal',meal_name,'required_car_parking_spaces','reserved_room_type','assigned_room_type',tourism_type
*/

DROP TABLE IF EXISTS dim_resrvation_details;
CREATE TABLE IF NOT EXISTS dim_resrvation_details AS
SELECT 
	ROW_NUMBER() OVER (ORDER BY assigned_room_type ) as resrvation_details_id,
    assigned_room_type,
    reserved_room_type,
    meal,
    meal_name,
    required_car_parking_spaces
    
FROM (
  SELECT DISTINCT
	assigned_room_type,
    reserved_room_type,
    meal,
    meal_name,
    required_car_parking_spaces
  FROM booking_modeling) s;
  
/* fact_bookings:
		Primary_key, lead_time, days_in_waiting_list, adr, revenue, total_of_special_requests,
        booking_changes, is_canceled, resrvation_details_id, guest_type_id, market_key,
        arrival_date_id,reservation_date_id,
        nights_stayed_id, gusts_info_id, reservation_status_id, deposit_type_id,
        customer_type_id, hotel_id
*/

-- make all dimension keys UNSIGNED
ALTER TABLE dim_booking_type MODIFY COLUMN booking_type_id BIGINT UNSIGNED NOT NULL;
ALTER TABLE dim_customer_type MODIFY COLUMN customer_type_id BIGINT UNSIGNED NOT NULL;
ALTER TABLE dim_deposit_type MODIFY COLUMN deposit_type_id BIGINT UNSIGNED NOT NULL;
ALTER TABLE dim_reservation_status MODIFY COLUMN reservation_status_id BIGINT UNSIGNED NOT NULL;
ALTER TABLE dim_gusts_info MODIFY COLUMN gusts_info_id BIGINT UNSIGNED NOT NULL;
ALTER TABLE dim_stayed_nights MODIFY COLUMN nights_stayed_id BIGINT UNSIGNED NOT NULL;
ALTER TABLE dim_arrival_date MODIFY COLUMN arrival_date_id BIGINT UNSIGNED NOT NULL;
ALTER TABLE dim_resrvation_date MODIFY COLUMN reservation_date_id BIGINT UNSIGNED NOT NULL;
ALTER TABLE dim_marketing MODIFY COLUMN market_key BIGINT UNSIGNED NOT NULL;
ALTER TABLE dim_guests_types MODIFY COLUMN guest_type_id BIGINT UNSIGNED NOT NULL;
ALTER TABLE dim_resrvation_details MODIFY COLUMN resrvation_details_id BIGINT UNSIGNED NOT NULL;

-- add Primary Keys to ALL your dimension tables
ALTER TABLE dim_booking_type ADD PRIMARY KEY (booking_type_id);
ALTER TABLE dim_booking_type MODIFY COLUMN booking_type_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE dim_customer_type ADD PRIMARY KEY (customer_type_id);
ALTER TABLE dim_customer_type MODIFY COLUMN customer_type_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE dim_deposit_type ADD PRIMARY KEY (deposit_type_id);
ALTER TABLE dim_deposit_type MODIFY COLUMN deposit_type_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE dim_reservation_status ADD PRIMARY KEY (reservation_status_id);
ALTER TABLE dim_reservation_status MODIFY COLUMN reservation_status_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE dim_gusts_info ADD PRIMARY KEY (gusts_info_id);
ALTER TABLE dim_gusts_info MODIFY COLUMN gusts_info_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE dim_stayed_nights ADD PRIMARY KEY (nights_stayed_id);
ALTER TABLE dim_stayed_nights MODIFY COLUMN nights_stayed_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE dim_arrival_date ADD PRIMARY KEY (arrival_date_id);
ALTER TABLE dim_arrival_date MODIFY COLUMN arrival_date_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE dim_resrvation_date ADD PRIMARY KEY (reservation_date_id);
ALTER TABLE dim_resrvation_date MODIFY COLUMN reservation_date_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE dim_marketing ADD PRIMARY KEY (market_key);
ALTER TABLE dim_marketing MODIFY COLUMN market_key BIGINT UNSIGNED NOT NULL;

ALTER TABLE dim_guests_types ADD PRIMARY KEY (guest_type_id);
ALTER TABLE dim_guests_types MODIFY COLUMN guest_type_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE dim_resrvation_details ADD PRIMARY KEY (resrvation_details_id);
ALTER TABLE dim_resrvation_details MODIFY COLUMN resrvation_details_id BIGINT UNSIGNED NOT NULL;

-- Now, Create fact table
DROP TABLE IF EXISTS fact_bookings;
CREATE TABLE fact_bookings (
    primary_key INT AUTO_INCREMENT PRIMARY KEY,
    lead_time INT,
    days_in_waiting_list INT,
    adr DECIMAL(10,2),
    revenue DECIMAL(10,2),
    total_of_special_requests INT,
    booking_changes INT,
    is_canceled TINYINT,

    -- Foreign Keys from Dimensions (Changed to BIGINT to match source)
   resrvation_details_id BIGINT UNSIGNED,
    guest_type_id BIGINT UNSIGNED,
    market_key BIGINT UNSIGNED,
    arrival_date_id BIGINT UNSIGNED,
    reservation_date_id BIGINT UNSIGNED,
    nights_stayed_id BIGINT UNSIGNED,
    gusts_info_id BIGINT UNSIGNED,
    reservation_status_id BIGINT UNSIGNED,
    deposit_type_id BIGINT UNSIGNED,
    customer_type_id BIGINT UNSIGNED,
    booking_type_id BIGINT UNSIGNED,

    -- Foreign Key Constraints
    FOREIGN KEY (resrvation_details_id) REFERENCES dim_resrvation_details(resrvation_details_id),
    FOREIGN KEY (guest_type_id) REFERENCES dim_guests_types(guest_type_id),
    FOREIGN KEY (market_key) REFERENCES dim_marketing(market_key),
    FOREIGN KEY (arrival_date_id) REFERENCES dim_arrival_date(arrival_date_id),
    FOREIGN KEY (reservation_date_id) REFERENCES dim_resrvation_date(reservation_date_id),
    FOREIGN KEY (nights_stayed_id) REFERENCES dim_stayed_nights(nights_stayed_id),
    FOREIGN KEY (gusts_info_id) REFERENCES dim_gusts_info(gusts_info_id),
    FOREIGN KEY (reservation_status_id) REFERENCES dim_reservation_status(reservation_status_id),
    FOREIGN KEY (deposit_type_id) REFERENCES dim_deposit_type(deposit_type_id),
    FOREIGN KEY (customer_type_id) REFERENCES dim_customer_type(customer_type_id),
    FOREIGN KEY (booking_type_id) REFERENCES dim_booking_type(booking_type_id)
);

-- INSERT template: adapt dim table names and ON join keys to match your dims
INSERT INTO fact_bookings (
    lead_time, days_in_waiting_list, adr, revenue,
    total_of_special_requests, booking_changes, is_canceled,
    resrvation_details_id, guest_type_id, market_key,
    arrival_date_id, reservation_date_id, nights_stayed_id,
    gusts_info_id, reservation_status_id, deposit_type_id,
    customer_type_id, booking_type_id
)
SELECT
    bc.lead_time,
    bc.days_in_waiting_list,
    bc.adr_clean, -- the cleaned ADR
    bc.revenue,
    bc.total_of_special_requests,
    bc.booking_changes, 
    bc.is_canceled,

    drd.resrvation_details_id,
    dgt.guest_type_id,
    dm.market_key,
    dad.arrival_date_id,
    drdate.reservation_date_id,
    dsn.nights_stayed_id,
    dgi.gusts_info_id,
    drs.reservation_status_id,
    ddt.deposit_type_id,
    dct.customer_type_id,
    dbt.booking_type_id

FROM booking_modeling bc
LEFT JOIN dim_resrvation_details drd
    ON bc.assigned_room_type = drd.assigned_room_type
    AND bc.reserved_room_type = drd.reserved_room_type
    AND bc.meal = drd.meal
    AND bc.required_car_parking_spaces = drd.required_car_parking_spaces
LEFT JOIN dim_guests_types dgt 
    ON bc.adults = dgt.adults
    AND bc.children = dgt.children
    AND bc.babies = dgt.babies
LEFT JOIN dim_marketing dm
    ON bc.agent = dm.agent
    AND bc.market_segment = dm.market_segment
    AND bc.distribution_channel = dm.distribution_channel
LEFT JOIN dim_arrival_date dad 
    ON bc.full_arrival_date = dad.full_arrival_date
LEFT JOIN dim_resrvation_date drdate 
    ON bc.reservation_status_date = drdate.reservation_status_date
LEFT JOIN dim_stayed_nights dsn
    ON bc.total_nights_stayed = dsn.total_nights_stayed
    AND bc.stays_in_weekend_nights = dsn.stays_in_weekend_nights
    AND bc.stays_in_week_nights = dsn.stays_in_week_nights
LEFT JOIN dim_gusts_info dgi  -- THIS IS THE CORRECTED JOIN
    ON bc.name = dgi.name
    AND bc.email = dgi.email
    AND bc.phone_number = dgi.phone_number
    AND bc.credit_card = dgi.credit_card
    AND bc.country = dgi.country
    AND bc.is_repeated_guest = dgi.is_repeated_guest
    AND bc.previous_cancellations = dgi.previous_cancellations
    AND bc.previous_bookings_not_canceled = dgi.previous_bookings_not_canceled
LEFT JOIN dim_reservation_status drs
    ON bc.reservation_status = drs.reservation_status
LEFT JOIN dim_deposit_type ddt
    ON bc.deposit_type = ddt.deposit_type
LEFT JOIN dim_customer_type dct
    ON bc.customer_type = dct.customer_type
    AND bc.tourism_type = dct.tourism_type
LEFT JOIN dim_booking_type dbt 
    ON bc.hotel = dbt.hotel;    
    





























