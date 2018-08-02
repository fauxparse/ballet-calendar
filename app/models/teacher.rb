class Teacher < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :uid, uniqueness: { allow_blank: true }

  def name
    [first_name, last_initial].compact.join(' ')
  end

  def last_initial
    last_name&.first
  end
end
