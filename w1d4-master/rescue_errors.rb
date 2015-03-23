def rescue_errors
  begin
    yield.tap{|x| x.inspect}
  rescue
    puts "   Rescue"
  rescue NoMemoryError
    puts "   NoMemoryError"
  rescue ScriptError
    puts "   ScriptError"
  rescue Interrupt
    puts "   Interupt"
  rescue SecurityError
    puts "   SecurityError"
  rescue SystemStackError
    puts "   SytemStackError"
  rescue SystemExit
    puts "   SystemExit"
  end
end


def test_code
  puts "1 - a"
  rescue_errors { 1 - a }
  puts "1 - 'a'"
  rescue_errors { 1 - "a" }
  puts 'raise "boom"'
  rescue_errors { raise "boom" }
  puts "raise NoMemoryError"
  rescue_errors { raise NoMemoryError }
  puts "raise ScriptError"
  rescue_errors { raise ScriptError }
  puts "raise LoadError"
  rescue_errors { raise LoadError }
  puts "raise NotImplementedError"
  rescue_errors { raise NotImplementedError }
  puts "raise SyntaxError"
  rescue_errors { raise SyntaxError }
  puts "raise Interrupt"
  rescue_errors { raise Interrupt }
  puts "raise StandardError "
  rescue_errors { raise StandardError  }
  puts "raise ArgumentError "
  rescue_errors { raise ArgumentError }
  puts "raise IndexError"
  rescue_errors { raise IndexError }
  puts "raise StopIteration"
  rescue_errors { raise StopIteration }
  puts "raise IOError "
  rescue_errors { raise IOError }
  puts "raise EOFError"
  rescue_errors { raise EOFError }
  puts "raise LocalJumpError"
  rescue_errors { raise LocalJumpError }
  puts "raise NameError "
  rescue_errors { raise NameError }
  puts "raise NoMethodError"
  rescue_errors { raise NoMethodError }
  puts "raise RangeError"
  rescue_errors { raise RangeError }
  puts "raise FloatDomainError"
  rescue_errors { raise FloatDomainError }
  puts "raise RegexpError "
  rescue_errors { raise RegexpError }
  puts "raise RuntimeError"
  rescue_errors { raise RuntimeError }
  puts "raise SecurityError"
  rescue_errors { raise SecurityError }
  puts "raise SystemCallError "
  rescue_errors { raise SystemCallError }
  puts "raise SystemStackError"
  rescue_errors { raise SystemStackError }
  puts "raise ThreadError"
  rescue_errors { raise ThreadError }
  puts "raise TypeError"
  rescue_errors { raise TypeError }
  puts "raise ZeroDivisionError "
  rescue_errors { raise ZeroDivisionError }
  puts "raise SystemExit"
  rescue_errors { raise SystemExit }
  puts "raise Errno::* "
  rescue_errors { raise Errno::* }
end
