


class RPN

  def initialize
    @num_queue = []

  end

  def run
    puts "RPN Calculator initialized."
    file = ARGV[0]
    unless file
      puts "Enter 'Quit' to end"
      process_stdin
    # Evaluate equation from file
    else
      process_file(file)
    end
  end

  private

    def process_file(file)
      equation = File.read(file).chomp.split(" ")

      equation.each do |input|
        process_input(input)
      end

      p @num_queue
      return @num_queue
    end

    def process_stdin
      $stdin.each do |input|
        input=input.downcase.chomp

        if input == "quit"
          break

        else
          process_input(input)
          p @num_queue
        end
      end
    end

    def process_input(str)
      if num?(str)
        insert(str.to_f)

      elsif operator?(str) && enough_nums?
        case str
        when "+" then add
        when "-" then minus
        when "*" then multiply
        when "/" then divide
        end

      else
        puts "Invalid input."
      end
    end

    def num?(str)
      ("0".."9").include?(str[0])
    end

    def operator?(str)
      ["+", "-", "/", "*"].include?(str)
    end

    def insert(num)
      @num_queue << num
    end

    def add
      @num_queue << (@num_queue.pop + @num_queue.pop)
    end

    def multiply
      @num_queue << (@num_queue.pop * @num_queue.pop)
    end

    def minus
      @num_queue << (-@num_queue.pop + @num_queue.pop)
    end

    def divide
      @num_queue << (@num_queue.pop ** -1 * @num_queue.pop)
    end

    def enough_nums?
      @num_queue.count > 1
    end
end

if __FILE__ == $PROGRAM_NAME
    f = ARGV[0]
    calculator = RPN.new
    calculator.run
end

def file_line_shuffler
  puts "Please enter file name:"
  file_name = gets.chomp

  lines = File.readlines(file_name)

  File.open("#{file_name}-shuffled.txt", "w") do |new_file|
    new_file.puts lines.shuffle
  end

  puts "Shuffled file written!"
end


# File.open(ARGV[0])
