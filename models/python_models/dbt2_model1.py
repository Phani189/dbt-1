# models/my_python_model.py
def model(dbt, session):
    dbt.config(materialized="table")  # Optional config

    # Reference another model
    df = dbt.ref("dbt1_model_2")

    # Apply Python transformations
    #result_df = df.withColumn("new_col", df["value"] * 2)

    return df
