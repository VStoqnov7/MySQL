USE `geography`;

WITH CurrencyCounts AS (
	SELECT c.continent_code,
	c.currency_code,
	COUNT(*) AS currency_usage
	FROM countries AS c
	JOIN continents AS co 
	ON c.continent_code = co.continent_code
	GROUP BY c.continent_code, c.currency_code)
	SELECT cc.continent_code,
	cc.currency_code,
	cc.currency_usage
	FROM CurrencyCounts cc
	JOIN (SELECT continent_code,
	MAX(currency_usage) AS max_currency_usage
	FROM CurrencyCounts
	GROUP BY continent_code) 
	AS max_currency_per_continent 
	ON cc.continent_code = max_currency_per_continent.continent_code
	AND cc.currency_usage = max_currency_per_continent.max_currency_usage
	WHERE cc.currency_usage > 1
	ORDER BY cc.continent_code, cc.currency_code;