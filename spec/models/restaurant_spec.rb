require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'Fixtures' do
    it 'should have valid Factory' do
      expect(FactoryGirl.create(:restaurant)).to be_valid
    end
  end

  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :address }
    it { is_expected.to have_db_column :phone }
    it { is_expected.to have_db_column :org_number }
  end

  describe 'Relationships' do
    it {is_expected.to belong_to :restaurant_category}
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:restaurant_category) }

  end
end
