with raw as (

    select * 
    from {{ source('public', 'PBJ_DAILY_NURSE_STAFFING_Q2_2024') }}

),

cleaned as (

    select
        cast(PROVNUM as string) as provnum,
        PROVNAME,
        CITY,
        STATE,
        COUNTY_NAME,
        COUNTY_FIPS,
        CY_Qtr,
        to_date(cast(WorkDate as varchar), 'YYYYMMDD') as work_date,
        cast(MDScensus as integer) as patient_count,
        
        cast(Hrs_RN as float) as hrs_rn,
        cast(Hrs_LPN as float) as hrs_lpn,
        cast(Hrs_CNA as float) as hrs_cna,

        cast(Hrs_RN_emp as float) as hrs_rn_emp,
        cast(Hrs_LPN_emp as float) as hrs_lpn_emp,
        cast(Hrs_CNA_emp as float) as hrs_cna_emp

    from raw
    where MDScensus is not null
)

select * from cleaned