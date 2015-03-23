def super_print(str, options = {})
  defaults = {times: 1, upcase: false, reverse: false}
  options = defaults.merge(options)
  printed_str = str

  printed_str.upcase! if options[:upcase]
  printed_str.reverse! if options[:reverse]

  options[:times].times do
    print "#{printed_str} "
  end
end
