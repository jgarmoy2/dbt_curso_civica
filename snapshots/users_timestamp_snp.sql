{% snapshot users_timestamp_snp %}

{{
    config(
        target_schema = 'snapshots',
        unique_key = 'dni',
        strategy = 'timestamp',
        updated_at = 'fecha_alta_sistema',
        hard_delete = 'new_record'
    )
}}

select
    nombre,
    dni,
    email,
    fecha_alta_sistema
from {{ source('google_sheets', 'users') }}

{% endsnapshot %%}