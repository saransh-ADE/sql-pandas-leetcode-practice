import pandas as pd

def find_customers(visits: pd.DataFrame, transactions: pd.DataFrame) -> pd.DataFrame:
    result =(
        visits.merge(transactions,on='visit_id',how='left')
        .loc[lambda x:x['transaction_id'].isna() ]
        .groupby('customer_id')
        .size()
        .reset_index(name='count_no_trans')
    )
    
    return result
