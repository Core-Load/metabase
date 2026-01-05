SELECT
  "analytics"."fact_air_quality"."pm10_grade" AS "pm10_grade",
  COUNT(*) AS "count"
FROM
  "analytics"."fact_air_quality"
GROUP BY
  "analytics"."fact_air_quality"."pm10_grade"
ORDER BY
  "analytics"."fact_air_quality"."pm10_grade" ASC