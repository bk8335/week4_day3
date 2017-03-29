require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './model/student_details')

get '/students' do
@students = Student.all()
erb(:index)
  end
