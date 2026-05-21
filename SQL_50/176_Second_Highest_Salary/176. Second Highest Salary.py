import pandas as pd

def second_highest_salary(employee: pd.DataFrame) -> pd.DataFrame:
    
    mx= employee['salary'].max()
    second_mx = employee[employee['salary']<mx]['salary'].max()
    return pd.DataFrame(
        {
            'SecondHighestSalary':[second_mx]
        }
    )
