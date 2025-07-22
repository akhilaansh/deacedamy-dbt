select
    provnum,
    state,
    sum(hrs_rn_emp + hrs_lpn_emp + hrs_cna_emp) / 8.0 as estimated_shift_count
from {{ ref('stg_nurse_staffing') }}
group by 1, 2