require_relative('../db/sql_runner')

class House
attr_reader :id
attr_accessor :name,:logo
def initialize(options)
  @id = options['id'].to_i
  @name = options['name']
  @logo = options['logo']

end
def save
 sql = "INSERT INTO houses(name,logo) VALUES('#{@name}','#{@logo}') RETURNING *"
 house = SqlRunner.run(sql)
 @id = house.first()['id'].to_i
end
end