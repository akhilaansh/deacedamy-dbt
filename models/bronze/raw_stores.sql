{{ config(materialized='table') }}

select
    cast(null as integer)         as store,
    cast(null as varchar)         as type,
    cast(null as integer)         as size,
where false