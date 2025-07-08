import pymysql

def get_connection():
    return pymysql.connect(
        host="localhost",
        user="root",
        password="-----",
        database="ff_25_v1",
        charset='utf8mb4'
    )

def insert_record(entry):
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute('''
        CREATE TABLE IF NOT EXISTS player (
            id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(45),
            team VARCHAR(3),
            position VARCHAR(2),
            bye INT,
            years_played INT
        )
    ''')

    cursor.execute('''
        INSERT INTO player (name, team, position, bye, years_played)
        VALUES (%s, %s, %s, %s, %s)
    ''', (
        entry.get("name"),
        entry.get("team"),
        entry.get("position"),
        entry.get("bye"),
        entry.get("years_played")
    ))

    conn.commit()
    cursor.close()
    conn.close()