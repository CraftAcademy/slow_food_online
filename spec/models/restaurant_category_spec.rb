require 'rails_helper'

RSpec.describe RestaurantCategory, type: :model do

  describe 'Fixtures' do
    it 'should have valid Factory' do
      expect(FactoryGirl.create(:restaurant_category)).to be_valid
    end
  end

  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :title }
  end

end
