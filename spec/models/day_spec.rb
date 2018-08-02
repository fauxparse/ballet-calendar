require 'rails_helper'

RSpec.describe Day, type: :model do
  subject(:day) { build(:day) }
  it { is_expected.to be_valid }
end
