from dbRBAvg import insert_record

# player totals
player_id = 272
years = 3
games = 48
tds = 6
rushes_24 = 193
total_team_rushes = 428

# reception stats
rec_snaps = 644
targets = 147
receptions = 127
rec_yards = 894
rec_tds = 0
route_participation = .465

# rushing stats
rush_snaps = 444
attempts = 346
rush_yards = 1674
rush_tds = tds - rec_tds
yac = 3.36
rush_participation = rushes_24 / total_team_rushes


rb = {
    "player_id": player_id,
    "games_avg": games / years,
    "rush_snaps_avg": rush_snaps / years,
    "attempts_avg": attempts / years,
    "rush_yards_avg": rush_yards / years,
    "tds_avg": tds / years,
    "yards_after_contact_avg": yac,
    "rush_participation": rush_participation,
    "rec_snaps_avg": rec_snaps / years,       
    "targets_avg": targets / years,
    "receptions_avg": receptions / years,
    "rec_yards_avg": rec_yards / years,
    "targets_per_rr": targets / rec_snaps,
    "yards_per_rr": rec_yards / rec_snaps,
    "route_participation": route_participation,
    "fpts_per_rush_snap": (rush_yards * 0.1 + rush_tds * 6) / rush_snaps,
    "fpts_per_route": (receptions * 0.5 + rec_tds * 6 + rec_yards * 0.1) / rec_snaps
}

# print(rb)

insert_record(rb)