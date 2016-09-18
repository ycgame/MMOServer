# -*- coding: utf-8 -*-
class UsersController < ApplicationController

  before_action :set_salt
  before_action :set_user, except: [:create]
  
  def create
    
    name     = user_params[:name]
    password = user_params[:password].crypt(@salt)
    
    @user = User.new({name: name, password: password})
    
    if @user[:name] == nil
      render :json => @user.to_json({:status => 403, :message => "nameパラメータを指定してください"})
      return
    end

    if @user.save
      render :json => @user
    else
      render :json => @user.to_json({:status => 403, :message => "名前が使用できません"})
    end
  end

  def login

    @user.update(token: SecureRandom.urlsafe_base64)

    render :json => @user

  end

  def show
    render :json => @user
  end
  
  private

  def set_user
    
    @user = User.find_by_id(params[:id])
    
    if @user == nil
      render :json => {status: 404, :message => "ユーザーが存在しません"}
    end
    
    password = user_params[:password].crypt(@user[:password])
    
    if password != @user[:password]
      render :json => {:status => 403, :message => "認証に失敗しました"}
    end
  end
  
  def set_salt
    @salt = [rand(64),rand(64)].pack("C*").tr("\x00-\x3f","A-Za-z0-9./")
  end

  def user_params
    params.permit(:id, :name, :password)
  end

end
