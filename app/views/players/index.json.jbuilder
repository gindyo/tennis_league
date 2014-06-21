json.array!(@players) do |player|
  json.extract! player, :id, :home_court_id, :user_id
  json.url player_url(player, format: :json)
end
