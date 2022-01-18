# Input for Hash of students
def input_students
    puts "Please enter the names of the students and their cohort, seperated by a comma ','"
    puts "To finish, just hit return twice"

    # Create an empty array
    students = []

    # Get the input
    input = gets.chomp.split(', ')


    
    # While the name is not empty, repeat this code
    while !input.empty? do

        # Add default cohort
        if input[1] == nil
            input[1] = "default"
        end

      # Add the student name and cohort hash to the array
      students << {name: input[0], cohort: input[1].to_sym}
      
      if students.count == 1
        puts "Now we have #{students.count} student"
      else
        puts "Now we have #{students.count} students"
      end
      # Get another name from the user
      input = gets.chomp.split(', ')
      
    end

    # Return the array of students
    students

end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    students.each do |student, index|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end
  
students = input_students
print_header
print(students)
print_footer(students)