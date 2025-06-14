{{ config(materialized='table') }}

select
    cast(null as integer)         as store,
    cast(null as date)            as date,
    cast(null as decimal)           as temperature,
    cast(null as decimal)           as fuel_price,
    cast(null as decimal)           as markdown1,
    cast(null as decimal)           as markdown2,
    cast(null as decimal)           as markdown3,
    cast(null as decimal)           as markdown4,
    cast(null as decimal)           as markdown5,
    cast(null as decimal)           as cpi,
    cast(null as decimal)           as unemployment,
    cast(null as boolean)         as isholiday
where false