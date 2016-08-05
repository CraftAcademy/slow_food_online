require 'rails_helper'

RSpec.describe 'Menu Data', type: :request do

  describe 'GET /api/v1/menus' do
    let!(:restaurant) { FactoryGirl.create(:restaurant, name: 'Inconto')}
    let!(:menu1) { FactoryGirl.create(:menu, name: 'Lunch menu', restaurant: restaurant) }
    let!(:menu2) { FactoryGirl.create(:menu, name: 'Family menu', restaurant: restaurant) }

    it 'gets 2 menus for the restaurant Inconto' do
      get '/api/v1/menus', restaurant: restaurant.name
      expect(response_json['entries'].count).to eq 2
    end
  end
end
