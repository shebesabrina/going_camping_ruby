require 'date'

class Campspot
  attr_reader :reservations, :name

  def initialize(name, id, reservations = [], gap_rule = 1)
    @id = id
    @name = name
    @reservations = reservations
    @gap_rule = gap_rule
  end

  def dates_unavailable(search)
    unavailable = @reservations.find do |res|

      res_start_gap = Date.parse(res["startDate"]) - @gap_rule
      res_end_gap = Date.parse(res["endDate"])
      search_start = Date.parse(search["startDate"])
      search_end = Date.parse(search["endDate"])

      search_end >= res_start_gap && search_end <= res_end_gap || search_start >= res_start_gap && search_start <= res_end_gap

    end
    return false if unavailable
    return true
  end
end
