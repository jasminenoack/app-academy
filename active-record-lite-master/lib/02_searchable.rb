require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    columns = params.keys.map{ |col| "#{col} = ?"}

    results = DBConnection.execute(<<-SQL, params.values)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{columns.join(" AND ")}
    SQL

    parse_all(results)
  end
end

class SQLObject
  extend Searchable
end
