class MessageFeedChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    puts "SUBSCRIBED" * 10
    p params
    feed = Conversation.find(params[:conversation_id])
    puts feed
    stream_for feed
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    puts "UNSUBSCRIBED" * 10
  end
end
