json.array!(@listings) do |listing|
  json.extract! listing, :id, :restaurant_name, :menu_item, :price, :hours, :location
  json.url listing_url(listing, format: :json)
end
