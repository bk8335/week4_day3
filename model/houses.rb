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

def self.delete()
  sql = "DELETE FROM houses"
  SqlRunner.run( sql )
end

def self.all
  sql = "SELECT * FROM houses"
  houses = SqlRunner.run(sql)
  houses_all = houses.map{|house| House.new(house)}
  return houses_all
end

def self.find(id)
  sql = "SELECT * FROM houses where id = #{id} "
  find_house = SqlRunner.run(sql)
  return find_house.first()
end
end