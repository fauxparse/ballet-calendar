class Assignment < ApplicationRecord
  belongs_to :day
  belongs_to :teacher

  acts_as_list scope: :day
end
