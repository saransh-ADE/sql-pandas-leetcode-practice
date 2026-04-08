import pandas as pd

def get_average_time(activity: pd.DataFrame) -> pd.DataFrame:

    activity = activity.sort_values(['machine_id','process_id','timestamp'])
    activity['prev_timestamp'] = activity.groupby(['machine_id','process_id'])['timestamp'].shift()

    return (
        activity.query("activity_type == 'end'")
        .assign(processing_time=lambda x: x.timestamp - x.prev_timestamp)
        .groupby('machine_id', as_index=False)['processing_time']
        .mean()
        .round(3)
    )

    return result
