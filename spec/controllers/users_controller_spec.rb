require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:admin_attributes) { { first_name: "Bruce",
                             last_name:  "Wayne",
                             email:      "Bruce_Wayne@WayneEnterprises.com",
                             username:   "webmaster",
                             password:   "password" }
  }

  let(:valid_attributes) do
    { first_name: "Jim",
      last_name: "Jones",
      email: "jimmy@jones.com",
      username: "Jim",
      password: "password",
      password_confirmation: "password" }
  end

  let(:invalid_attributes) do
    { first_name: nil,
      last_name: nil,
      email: nil,
      username: nil,
      password: nil,
      password_confirmation: nil}
  end

  let(:admin_user) {
    User.new(admin_attributes).tap do |admin|
      admin.roles = [Role.create(name: "webmaster"), Role.create(name: "admin")]
      admin.save!
    end
  }

  let(:user) do
    User.create valid_attributes
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)
  end

  describe "GET index" do
    it "assigns all users as @users" do
      get :index, {}
      expect(assigns(:users)).to eq([admin_user])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      get :show, {:id => user.to_param}
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new, {}
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      get :edit, {:id => user.to_param}
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new user" do
        expect {
          post :create, {:user => valid_attributes}
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes}
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the created user" do
        post :create, {:user => valid_attributes}
        expect(response).to redirect_to(User.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, {:user => invalid_attributes}
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, {:user => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {first_name: "NewName",
         last_name: "Smith",
         email: "NewMail",
         username: "Newsername",
         password: "password",
         password_confirmation: "password"
         }
      }

      it "updates the requested user" do
        put :update, {:id => user.to_param, :user => new_attributes}
        user.reload
        expect(user.first_name).to eq("NewName")
        expect(user.last_name).to eq("Smith")
        expect(user.email).to eq("NewMail")
      end

      it "assigns the requested user as @user" do
        put :update, {:id => user.to_param, :user => valid_attributes}
        expect(assigns(:user)).to eq(user)
      end

      it "redirects to the user" do
        put :update, {:id => user.to_param, :user => valid_attributes}
        expect(response).to redirect_to(user)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        put :update, {:id => user.to_param, :user => invalid_attributes}
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => user.to_param, :user => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      user2 = User.create valid_attributes
      expect {
        delete :destroy, {:id => user2.to_param}
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete :destroy, {:id => user.to_param}
      expect(response).to redirect_to(users_url)
    end
  end
end
