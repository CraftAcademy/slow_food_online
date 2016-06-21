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
  end

  describe 'Relationships' do
    it {is_expected.to have_one :restaurant}
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_presence_of(:role) }
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
