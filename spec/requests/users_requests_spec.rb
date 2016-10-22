# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe UsersController, type: :request do

  before do
    @user = User.create(name: "testuser", token: "aaa")
  end

  describe 'POST #create' do

    it 'ユーザーを作成', autodoc: true do
      post '/users', name: "testuser2"
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json["status"]).to eq(200)
    end

    it 'nameパラメータがない' do
      post '/users'
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json["status"]).to eq(403)
    end

    it '同じ名前のUserを作成' do
      post '/users', name: "testuser"
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json["status"]).to eq(403)
      expect(User.all.count).to eq(1)
    end
  end

  describe 'GET #show' do

    it 'ユーザーの情報を取得', autodoc: true do
      get '/users/1?token=aaa'
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json["status"]).to eq(200)
    end

    it 'ユーザーが存在しない' do
      get '/users/3?token=bbb'
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json["status"]).to eq(404)
    end
  end
end
