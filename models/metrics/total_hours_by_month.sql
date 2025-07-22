select
    provnum,
    state,
    date_trunc(month, work_date) as work_month,
    sum(hrs_rn + hrs_lpn + hrs_cna) as total_nurse_hours
from {{ ref('stg_nurse_staffing') }}
group by 1, 2, 3