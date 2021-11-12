require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should belong_to(:doctor) }
  end
end