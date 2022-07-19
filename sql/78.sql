select
    name,
    DATEADD(day, 1, EOMONTH(DATEADD(month, -1, date))) first_day,
    EOMONTH(date) last_day
from
    battles