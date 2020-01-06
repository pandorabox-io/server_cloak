
if minetest.settings:get_bool("server_announce", false) then
  -- only change announce setting if it was enabled in the first place

  local timer = 0
  minetest.register_globalstep(function(dtime)
    timer = timer + dtime
    if timer < 15 then
      return
    end

    timer = 0

    local threshold = tonumber(minetest.settings:get("server_cloak.threshold") or "15")
    local player_count = #minetest.get_connected_players()

    minetest.settings:set_bool("server_announce", player_count < threshold)
  end)

end
