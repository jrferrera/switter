json.array!(@swits) do |swit|
  json.extract! swit, :id, :user_id, :content, :sweet, :sour, :tag
  json.url swit_url(swit, format: :json)
end
