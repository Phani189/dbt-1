def model(dbt, session):
    upstream_model = dbt.ref("dbt1_model_2")
    raw_source = dbt.source("erp", "customers")

    # Join and transform
    joined_df = upstream_model.join(raw_source, "id")

    return joined_df
