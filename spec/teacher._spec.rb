require 'rspec'
require './teacher'

describe Teacher do
  before(:each) do
    @teacher = Teacher.new(20, 'Michael', nil, 'Software Engineering')
  end
  context 'when creating a new book' do
    it 'should create a new student' do
      teacher = Teacher.new(20, 'Michael', nil, 'Software Engineering')
      expect(teacher.class.name).to eq('Teacher')
    end
  end
    context 'when I call the can_use_services? method' do
    it 'Teacher should be able to use services' do
      expect(@teacher.can_use_services?).to eq(true)
    end
  end
end
