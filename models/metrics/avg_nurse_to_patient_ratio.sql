-- select
--     provnum,
--     state,
--     'RN' as department,
--     avg(hrs_rn / nullif(patient_count, 0)) as avg_rn_ratio,
--     avg(hrs_lpn / nullif(patient_count, 0)) as avg_lpn_ratio,
--     avg(hrs_cna / nullif(patient_count, 0)) as avg_cna_ratio
-- from {{ ref('stg_nurse_staffing') }}
-- group by 1, 2, 3

select
    provnum,
    state,
    avg( (hrs_rn + hrs_lpn + hrs_cna) / nullif(patient_count, 0) ) as avg_nurse_to_patient_ratio
from {{ ref('stg_nurse_staffing') }}
group by 1, 2