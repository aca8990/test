{{
 config(
 materialized = 'incremental',
 on_schema_change='fail'
 )
}}
WITH src_raw_listings AS (
 SELECT * FROM airbnb.raw.raw_listings
)
SELECT * FROM src_raw_listings
WHERE id is not null
{% if is_incremental() %}
 AND created_at > (select max(created_at) from {{ this }})
{% endif %}
