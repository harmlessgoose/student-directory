@students = [] # an empty array accessible to all methods

# Input for Hash of students
def input_students
    puts "Please enter the names of the students and their cohort, seperated by a comma ','"
    puts "To finish, just hit return twice"

    # Get the input
    input = gets.chomp.split(', ')

    # While the name is not empty, repeat this code
    while !input.empty? do

        # Add default cohort
        if input[1] == nil
            input[1] = "default"
        end

      # Add the student name and cohort hash to the array
      @students << {name: input[0], cohort: input[1].to_sym}
      
      # Correctly pluralise 'student/students'
      if @students.count == 1
        puts "Now we have #{@students.count} student"
      else
        puts "Now we have #{@students.count} students"
      end
      # Get another name from the user
      input = gets.chomp.split(', ')
      
    end

    # Return the array of students

end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_students_list
    @students.each do |student, index|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer
    puts "Overall, we have #{@students.count} great students"
end

def print_menu
      puts "1. Input the students"
      puts "2. Show the students"
      puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
    if @students.empty?
        puts "We have no students"
    else
        print_header
        print_students_list
        print_footer
    end
end

def process(selection)
    case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
end


def interactive_menu
    loop do
        print_menu
        process(gets.chomp)
    end
end

interactive_menu