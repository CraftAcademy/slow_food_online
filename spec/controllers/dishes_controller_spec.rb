require 'rails_helper'

RSpec.describe DishesController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DishesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all dishes as @dishes" do
      dish = Dish.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:dishes)).to eq([dish])
    end
  end

  describe "GET #show" do
    it "assigns the requested dish as @dish" do
      dish = Dish.create! valid_attributes
      get :show, {:id => dish.to_param}, valid_session
      expect(assigns(:dish)).to eq(dish)
    end
  end

  describe "GET #new" do
    it "assigns a new dish as @dish" do
      get :new, {}, valid_session
      expect(assigns(:dish)).to be_a_new(Dish)
    end
  end

  describe "GET #edit" do
    it "assigns the requested dish as @dish" do
      dish = Dish.create! valid_attributes
      get :edit, {:id => dish.to_param}, valid_session
      expect(assigns(:dish)).to eq(dish)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Dish" do
        expect {
          post :create, {:dish => valid_attributes}, valid_session
        }.to change(Dish, :count).by(1)
      end

      it "assigns a newly created dish as @dish" do
        post :create, {:dish => valid_attributes}, valid_session
        expect(assigns(:dish)).to be_a(Dish)
        expect(assigns(:dish)).to be_persisted
      end

      it "redirects to the created dish" do
        post :create, {:dish => valid_attributes}, valid_session
        expect(response).to redirect_to(Dish.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved dish as @dish" do
        post :create, {:dish => invalid_attributes}, valid_session
        expect(assigns(:dish)).to be_a_new(Dish)
      end

      it "re-renders the 'new' template" do
        post :create, {:dish => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested dish" do
        dish = Dish.create! valid_attributes
        put :update, {:id => dish.to_param, :dish => new_attributes}, valid_session
        dish.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested dish as @dish" do
        dish = Dish.create! valid_attributes
        put :update, {:id => dish.to_param, :dish => valid_attributes}, valid_session
        expect(assigns(:dish)).to eq(dish)
      end

      it "redirects to the dish" do
        dish = Dish.create! valid_attributes
        put :update, {:id => dish.to_param, :dish => valid_attributes}, valid_session
        expect(response).to redirect_to(dish)
      end
    end

    context "with invalid params" do
      it "assigns the dish as @dish" do
        dish = Dish.create! valid_attributes
        put :update, {:id => dish.to_param, :dish => invalid_attributes}, valid_session
        expect(assigns(:dish)).to eq(dish)
      end

      it "re-renders the 'edit' template" do
        dish = Dish.create! valid_attributes
        put :update, {:id => dish.to_param, :dish => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested dish" do
      dish = Dish.create! valid_attributes
      expect {
        delete :destroy, {:id => dish.to_param}, valid_session
      }.to change(Dish, :count).by(-1)
    end

    it "redirects to the dishes list" do
      dish = Dish.create! valid_attributes
      delete :destroy, {:id => dish.to_param}, valid_session
      expect(response).to redirect_to(dishes_url)
    end
  end

end
