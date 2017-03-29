require_relative('../db/sql_runner')

class Student

  attr_reader :id,:house_id
  attr_accessor :first_name, :last_name,  :age

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def save
    sql = "INSERT INTO students ( first_name, last_name, house_id, age) VALUES ( '#{@first_name}', '#{@last_name}', #{@house_id}, #{@age}) RETURNING * "
    student_data = SqlRunner.run(sql)
    @id = student_data.first()['id'].to_i
  end
  
  def self.delete()
    sql = "DELETE FROM students;"
    SqlRunner.run( sql )
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
def find_house()
  sql = "SELECT * FROM houses WHERE id = #{@house_id}"
  find_house = SqlRunner.run(sql).first
  return House.new(find_house)
end

end