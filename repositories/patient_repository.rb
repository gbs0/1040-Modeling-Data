require 'csv'
require 'pry'

class PatientRepository
  attr_reader :patients

  def initialize(csv_file, room_repo)
    @csv_file = csv_file
    @patients = []
    @next_id = 0
    @room_repo = room_repo
    load_csv
  end

  def import_patient(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
    save_csv
  end

  def save_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << %w[id name cured age room_id]
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured, patient.age, patient.room.id]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      room = @room_repo.find(row[:room_id].to_i) # Retornar uma instancia de Room
      row[:id] = row[:id].to_i
      row[:age] = row[:age].to_i
      row[:cured] = row[:cured] == "true"
      row[:room] = room
      @patients << Patient.new(row)
    end
    @next_id = @patients.empty? ? 1 : (@patients.last.id + 1)
  end
end