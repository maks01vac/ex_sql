SELECT
    point,
    date,
    IIF(
        inc IS NULL
        AND out is NOT NULL,
        N'out',
        CASE
            WHEN inc IS NOT NULL
            AND out is NULL THEN 'inc'
        END
    ) operation
FROM
    (
        select
            i.point,
            i.date,
            SUM(inc) as inc,
            SUM(out) as out
        FROM
            Income i FULL
            JOIN Outcome o ON i.point = o.point
            and i.date = o.date
        WHERE
            i.point IS NOT NULL
            AND i.date IS NOT NULL
        GROUP BY
            i.point,
            i.date
        UNION
        select
            o.point,
            o.date,
            SUM(inc) as inc,
            SUM(out) as out
        FROM
            Income i FULL
            JOIN Outcome o ON i.point = o.point
            and i.date = o.date
        WHERE
            o.point IS NOT NULL
            AND o.date IS NOT NULL
        GROUP BY
            o.point,
            o.date
    ) t
WHERE
    operation