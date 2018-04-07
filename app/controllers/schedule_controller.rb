# require 'rubygems'
require 'open-uri'
require 'csv'


class ScheduleController < ApplicationController
  def index
    @schedule_items = []

    CSV.new(open("http://developer.mbta.com/lib/gtrtfs/Departures.csv"), :headers => :first_row).each do |line|
      puts line
      @schedule_items << line
      # @schedule_items << Time.at(line[0].to_i)
    end
    @north_station = @schedule_items.select {|station| station["Origin"] == 'North Station' }
    @south_station = @schedule_items.select {|station| station["Origin"] =='South Station' }
  end
end

# CSV.foreach(myfile.path) do |row|
#   rowarray << row
#   @rowarraydisp = rowarray
# end