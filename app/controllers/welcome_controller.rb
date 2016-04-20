class WelcomeController < ApplicationController

  def index
    @random_image = rand 1..26
  end
end
