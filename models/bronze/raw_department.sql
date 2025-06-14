{{ config(materialized='table') }}

select
    cast(null as integer)         as store,
    cast(null as integer)         as dept,
    cast(null as date)            as date,
    cast(null as number(10, 2))   as weekly_sales,
    cast(null as boolean)         as isholiday
where false