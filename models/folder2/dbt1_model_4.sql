{{config(materialized='table')}}
with cumulative as
(
    select o_orderkey,o_orderdate,
    sum(o_totalprice) over(order by o_orderdate) as cumsum
    from SNOWFLAKE_SAMPLE_DATA.TPCH_SF10.ORDERS order by o_orderdate
)
select * from cumulative
