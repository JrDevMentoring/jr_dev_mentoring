json.array!(@internships) do |internship|
  json.extract! internship, :id
  json.url internship_url(internship, format: :json)
end
