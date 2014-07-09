class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create
    user = User.find_by_email(params[:sender])
    topic = Topic.find_by_name(params[:subject])
    url = params["body-plain"]

    if user.nil?
      user = User.new(
        email: params[:sender],
        password: Faker::Lorem.characters(10)
      )
      user.skip_confirmation!
      user.save
    end 

    if topic.nil?
      topic = Topic.new(name: params[:subject])
      topic.save
    end

    bookmark = user.bookmarks.build(url: url)
    bookmark.topic = topic
    bookmark.save

    head 200
  end
end