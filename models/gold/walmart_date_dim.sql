{{ config(materialized='table') }}

select 
    DATE_ID,
    DATE,
    ISHOLIDAY,
    INSERT_DATE,
    UPDATE_DATE
from {{ ref('stage_date') }}