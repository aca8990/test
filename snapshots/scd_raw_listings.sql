{% snapshot scd_raw_listing %}
    {{
        config(
            target_schema="dbt_achandyabraham",
            unique_key="id",
            strategy="timestamp",
            updated_at="updated_at",
            invalidate_hard_deletes=True
        )
    }}
    select *
    from airbnb.raw.raw_listings
{% endsnapshot %}
