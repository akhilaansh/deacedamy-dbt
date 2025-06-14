{{ config(materialized='view') }}

WITH dept_data AS (
    SELECT
        store,
        dept
    FROM {{ ref('raw_department') }}
),

store_data AS (
    SELECT
        store,
        type,
        size
    FROM {{ ref('raw_stores') }}
)

SELECT
    s.store AS STORE_ID,
    d.dept AS DEPT_ID,
    s.type AS STORE_TYPE,
    s.size AS STORE_SIZE,
    CURRENT_TIMESTAMP() AS insert_date,
    CURRENT_TIMESTAMP() AS update_date
FROM store_data s
JOIN dept_data d
ON s.store = d.store