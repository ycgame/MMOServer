# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class DungeonChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "example_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def move(data)
    ActionCable.server.broadcast "example_channel", x: data["x"], y: data["y"]
  end
end
