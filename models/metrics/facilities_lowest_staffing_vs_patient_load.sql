with daily_staffing as (

    select
        provnum,
        provname,
        work_date,
        patient_count,
        -- Sum of nurse hours (RN + LPN + CNA)
        coalesce(hrs_rn, 0) + coalesce(hrs_lpn, 0) + coalesce(hrs_cna, 0) as total_nurse_hours
    from {{ ref('stg_nurse_staffing') }}

),

-- Calculate nurse hours per patient per day and aggregate over last year by hospital
staffing_ratio as (

    select
        provnum,
        provname,
        avg(case when patient_count > 0 then total_nurse_hours / patient_count else null end) as avg_nurse_hours_per_patient
    from daily_staffing
    where work_date >= dateadd(year, -1, current_date)
    group by provnum, provname

),

-- Rank hospitals by avg nurse hours per patient ascending (lowest staffing)
ranked_staffing as (

    select
        provnum,
        provname,
        avg_nurse_hours_per_patient,
        row_number() over (order by avg_nurse_hours_per_patient asc nulls last) as rank
    from staffing_ratio

)

select
    provnum,
    provname,
    avg_nurse_hours_per_patient,
    rank
from ranked_staffing
where rank <= 10
order by rank
