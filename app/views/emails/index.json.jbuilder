json.array!(@emails) do |email|
  json.extract! email, :id, :name, :interval, :scalar, :recipients, :report
  json.url email_url(email, format: :json)
end
