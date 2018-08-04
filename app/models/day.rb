class Day < ApplicationRecord
  has_many :assignments, -> { order(position: :asc) }
  has_many :teachers, through: :assignments

  validates :date, uniqueness: true

  def to_param
    date.to_s(:db)
  end
end
