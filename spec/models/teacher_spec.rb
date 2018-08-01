require 'rails_helper'

RSpec.describe Teacher, type: :model do
  subject(:teacher) { build(:teacher) }

  it { is_expected.to be_valid }
end
