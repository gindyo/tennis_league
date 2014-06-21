json.array!(@ranking_points_entries) do |ranking_points_entry|
  json.extract! ranking_points_entry, :id, :expire_on, :total_points, :player_id
  json.url ranking_points_entry_url(ranking_points_entry, format: :json)
end
