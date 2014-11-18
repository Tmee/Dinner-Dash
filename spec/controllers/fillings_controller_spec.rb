require 'rails_helper'

RSpec.describe FillingsController, :type => :controller do

  let(:valid_attributes) {
    { title: 'Carnitas', description: "Hot and porky", price: 3, food_group: "Meat"}
  }

  let(:invalid_attributes) {
    { title: nil, description: nil, price: nil, food_group: nil }
  }
  
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all fillings as @fillings" do
      filling = Filling.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:fillings)).to eq([filling])
    end
  end

  describe "GET show" do
    it "assigns the requested filling as @filling" do
      filling = Filling.create! valid_attributes
      get :show, {:id => filling.to_param}, valid_session
      expect(assigns(:filling)).to eq(filling)
    end
  end

  describe "GET new" do
    it "assigns a new filling as @filling" do
      get :new, {}, valid_session
      expect(assigns(:filling)).to be_a_new(Filling)
    end
  end

  describe "GET edit" do
    it "assigns the requested filling as @filling" do
      filling = Filling.create! valid_attributes
      get :edit, {:id => filling.to_param}, valid_session
      expect(assigns(:filling)).to eq(filling)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new filling" do
        expect {
          post :create, {:filling => valid_attributes}, valid_session
        }.to change(Filling, :count).by(1)
      end

      it "assigns a newly created filling as @filling" do
        post :create, {:filling => valid_attributes}, valid_session
        expect(assigns(:filling)).to be_a(Filling)
        expect(assigns(:filling)).to be_persisted
      end

      it "redirects to the created filling" do
        post :create, {:filling => valid_attributes}, valid_session
        expect(response).to redirect_to(Filling.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved filling as @filling" do
        post :create, {:filling => invalid_attributes}, valid_session
        expect(assigns(:filling)).to be_a_new(Filling)
      end

      it "re-renders the 'new' template" do
        post :create, {:filling => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {title: "NewTitle", description: "NewDescription", price: 3, food_group: "NewGroup" }
      }

      it "updates the requested filling" do
        filling = Filling.create! valid_attributes
        put :update, {:id => filling.to_param, :filling => new_attributes}, valid_session
        filling.reload
        expect(filling.title).to eq("NewTitle")
        expect(filling.description).to eq("NewDescription")
        expect(filling.price).to eq(3)
        expect(filling.food_group).to eq("NewGroup")
      end

      it "assigns the requested filling as @filling" do
        filling = Filling.create! valid_attributes
        put :update, {:id => filling.to_param, :filling => valid_attributes}, valid_session
        expect(assigns(:filling)).to eq(filling)
      end

      it "redirects to the filling" do
        filling = Filling.create! valid_attributes
        put :update, {:id => filling.to_param, :filling => valid_attributes}, valid_session
        expect(response).to redirect_to(filling)
      end
    end

    describe "with invalid params" do
      it "assigns the filling as @filling" do
        filling = Filling.create! valid_attributes
        put :update, {:id => filling.to_param, :filling => invalid_attributes}, valid_session
        expect(assigns(:filling)).to eq(filling)
      end

      it "re-renders the 'edit' template" do
        filling = Filling.create! valid_attributes
        put :update, {:id => filling.to_param, :filling => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested filling" do
      filling = Filling.create! valid_attributes
      expect {
        delete :destroy, {:id => filling.to_param}, valid_session
      }.to change(Filling, :count).by(-1)
    end

    it "redirects to the fillings list" do
      filling = Filling.create! valid_attributes
      delete :destroy, {:id => filling.to_param}, valid_session
      expect(response).to redirect_to(fillings_url)
    end
  end

end
