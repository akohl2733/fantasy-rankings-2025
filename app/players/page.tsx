'use client';
import SearchBar from "../components/SearchBar";
import { useEffect, useState } from "react";

type Player = {
    id: number
    name: string
    team: string
    position: string
    position_rank: number
    receptions: number
    receiving_yards: number
    receiving_tds: number
    rushing_yards: number
    rushing_tds: number
    passing_yards: number
    passing_tds: number
    turnovers: number
    proj_points: number
}


export default function PlayersPage(){

    const [ error, setError ] = useState<string>('');
    const [ loading, setLoading ] = useState<boolean>(true);
    const [ players, setPlayers ] = useState<Player[]>([]);

    const players_list: Player[] = [];

    useEffect(() => {
        const playerNames = async () => {
            try {
                const url = `http://localhost:8000/players/`;
                const response = await fetch(url);
                if (!response.ok){
                    throw new Error(`HTTP error ${response.status}`);
                }
                const data = await response.json();
                for (let d of data){
                    players_list.push(d);
                }
                setPlayers(players_list);
                console.log(players);
            } catch (err) {
                console.error("There was an error", err);
                setError("There was an error.");
            } finally {
                setLoading(false);
            }
        };
        playerNames();
    })

    if (loading) {
        <p>Loading in players....</p>
    }

    if (error) {
        <p>{error}</p>
    }

    return (

        <div className="grid grid-rows-[20px_1fr_20px] items-center justify-items-center min-h-screen pb-20 gap-1 sm:p-20 font-[family-name:var(--font-geist-sans)]">
            <h1 className="text-3xl font-bold">Placeholder</h1>
            <div className="text-xl font-bold justify-items-center">
                <h1>Inserting SearchBar Here</h1>
                <SearchBar options={players} placeholder="Please type a player's name..."/>
            </div>
        </div>
    )
}