class AvailabilityController < ApplicationController
  def index
  end

  private

  def calendar
    @calendar ||= Calendar.new
  end

  helper_method :calendar
end
