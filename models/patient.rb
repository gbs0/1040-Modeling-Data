class Patient
  attr_reader :age, :cured, :name
  attr_accessor :room, :id

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @cured = attributes[:cured] || false
    @age = attributes[:age]
    @room = attributes[:room]
  end

  def cure!
    @cured = true
  end

  def add_room(room)
    if room.full?
      puts "Can't add patient to this Room"
    else
      room.patients.push(self)
      self.room = room
    end
  end
end