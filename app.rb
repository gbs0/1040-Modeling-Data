require_relative 'models/patient'
require_relative 'models/room'
require_relative 'repositories/room_repository'
require_relative 'repositories/patient_repository'

room_repo = RoomRepository.new('data/rooms.csv')
patient_repo = PatientRepository.new('data/patients.csv', room_repo)

room = room_repo.rooms.first
# asdrubal = patient_repo.patients.first

john = Patient.new(name: "John", age: 32)
anna = Patient.new(name: "Anna", age: 32)
bob = Patient.new(name: "Bob", age: 32)

# john.add_room(room)
# anna.add_room(room)
bob.add_room(room)
anna.add_room(room)
# asdrubal.add_room(room)


patient_repo.import_patient(bob)
patient_repo.import_patient(anna)
# p room.patients.count

