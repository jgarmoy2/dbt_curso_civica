{% snapshot users_check_snp %}

{{
    config(
        target_schema = 'snapshots',
        unique_key = 'dni',
        strategy = 'check',
        check_cols = ['nombre', 'email'],
        hard_delete = 'ignore'
    )
}}

select
    nombre,
    dni,
    email,
    fecha_alta_sistema
from {{ source('google_sheets', 'users') }}

{% endsnapshot %}