# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

# BONUS QUESTIONS: These problems require knowledge of aggregate
# functions. Attempt them after completing section 05.

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
  SELECT
    name
  FROM
    countries
  WHERE
    gdp > (SELECT
             max(gdp)
           FROM
             countries
           WHERE
             continent = 'Europe')
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
  SELECT
    max.continent, c.name, c.area
  FROM
    countries c INNER JOIN (SELECT
      max(area) area, continent
      FROM
      countries
      GROUP BY
      continent) max
    ON c.continent= max.continent
  WHERE
    max.area = c.area
  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)



    SELECT
      h.name, h.continent
    FROM (SELECT
    max(population), continent
    FROM
    countries
    WHERE
    population NOT IN (SELECT
                        max(population)
                        FROM
                        countries
                        GROUP BY
                        continent
                      ) GROUP BY continent) s
    INNER JOIN (SELECT
                max(population), continent, name
                FROM
                countries
                GROUP BY
                continent, name) h
      ON s.continent = h.continent
    WHERE h.max > s.max * 3



  SQL
end
