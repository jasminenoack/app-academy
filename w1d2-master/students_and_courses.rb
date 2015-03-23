class Student
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def courses
    @courses.map(&:name)
  end

  def enroll(course)
    if @courses.include?(course)
      puts "#{name} enrolled in the class"
    elsif has_conflict?(course)
      puts "#{name} cannot take this class due to a conflict"
    else
      @courses << course
      course.add_student(self)
    end
  end

  def course_load
    load = Hash.new(0)

    @courses.each do |course|
      load[course.department] += course.num_credits
    end

    load
  end

  def has_conflict?(new_course)
    @courses.each do |course|
      return true if course.conflicts_with?(new_course)
    end
    false
  end
end

class Course
  attr_accessor :department, :num_credits, :name, :days, :time

  def initialize(name, department, num_credits, days, time)
    @name = name
    @department = department
    @num_credits = num_credits
    @students = []
    @days = days
    @time = time
  end

  def add_student(student)
    if @students.include?(student)
      puts "#{name} is enrolled in the class"
    elsif student.has_conflict?(self)
      puts "#{student.name} cannot take this class due to a conflict"
    else
      @students << student
      student.enroll(self)
    end
  end

  def students
    @students.map(&:name)
  end

  def conflicts_with?(course)
    return false if self == course
    days.each do |day|
      if course.days.include?(day) && time == course.time
        return true
      end
    end
    false
  end
end
