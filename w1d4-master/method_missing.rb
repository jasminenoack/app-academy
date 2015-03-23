class Cat
  def say(anything)
    puts anything
  end

  def method_missing(method_name)
    method_name = method_name.to_s
    if method_name.start_with?("say_")
      text = method_name[("say_".length)..-1]

      say(text)
    else
      # do the usual thing when a method is missing (i.e., raise an
      # error)
      super
    end
  end
end


# [9] pry(main)> Cat.new
# => #<Cat:0x007f94322d2968>
# [10] pry(main)> Cat.new.say_meow
# meow
# => nil
# [11] pry(main)> Cat.new.say_Do_you_know_binary?
# Do_you_know_binary?
# => nil
# [12] pry(main)> Cat.new.not_a_method
# ArgumentError: no id given
# from method_missing.rb:15:in `method_missing'
