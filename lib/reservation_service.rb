class ReservationService
  attr_reader :search

  def initialize(request_data)
    @search = request_data["search"]
    @campsites = ReservationService.get_all_campsites(request_data)
  end

  def available_reservations
    available_campsites = @campsites.find_all do |campsite|
      campsite.reservations.empty? || !campsite.dates_unavailable(search)
      # return false if campsite.dates_unavailable(search)
    end
    available_campsites.map(&:name)
  end

    private

    def self.get_all_campsites(data)
      campsites = data["campsites"]
      reservations = data["reservations"]
      campsites.map do |campsite|
        Campspot.new(campsite["name"], campsite["id"],
          ReservationService.get_reservations(reservations, campsite["id"]))
      end
    end

    def self.get_reservations(reservations, campsite_id)
      reservations.select { |camp| camp["campsiteId"] == campsite_id }
    end
end
