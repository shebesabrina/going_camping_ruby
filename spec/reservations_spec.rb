require 'json'
require 'pry'
require_relative "../lib/reservation_service"
require_relative "../lib/campspot"

describe 'default' do
  before do
    file = File.read("test-case.json")
    request_data = JSON.parse(file)

    @reservations = ReservationService.new(request_data)
  end
  it 'returns available cabins' do
    actual_reservations = @reservations.available_reservations

    expect(actual_reservations).to include("Comfy Cabin")
    # expect(actual_reservations).to include("Rickety Cabin")
    expect(actual_reservations).to include("Cabin in the Woods")

    expect(actual_reservations).to_not include("Cozy Cabin")
    expect(actual_reservations).to_not include("Rustic Cabin")
  end
end
