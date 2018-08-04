class Calendar
  include Enumerable

  attr_reader :start_date, :end_date

  def initialize
    @start_date = Time.zone.today
    @end_date = @start_date + 1.year
  end

  def dates(&block)
    return enum_for(:dates) unless block_given?

    Rails.logger.info existing.inspect

    date = first_sunday
    while date <= end_date
      yield find(date)
      date += 1.week
    end
  end

  def to_ary
    dates.to_a
  end

  private

  def first_sunday
    start_date - start_date.wday
  end

  def find(date)
    existing[date] ||= Day.new(date: date)
  end

  def existing
    @existing ||= scope.all.index_by(&:date)
  end

  def scope
    Day.where(date: start_date..end_date).includes(assignments: :teacher)
  end
end
