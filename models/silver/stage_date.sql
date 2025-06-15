{{ config(materialized='view') }}

select
    ROW_NUMBER() OVER (ORDER BY DATE) AS Date_id,
    DATE,
    ISHOLIDAY,
    CURRENT_TIMESTAMP AS INSERT_DATE,
    CURRENT_TIMESTAMP AS UPDATE_DATE
from {{ ref('raw_department') }}
GROUP BY 2,3