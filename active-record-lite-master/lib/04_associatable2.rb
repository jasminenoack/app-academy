require_relative '03_associatable'

# Phase IV
module Associatable
  # Remember to go back to 04_associatable to write ::assoc_options

  def has_one_through(name, through_name, source_name)

    define_method(name) do
      through_options = self.class.assoc_options[through_name]
      source_options = through_options.model_class.assoc_options[source_name]

    results = DBConnection.execute(<<-SQL, self.id)
      SELECT
        source.*
      FROM
        #{source_options.table_name} source
      INNER JOIN
        #{through_options.table_name} through
      ON
        through.#{source_options.foreign_key}
          = source.#{source_options.primary_key}
      INNER JOIN
        #{self.class.name.tableize} start
      ON
        start.#{through_options.foreign_key}
          = through.#{through_options.primary_key}
      WHERE
        start.id = ?
    SQL

    source_options.model_class.parse_all(results).first
    end
  end


  def has_many_through(name, through_name, source_name)
    define_method(name) do

      through_options = self.class.assoc_options[through_name]
      source_options = through_options.model_class.assoc_options[source_name]

    results = DBConnection.execute(<<-SQL, self.id)
      SELECT
        source.*
      FROM
        #{source_options.table_name} source
      INNER JOIN
        #{through_options.table_name} through
      ON
        through.#{source_options.primary_key}
          = source.#{source_options.foreign_key}
      INNER JOIN
        #{self.class.name.tableize} start
      ON
        start.#{through_options.primary_key}
          = through.#{through_options.foreign_key}
      WHERE
        start.id = ?
    SQL

    source_options.model_class.parse_all(results)
    end
  end

end
