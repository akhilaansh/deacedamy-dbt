{% macro copy_into_table(table_name, file_path, file_format_options) %}
    {% set full_table_name = target.database ~ '.' ~ target.schema ~ '.' ~ table_name %}
    copy into {{ full_table_name }}
    from @s3_walmart_stage/{{ file_path }}
    file_format = {{ file_format_options }};
{% endmacro %}

{% macro load_all_raw_files() %}
  {% do run_query(copy_into_table('raw_department', 'department.csv', 'MY_CSV_FORMAT')) %}
  {% do run_query(copy_into_table('raw_stores', 'stores.csv', 'MY_CSV_FORMAT')) %}
  {% do run_query(copy_into_table('raw_fact', 'fact.csv', 'MY_CSV_FORMAT')) %}
{% endmacro %}