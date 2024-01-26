--Combining all 12 tables into one table containing all data for year 2023 using UNION ALL since all our tables have same structure

CREATE TABLE cyclistic2023 AS
	SELECT * FROM january
	UNION ALL
	SELECT * FROM february
	UNION ALL
	SELECT * FROM march
	UNION ALL
	SELECT * FROM april
	UNION ALL
	SELECT * FROM may
	UNION ALL
	SELECT * FROM june
	UNION ALL
	SELECT * FROM july
	UNION ALL
	SELECT * FROM august
	UNION ALL
	SELECT * FROM september
	UNION ALL
	SELECT * FROM october
	UNION ALL
	SELECT * FROM november
	UNION ALL
	SELECT * FROM december;