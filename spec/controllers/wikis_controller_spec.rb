require 'rails_helper'

RSpec.describe WikisController, type: :controller do

  # let(:my_user) { User.create!(email: 'example@example.com', password: 'helloworld', password_confirmation: 'helloworld') }
  # let(:my_wiki) { Wiki.create!(title: "hello!", body: "noooo!", user: my_user)}
  let(:my_user) { create(:user) }
  let(:my_wiki) { create(:wiki, user: my_user) }
  
  describe "GET index" do
    it "returns http success" do
      # p my_wiki
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns Wiki.all to wikis" do
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end
  end
  
  describe "GET show" do
    it "returns http success" do
      get :show, params: {id: my_wiki.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, params: {id: my_wiki.id}
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, params: {id: my_wiki.id}
      expect(assigns(:wiki)).to eq(my_wiki)
    end
  end
end
