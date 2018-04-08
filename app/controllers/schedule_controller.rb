require 'open-uri'
require 'csv'


class ScheduleController < ApplicationController
  def index
    @schedule_items = []

    begin
      mbta_csv = CSV.new(open("http://developer.mbta.com/lib/gtrtfs/Departures.csv"), :headers => :first_row)
      mbta_csv.each do |line|
        @schedule_items << line
      end
      @north_station = @schedule_items.select {|station| station["Origin"] == 'North Station' }
      @south_station = @schedule_items.select {|station| station["Origin"] =='South Station' }
    rescue =>e
      @error= e.message
    end

  end
end
