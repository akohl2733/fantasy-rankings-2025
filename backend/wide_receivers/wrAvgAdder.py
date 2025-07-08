from wide_receivers.dbWrAvg import insert_record


wr_id = 317
years = 2
total_games = 33
targets = 176
receptions = 127
yards = 1731
tds = 14
routes = 835
yprr = 2.07
qb_rating_while_targeted = 127.3
projected_route_participation = 0.728
fantasy_points_per_route = ((receptions * 0.5) + (tds * 6) + (yards * 0.1)) / routes

wr = {
    "player_id": wr_id,
    "games_avg": total_games/years,
    "targets_avg": targets/years,
    "rec_avg": receptions/years,
    "yards_avg": yards/years,
    "tds_avg": tds/years,
    "yprr_avg": yprr,
    "rtg_avg": qb_rating_while_targeted,
    "recv_avg": routes/years,
    "tprr_avg": targets/routes * 100,
    "projected_route_part": projected_route_participation,
    "fpts_per_route": fantasy_points_per_route
}

insert_record(wr)