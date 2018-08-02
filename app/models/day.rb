class Day < ApplicationRecord
  validates :date, uniqueness: true

  def to_param
    date.to_s(:db)
  end
end
