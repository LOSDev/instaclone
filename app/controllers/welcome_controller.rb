class WelcomeController < ApplicationController

  def index
    @random_image = [2, 5, 7, 8, 9, 11, 13, 15, 16].sample
  end
end
