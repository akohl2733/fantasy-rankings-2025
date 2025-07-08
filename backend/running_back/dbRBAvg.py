import pymysql

def get_connection():
    return pymysql.connect(
        host="172.30.96.1",
        user="root",
        password="------",
        database="ff_25_v1",
        charset='utf8mb4'
    )

def insert_record(entry):
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute('''
        CREATE TABLE IF NOT EXISTS rb_avgs (
            player_id INT,
            games_avg DECIMAL(3,1),
            rush_snaps_avg DECIMAL(4,1),
            attempts_avg DECIMAL(4,1),
            rush_yards_avg DECIMAL(5,1),
            tds_avg DECIMAL(3,1),
            yards_after_contact_avg DECIMAL(3,2),
            rush_participation DECIMAL(4,3),
            rec_snaps_avg DECIMAL(4,1),       
            targets_avg DECIMAL(4,1),
            receptions_avg DECIMAL(4,1),
            rec_yards_avg DECIMAL(4,1),
            targets_per_rr DECIMAL(4,3),
            yards_per_rr DECIMAL(3,2),
            route_participation DECIMAL(4,3),
            fpts_per_rush_snap DECIMAL(3,2),
            fpts_per_route DECIMAL(3,2)
        )
    ''')

    cursor.execute('''
        INSERT INTO rb_avgs (player_id, games_avg, rush_snaps_avg, attempts_avg, rush_yards_avg, tds_avg, 
                   yards_after_contact_avg, rush_participation, rec_snaps_avg, targets_avg, receptions_avg, rec_yards_avg, 
                   targets_per_rr, yards_per_rr, route_participation, fpts_per_rush_snap, fpts_per_route)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    ''', (
        entry.get("player_id"),
        entry.get("games_avg"),
        entry.get("rush_snaps_avg"),
        entry.get("attempts_avg"),
        entry.get("rush_yards_avg"),
        entry.get("tds_avg"),
        entry.get("yards_after_contact_avg"),
        entry.get("rush_participation"),
        entry.get("rec_snaps_avg"),
        entry.get("targets_avg"),
        entry.get("receptions_avg"),
        entry.get("rec_yards_avg"),
        entry.get("targets_per_rr"),
        entry.get("yards_per_rr"),
        entry.get("route_participation"),
        entry.get("fpts_per_rush_snap"),
        entry.get("fpts_per_route")
    ))

    conn.commit()
    cursor.close()
    conn.close()