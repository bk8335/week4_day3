require_relative('model/student_details')
require_relative('model/houses')

require('pry')

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house" => "Gryffindor",
  "age" => 11
})

student2 = Student.new({
  "first_name" => "Ron",
  "last_name" => "Weasley",
  "house" => "Gryffindor",
  "age" => 12
  })

student1.save()
student2.save()

house1 = House.new({
  "name"=>"Gryffindor",
  "logo"=>"Gryffindor/logo"
  })

house1.save()
binding.pry
 nil
