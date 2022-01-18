@students = [] # an empty array accessible to all methods

# Input for Hash of students
def input_students
    puts "Please enter the names of the students and their cohort, seperated by a comma ','"
    puts "To finish, just hit return twice"

    # Get the input
    input = STDIN.gets.chomp.split(', ')

    # While the name is not empty, repeat this code
    while !input.empty? do

        # Add default cohort
        if input[1] == nil
            input[1] = "default"
        end

        name = input[0]
        cohort = input[1]

      # Add the student name and cohort hash to the array
      add_students(name, cohort)

      
      # Correctly pluralise 'student/students'
      if @students.count == 1
        puts "Now we have #{@students.count} student"
      else
        puts "Now we have #{@students.count} students"
      end
      # Get another name from the user
      input = STDIN.gets.chomp.split(', ')
      
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
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
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
    when "3"
        save_students
    when "4"
        load_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
end

def interactive_menu
    try_load_students
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

def save_students
    # open the file for writing
    file = File.open("students.csv", "w")
    # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    file.close
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_students(name, cohort)
    end
    file.close
end

def add_students(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end

def try_load_students
    filename = ARGV.first # first argument from the command line
    return if filename.nil? # get out of the method if it isn't given
    if File.exists?(filename) # if it exists
      load_students(filename)
       puts "Loaded #{@students.count} from #{filename}"
    else # if it doesn't exist
      puts "Sorry, #{filename} doesn't exist."
      exit # quit the program
    end
end

interactive_menu