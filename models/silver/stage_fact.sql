{{ config(materialized = 'view') }}

SELECT
    d.Date_id,
    s.Store_id,
    s.Dept_id,
    s.Store_size,
    dept.Store_weekly_sales,
    fact.Fuel_price,
    fact.Temperature,
    fact.Unemployement,
    fact.CPI,
    fact.Markdown1,
    fact.Markdown2,
    fact.Markdown3,
    fact.Markdown4,
    fact.Markdown5,
    CURRENT_DATE     AS vrsn_start_date,
    NULL             AS vrsn_end_date,
    CURRENT_TIMESTAMP AS insert_date,
    CURRENT_TIMESTAMP AS update_date

FROM 
    {{ ref('stage_date') }} d
JOIN 
    {{ ref('raw_department') }} dept
    ON dept.date = d.Date_id
JOIN 
    {{ ref('stage_stores') }} s
    ON s.STORE_ID = dept.store
   AND s.DEPT_ID = dept.dept
JOIN 
    {{ ref('raw_fact') }} fact
    ON fact.Date_id = d.DATE_ID
   AND fact.Store_id = s.STORE_ID;