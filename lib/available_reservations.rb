require 'json'
require 'pry'
require_relative "reservation_service"
require_relative "campspot"

file = File.read("test-case.json")
request_data = JSON.parse(file)

reservations = ReservationService.new(request_data)
# binding.pry
