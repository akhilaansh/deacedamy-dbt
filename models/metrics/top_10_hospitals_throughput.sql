
with daily_census as (

    select
        provnum,
        provname,
        work_date,
        patient_count
    from {{ ref('stg_nurse_staffing') }}

),

-- Aggregate total patient days (sum of daily census) per hospital over the last year
patient_throughput as (

    select
        provnum,
        provname,
        sum(patient_count) as total_patient_days
    from daily_census
    where work_date >= dateadd(year, -1, current_date)
    group by provnum, provname

),

-- Rank hospitals by total patient days descending and pick top 10
ranked_throughput as (

    select
        provnum,
        provname,
        total_patient_days,
        row_number() over (order by total_patient_days desc) as rank
    from patient_throughput

)

select
    provnum,
    provname,
    total_patient_days,
    rank
from ranked_throughput
where rank <= 10
order by rank
