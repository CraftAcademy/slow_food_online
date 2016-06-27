require 'rails_helper'

RSpec.describe Dish, type: :model do

  it 'should have valid Factory' do
    expect(FactoryGirl.create(:dish)).to be_valid
  end

  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :allergy_info }
    it { is_expected.to have_db_column :price }
    it { is_expected.to have_db_column :calories }
    it { is_expected.to have_db_column :img_url }
  end
end
