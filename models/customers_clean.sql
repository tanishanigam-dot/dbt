{{ config(
    materialized='view'
) }}

SELECT
    ID,
    NAME,
    EMAIL,
    CITY
FROM {{ ref('customers_raw') }}
WHERE NAME IS NOT NULL
