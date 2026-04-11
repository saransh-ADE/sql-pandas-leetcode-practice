import pandas as pd

def find_managers(employee: pd.DataFrame) -> pd.DataFrame:
    
    countDf = employee.groupby('managerId').size().reset_index(name='count')

    result = (
        employee.merge(countDf,left_on='id',right_on='managerId',how='inner').loc[lambda x:x['count']>=5, ['name'] ]
    )

    return result
