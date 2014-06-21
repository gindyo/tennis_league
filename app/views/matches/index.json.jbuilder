json.array!(@matches) do |match|
  json.extract! match, :id, :place_id, :host_id, :visitor_id, :date
  json.url match_url(match, format: :json)
end
