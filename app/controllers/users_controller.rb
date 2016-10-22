# -*- coding: utf-8 -*-
class UsersController < ApplicationController

  before_action :set_user, except: [:create]
  
  def create
    name  = user_params[:name]
    token = SecureRandom.urlsafe_base64
    
    @user = User.new(name: name, token: token)
    
    return render :json => @user.to_json({:status => 403, :message => "nameパラメータを指定してください"}) if @user[:name] == nil
    
    if @user.save
      render :json => @user
    else
      render :json => @user.to_json({:status => 403, :message => "名前が使用できません"})
    end
  end

  def show
    render :json => @user
  end
  
  private

  def user_params
    params.permit(:id, :name, :token)
  end

  def set_user
    @user = User.find_by_id(params[:id])
    
    return render :json => {status: 404, :message => "ユーザーが存在しません"} if @user == nil
    return render :json => {status: 403, :message => "パラメータが指定されていません"} if user_params == nil
    return render :json => {status: 403, :message => "正しいトークンを指定してください"} if @user[:token] != user_params[:token]
  end

end
