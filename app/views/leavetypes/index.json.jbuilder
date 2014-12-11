json.array!(@leavetypes) do |leavetype|
  json.extract! leavetype, :id, :name, :status
  json.url leavetype_url(leavetype, format: :json)
end
