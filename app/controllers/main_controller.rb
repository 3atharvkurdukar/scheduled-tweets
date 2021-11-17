class MainController < ApplicationController
  def index

    # The flash will persist through one extra request, before vanishing

    flash[:info] = "You have logged in successfully!"

    # With flash.now, the flash will be gone on next request

    flash.now[:danger] = "Invalid configuration"
  end
end
