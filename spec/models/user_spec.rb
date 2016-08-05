require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have valid Factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it 'is a customer by default' do
    expect(subject.role).to eq 'customer'
  end

  describe 'DB table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :username }
    it { is_expected.to have_db_column :role }
    it { is_expected.to have_db_column :full_name }
    it { is_expected.to have_db_column :phone_number }
    it { is_expected.to have_db_column :street }
    it { is_expected.to have_db_column :city }
    it { is_expected.to have_db_column :zip_code }
    it { is_expected.to have_db_column :cardholder }
    it { is_expected.to have_db_column :card_number }
    it { is_expected.to have_db_column :expiration_date }
    it { is_expected.to have_db_column :cvc }
  end

  describe 'Relationships' do
    it { is_expected.to have_one :restaurant }
    it { is_expected.to have_many :orders }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_presence_of(:role) }

    context 'Validate email' do
      it { is_expected.to allow_value('user@example.com').for(:email) }
      it { is_expected.not_to allow_value('user@example').for(:email) }
      it { is_expected.not_to allow_value('123@123').for(:email) }
    end

    context 'Validate credit card information' do
      it { is_expected.to allow_value('123').for(:cvc) }
      it { is_expected.not_to allow_value('12').for(:cvc) }
      it { is_expected.not_to allow_value('1234').for(:cvc) }
      it { is_expected.not_to allow_value('a1c').for(:cvc) }
    end
  end

  describe '#role' do
    it 'is a customer by default' do
      expect(subject.role).to eq 'customer'
    end

    it 'can set the role to admin' do
      admin = FactoryGirl.create(:user, role: 'admin')
      expect(admin).to be_valid
    end

    it 'returns true on #admin? if role == \'admin\'' do
      admin = FactoryGirl.create(:user, role: 'admin')
      expect(admin.admin?).to eq true
    end

    it 'returns false on #admin? if role != \'admin\'' do
      not_admin = FactoryGirl.create(:user, role: 'customer')
      expect(not_admin.admin?).to eq false
    end

    it 'can set the role to restaurant owner' do
      owner = FactoryGirl.create(:user, role: 'restaurant_owner')
      expect(owner).to be_valid
    end

    it 'returns true on #rest_owner? if role == \'admin\'' do
      rest_owner = FactoryGirl.create(:user, role: 'restaurant_owner')
      expect(rest_owner.rest_owner?).to eq true
    end

    it 'returns false on #rest_owner? if role != \'restaurant_owner\'' do
      not_rest_owner = FactoryGirl.create(:user, role: 'customer')
      expect(not_rest_owner.rest_owner?).to eq false
    end

    it 'cannot set the role to x' do
      expect { FactoryGirl.create(:user, role: 'x') }
          .to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Role x is not permitted')
    end
  end

end
