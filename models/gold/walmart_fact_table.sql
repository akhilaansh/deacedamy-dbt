{{ config(materialized='table') }}

select
    Date_id,
    Store_id,
    Dept_id,
    Store_size,
    Store_weekly_sales,
    Fuel_price,
    Temperature,
    unemployment,
    CPI,
    Markdown1,
    Markdown2,
    Markdown3,
    Markdown4,
    Markdown5,
    vrsn_start_date,
    vrsn_end_date,
    insert_date,
    update_date
from {{ ref('stage_fact') }}