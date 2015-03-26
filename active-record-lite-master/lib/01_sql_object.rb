require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
      LIMIT
        1
    SQL
    .first.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |column|

      define_method(column.to_s) do
        attributes[column] if attributes[column]
      end

      define_method("#{column}=") do |value|
        attributes[column] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= name.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL
    self.parse_all(results)
  end

  def self.parse_all(results)
    results.map { |result| self.new(result)}
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        id = ?
    SQL
    self.parse_all(results).first
  end

  def initialize(params = {})
    column_names = self.class.columns

    params.each do |attr_name, value|
      raise "unknown attribute '#{attr_name}'" unless
        column_names.include?(attr_name.to_sym)
      self.send(attr_name.to_s + "=", value)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map { |column| self.send(column)}
  end

  def insert
    columns = self.class.columns
    col_names = columns.join(", ")
    question_marks = Array.new(columns.count, "?").join(", ")

    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

     self.send("id=", DBConnection.last_insert_row_id)

  end

  def update
    setters = self.class.columns.map { |col| "#{col} = ?" }.join(", ")

    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{setters}
      WHERE
        id = ?
    SQL

  end

  def save
    id ? update : insert
  end
end
