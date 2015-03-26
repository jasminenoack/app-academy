class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      instance = "@" + name.to_s
      getter = name.to_s
      setter = name.to_s + "="

      define_method(getter) do
        self.instance_variable_get(instance)
      end
      
      define_method(setter) do |value|
        self.instance_variable_set(instance, value)
      end
    end
  end
end
