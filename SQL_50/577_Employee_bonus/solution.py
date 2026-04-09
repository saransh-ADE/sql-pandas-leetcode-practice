import pandas as pd

def employee_bonus(employee: pd.DataFrame, bonus: pd.DataFrame) -> pd.DataFrame:
    df_join = employee.merge(bonus,on='empId',how='left')[['name','bonus']]
    return df_join[(df_join['bonus']<1000)  | (df_join['bonus'].isna())]
