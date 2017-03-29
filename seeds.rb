require_relative('model/student_details')
require_relative('model/houses')

require('pry')

Student.delete()
House.delete()


house1 = House.new({
  "name"=>"Gryffindor",
  "logo"=>"Gryffindor/logo"
  })

house2 = House.new({
  "name"=>"Hufflepuff",
  "logo"=>"Hufflepuff/logo"
  })

house1.save()
house2.save()

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_id" => house1.id,
  "age" => 11
})

student2 = Student.new({
  "first_name" => "Ron",
  "last_name" => "Weasley",
  "house_id" => house1.id,
  "age" => 12
  })

student1.save()
student2.save()


binding.pry
 nil
