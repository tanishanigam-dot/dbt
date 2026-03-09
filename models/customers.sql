{{ config(
    materialized='table',
    pre_hook="INSERT INTO DBT_AUDIT_LOG (MODEL_NAME, RUN_TIME) VALUES ('customers_model', CURRENT_TIMESTAMP)"
) }}
SELECT *
FROM tanisha_DB.PUBLIC.CUSTOMERS_RAW


{{ config(
    materialized='table',

    post_hook="
        INSERT INTO DBT_AUDIT_LOG (MODEL_NAME, RUN_TIME)
        VALUES ('customers_post', CURRENT_TIMESTAMP)
    "
) }}

SELECT *
FROM tanisha_DB.PUBLIC.CUSTOMERS_RAW

