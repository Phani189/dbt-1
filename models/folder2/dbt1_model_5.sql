{{config(materialized='table')}}
with cte as
(
SELECT
  c.c_custkey,
  c.c_name,
  o.o_orderkey,
  SUM(o.o_totalprice) AS total_revenue
FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS o
JOIN SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER c
  ON o.o_custkey = c.c_custkey
GROUP BY c.c_custkey, c.c_name,o.o_orderkey
HAVING SUM(o.o_totalprice) > 1000000
)
select * from cte

