class StaticPagesController < ApplicationController

  def contact
  end

  def home
  end

  def register
  end

  def nearby
    @hash = Gmaps4rails.build_markers(@explores) do |explores, marker|
      marker.lat explores.latitude
      marker.lng explores.longitude
    end
  end
  end
