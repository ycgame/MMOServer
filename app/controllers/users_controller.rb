# -*- coding: utf-8 -*-
class UsersController < ApplicationController

  before_action :set_user, except: [:index, :create, :new]

  def create

    @user = User.new(user_params)

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

    # 今はパスワードは無視
    
    if @user == nil
      render :json => {status: 404, :message => "ユーザーが存在しません"}
      return
    end

    @user.update(token: SecureRandom.urlsafe_base64)

    render :json => @user

  end

  def show

    if @user == nil
      render :json => {status: 404, :message => "ユーザーが存在しません"}
      return
    end

    render :json => @user
  end
  
  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.permit(:name)
  end

end
