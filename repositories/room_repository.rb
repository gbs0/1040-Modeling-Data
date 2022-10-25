require 'csv'

class RoomRepository
  attr_reader :rooms

  def initialize(csv_file)
    @csv_file = csv_file
    @rooms = []
    load_csv
  end

  def find(id)
    @rooms.find { |room| room.id == id }
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i
      @rooms << Room.new(row)
    end   
  end
end