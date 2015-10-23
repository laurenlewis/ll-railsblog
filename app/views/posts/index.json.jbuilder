json.array!(@posts) do |user|
  json.extract! post, :id, :content
  json.url post_url(post, format: :json)
end