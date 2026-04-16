import pandas as pd

def project_employees_i(project: pd.DataFrame, employee: pd.DataFrame) -> pd.DataFrame:
    
    join = project.merge(employee, on='employee_id',how='inner')[['project_id','experience_years']]

    result = (
        join.groupby('project_id')['experience_years']
        .mean()
        .round(2)
        .reset_index(name='average_years')

    )

    return result
