json.array!(@explores) do |explore|
  json.extract! explore, :id, :restaurant_name, :latitude, :longitude, :food_type, :deals, :hours, :location, :address
  json.url explore_url(explore, format: :json)
end
