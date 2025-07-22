select
    provnum,
    state,
    count_if(hrs_rn_emp > 12 or hrs_lpn_emp > 12 or hrs_cna_emp > 12) * 1.0 / count(*) as pct_days_with_overtime
from {{ ref('stg_nurse_staffing') }}
group by 1, 2