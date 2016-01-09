--------------------------------------------------------------------------------------------
-- вывести информацию обо всех жителях заданного города, разговаривающие на заданном языке
--------------------------------------------------------------------------------------------

SELECT c.city, n.nationality, p.population, l.language
FROM nationality n
	JOIN population p ON n.id = p.nationality_id
	JOIN cities c ON c.id = p.city_id
	JOIN national_languages nl ON n.id = nl.nationality_id
	JOIN languages l ON l.id = nl.language_id
WHERE c.city = 'Москва' AND l.language = 'русский'
	
--------------------------------------------------------------------------------------------
-- вывести информацию обо всех городах, в которых проживают жители выбранной национальности
--------------------------------------------------------------------------------------------

SELECT c.city, c.year, c.area, n.nationality
FROM cities c
	JOIN population p ON c.id = p.city_id
	JOIN nationality n ON n.id = p.nationality_id
WHERE n.nationality = 'украинцы'
	
--------------------------------------------------------------------------------------------
-- вывести информацию о городах с количеством населения не менее заданного
--------------------------------------------------------------------------------------------

SELECT c.city, c.year, c.area, SUM(p.population) as population
FROM population p
	JOIN nationality n ON n.id = p.nationality_id
	JOIN cities c ON c.id = p.city_id
GROUP BY c.city, c.year, c.area
	HAVING SUM(p.population) > 10000000

--------------------------------------------------------------------------------------------
-- вывести информацию о самой древней народности, проживающей на территории заданного города
--------------------------------------------------------------------------------------------

SELECT n.nationality, n.incipience
FROM nationality n
	JOIN population p ON n.id = p.nationality_id
	JOIN cities c ON c.id = p.city_id
WHERE n.incipience = (SELECT MIN(n.incipience) FROM nationality n) AND c.city = 'Санкт-Петербург' 