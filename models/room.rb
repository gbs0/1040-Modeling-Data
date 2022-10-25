class Room
  attr_reader :number, :capacity
  attr_accessor :patients, :id
  

  def initialize(attributes = {})
    @id = attributes[:id]
    @number = attributes[:number]
    @capacity = attributes[:capacity]
    @patients = []
  end

  def full?
    @patients.size >= @capacity 
  end
end