json.array!(@banners) do |banner|
  json.extract! banner, :url, :size_x, :size_y
  json.url banner_url(banner, format: :json)
end
