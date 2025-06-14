{{ config(materialized='view') }}

select
    MD5(CAST(Date AS VARCHAR)) AS DATE_ID,
    DATE,
    ISHOLIDAY,
    CURRENT_TIMESTAMP AS INSERT_DATE,
    CURRENT_TIMESTAMP AS UPDATE_DATE
from {{ ref('raw_department') }}
GROUP BY 2,3