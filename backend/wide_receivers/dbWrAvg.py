import pymysql

def get_connection():
    return pymysql.connect(
        host="172.30.96.1",
        user="root",
        password="-------",
        database="ff_25_v1",
        charset='utf8mb4'
    )

def insert_record(entry):
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute('''
        CREATE TABLE IF NOT EXISTS wr_avgs (
            player_id INT,
            games_avg DECIMAL(3,1),
            targets_avg DECIMAL(4,1),
            rec_avg DECIMAL(4,1),
            yards_avg DECIMAL(5,1),
            tds_avg DECIMAL(3,1),
            yprr_avg DECIMAL(3,2),
            rtg_avg DECIMAL(4,1),
            recv_avg DECIMAL(5,1),
            tprr_avg DECIMAL(3,2),
            projected_route_part DECIMAL(4,3),
            fpts_per_route DECIMAL(4,2)
        )
    ''')

    cursor.execute('''
        INSERT INTO wr_avgs (player_id, games_avg, targets_avg, rec_avg, yards_avg, tds_avg, 
                   yprr_avg, rtg_avg, recv_avg, tprr_avg, projected_route_part, fpts_per_route)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    ''', (
        entry.get("player_id"),
        entry.get("games_avg"),
        entry.get("targets_avg"),
        entry.get("rec_avg"),
        entry.get("yards_avg"),
        entry.get("tds_avg"),
        entry.get("yprr_avg"),
        entry.get("rtg_avg"),
        entry.get("recv_avg"),
        entry.get("tprr_avg"),
        entry.get("projected_route_part"),
        entry.get("fpts_per_route")
    ))

    conn.commit()
    cursor.close()
    conn.close()