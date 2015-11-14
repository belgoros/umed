json.array!(@answers) do |answer|
  json.extract! answer, :id, :text, :subject
  json.url answer_url(answer, format: :json)
end
