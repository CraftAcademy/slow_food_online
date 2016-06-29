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
    it { is_expected.to have_db_column :longitude }
    it { is_expected.to have_db_column :latitude }
  end

  describe 'Relationships' do
    it {is_expected.to belong_to :restaurant_category}
    it {is_expected.to belong_to :user}
    it {is_expected.to have_many :menu}
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_presence_of(:restaurant_category) }
  end

  describe '#full_street_address' do
    subject do
      FactoryGirl.create(:restaurant,
      name: 'Operakällaren',
      address: 'Karl XII:s torg, 111 86 Stockholm' )
    end

    it 'returns full address' do
      expect(subject.full_street_address).to eq 'Karl XII:s torg, 111 86 Stockholm'
    end

    it 'can has a latitude' do
      expect(subject.latitude).to eq 59.3303544
    end

    it 'can has a longitude' do
      expect(subject.longitude).to eq 18.0720205
    end
  end

end
