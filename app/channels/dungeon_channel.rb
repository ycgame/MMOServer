# -*- coding: utf-8 -*-
class DungeonChannel < ApplicationCable::Channel

  # ダンジョンを形成するサーバー

  def subscribed

    # Redisをセットアップ
    set_redis

    # BroadcastするChannelを設定
    stream_from "dungeon_channel"
  end

  def unsubscribed

    # 購読解除
    @redis.set(uuid, nil)
  end

  def mm_auth(data)
    
    stoken = data["stoken"]
    
    if stoken == "aaa"
      @redis.set('mm', uuid)
      DungeonChannel.broadcast_to(@redis.get('mm'), {log: "Connect OK"})
      ActionCable.server.broadcast "dungeon_channel",
      {
        log: "Connect OK2"
      }
    end
  end
  
  def auth(data)
    
    id    = data["id"]
    token = data["token"]
    
    @user  = User.find_by_id(id)
    @token = @user.token
    
    # 認証成功(失敗した場合は無視)
    if @user != nil && @token != nil && token = @token
      
      # Redisにユーザー情報をセット
      @redis.set(uuid, @user.to_json)

      # 認証成功を伝える
      # ここですべてのユーザーの情報とモンスターの情報を伝える(未実装)
      stream_for @user
      DungeonChannel.broadcast_to(@user, {status: 0})

      # MMと他のユーザーに伝える
      ActionCable.server.broadcast "dungeon_channel",
      {
        user: @redis.get(uuid),
        x: data["x"],
        y: data["y"],
      }
    end
  end

  # 動いたということを伝える
  def move(data)

    # 認証されていない
    if @redis.get(uuid) == nil
      # 無視
      return
    end
    
    # DungeonChannelにいるユーザーに情報を伝える
    ActionCable.server.broadcast "dungeon_channel",
    {
      user: @redis.get(uuid), # Redisに保存されているUserデータ
      x: data["x"], 
      y: data["y"],
      pos_x: data["pos_x"],
      pos_y: data["pos_y"]
    }
  end

  # モンスターをターゲットに取ったということを伝える
  def target(data)
  end

  # モンスターのステータスを伝える?
  def status
  end

end
