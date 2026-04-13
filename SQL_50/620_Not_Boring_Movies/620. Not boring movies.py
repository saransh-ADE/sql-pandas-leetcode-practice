import pandas as pd

def not_boring_movies(cinema: pd.DataFrame) -> pd.DataFrame:
    result = (
        cinema.loc[(cinema['id']%2!=0) & (cinema['description']!='boring')].sort_values(by='rating',ascending=False)
    )

    return result
