class Teacher < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :uid, uniqueness: { allow_blank: true }
end
