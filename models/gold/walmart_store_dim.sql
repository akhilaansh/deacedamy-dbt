{{ config(materialized='table') }}

select 
    STORE_ID,
    DEPT_ID,
    STORE_TYPE,
    STORE_SIZE,
    insert_date,
    update_date
from {{ ref('stage_stores') }}