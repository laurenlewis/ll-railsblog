json.array!(@samples) do |sample|
  json.extract! sample, :id, :fname, :lname, :email
  json.url sample_url(sample, format: :json)
end
