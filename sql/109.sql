-- 1. Названия всех квадратов черного или белого цвета.
-- 2. Общее количество белых квадратов.
-- 3. Общее количество черных квадратов.



SELECT
    Q_NAME,
    white_color,
    count_black - white_color AS Blacks
FROM
    (
        SELECT
            q.Q_ID,
            q.Q_NAME,
            (SUM(SUM(B.B_VOL)) OVER()) / 765 AS white_color,
            COUNT(*) OVER() AS count_black
        FROM
            utQ q
            LEFT JOIN utB b ON q.Q_ID = b.B_Q_ID
        GROUP BY
            q.Q_ID,
            q.Q_NAME
        HAVING
            SUM(b.B_VOL) = 765
            OR SUM(b.B_VOL) IS NULL
    ) AS white_black