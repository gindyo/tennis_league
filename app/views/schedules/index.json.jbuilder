json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :player_id
  json.url schedule_url(schedule, format: :json)
end
