require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions

  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    self.class_name.constantize
  end

  def table_name
    self.class_name.underscore.downcase + "s"
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    @foreign_key = options[:foreign_key] ||
      (name.to_s.underscore + "_id").to_sym

    @class_name = options[:class_name] ||
      name.to_s.camelcase

    @primary_key = options[:primary_key] || :id
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    @foreign_key = options[:foreign_key] ||
      (self_class_name.to_s.underscore.downcase + "_id").to_sym

    @class_name = options[:class_name] ||
      name.to_s.singularize.camelcase

    @primary_key = options[:primary_key] || :id
  end
end

module Associatable


  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    self.assoc_options[name] = options

    define_method(name) do
      foreign_key = options.foreign_key
      model_class = options.model_class

      model_class.where(id: self.send(foreign_key)).first
    end
  end

  def has_many(name, options = {})
    options = HasManyOptions.new(name, self.name, options)
    self.assoc_options[name] = options

    define_method(name) do
      foreign_key = options.foreign_key
      primary_key = options.primary_key
      model_class = options.model_class

      model_class.where(foreign_key => self.send(primary_key))
    end
  end

  def assoc_options
    @assoc_options ||= {}
  end
end

class SQLObject
  extend Associatable
end
