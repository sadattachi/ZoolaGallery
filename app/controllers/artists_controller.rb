class ArtistsController < ApplicationController
  def index
    @artists = User.all
  end
end
