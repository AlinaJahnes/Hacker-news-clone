require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do

  let! (:test_user) { User.create!(username: 'rabbit', password: 'carrot')}
  let! (:sample_article) { Article.create(title: 'Hello', body: 'Hello world!', user_id: test_user.id)}

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(:test_user)
  end

  describe '#index' do
    it "assigns @articles" do
      get :index
      expect(assigns(:articles)).to eq([sample_article])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe '#show' do
    it "has a title" do
      get :show, id: sample_article.id
      expect(assigns(:article)).to eq(sample_article)
    end

    it "renders show" do
      get :show, id: sample_article.id
      expect(response).to render_template("show")
    end
  end

  describe "#update" do
    it "saves a valid update" do
      put :update, {id: sample_article.id, article: {title: "Hello Everybody", body: "Hello world!", user_id: test_user.id}}
      expect(response).to redirect_to article_path(sample_article.reload)
    end
  end
end
