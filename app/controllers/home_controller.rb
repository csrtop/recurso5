class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    ActionCable.server.broadcast('notification_channel', 'You have visited the welcome page.')
  end
end
