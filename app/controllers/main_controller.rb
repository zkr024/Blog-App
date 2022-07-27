class MainController < ApplicationController
  before_action :authenticate_person!

  def index; end
end
