class Module
  def weak_attr(*attrs)
    attrs.each do |attr_name|
      attr_accessor attr_name

      normal_getter = "#{attr_name}"
      normal_setter = "#{attr_name}="
      with_getter = "#{attr_name}_with_weakref"
      without_getter = "#{attr_name}_without_weakref"
      with_setter = "#{attr_name}_with_weakref="
      without_setter = "#{attr_name}_without_weakref="

      define_method(with_setter) do |value|
        self.send(without_setter, WeakRef.new(value))
      end

      define_method(with_getter) do
        value = self.send(without_getter)
        if value.respond_to?(:weakref_alive?)
          return value if value.weakref_alive?
          nil
        else
          value
        end
      end

      alias_method without_getter, normal_getter
      alias_method normal_getter, with_getter

      alias_method without_setter, normal_setter
      alias_method normal_setter, with_setter
    end
  end
end