require_relative('../db/sql_runner')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house, :age

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age'].to_i
  end

  def save
    sql = "INSERT INTO students ( first_name, last_name, house, age) VALUES ( '#{@first_name}', '#{@last_name}', '#{@house}', #{@age}) RETURNING * "
    student_data = SqlRunner.run(sql)
    @id = student_data.first()['id'].to_i
  end
  def self.all
    sql = "SELECT * FROM students "
    students = SqlRunner.run(sql)
    student_all = students.map{|student| Student.new(student)}
    return student_all
  end
def self.find(id)
  sql = "SELECT * FROM students where id = #{id} "
  find_student = SqlRunner.run(sql)
  return find_student.first()
end

end