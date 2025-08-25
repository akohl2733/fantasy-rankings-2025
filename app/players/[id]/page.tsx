'use client';
import PlayerCard from "@/app/components/PlayerCard";
import { use, useEffect, useState } from "react";

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
    tier: number
}

interface IndividualPlayerProps {
  params: {
    id: string; // Next.js passes dynamic segments as strings
  };
}

export default function IndividualPlayer({ params }: IndividualPlayerProps) {

    const id = parseInt(params.id, 10);

    const [ player, setPlayer ] = useState<Player | null>(null);
    const [ loading, setLoading ] = useState(true);
    const [ error, setError ] = useState<string | null>(null);

    useEffect(() => {
        const fetchPlayers = async () => {
            try {
                const url = `http://localhost:8000/players/${id}`;
                console.log("Getting from url:", url)
                const response = await fetch(url);
                if (!response.ok) {
                    throw new Error(`HTTP error ${response.status}`);
                }
                const data = await response.json();
                setPlayer(data);
            } catch (err: any){
                console.error("There was an Error:", err);
                setError(err.message || "Failed to fetch player");
            } finally {
                setLoading(false);
            }
        };
        fetchPlayers();
    }, [id])

    if (loading) {
        return <p>Loading in player...</p>
    }

    if (error) {
        return <p>There was an error</p>
    }

    return (
        <main>
            {player !== null 
            ? <div className="grid grid-rows-[20px_1fr_20px] items-center justify-items-center min-h-screen pb-20 gap-1 sm:p-20 font-[family-name:var(--font-geist-sans)]">
                <h1 className="text-3xl font-bold">{player.name}</h1>
                <div className="text-xl font-bold justify-items-center">
                    <p>Position: {player.position}</p>
                    <p>Team: {player.team}</p>
                    <br />
                    <p><span>Overall Rank: {player.id}</span>&emsp;<span>|</span>&emsp;<span>{player.position} Ranking: {player.position_rank}</span>&emsp;<span>|</span>&emsp;<span>{player.position} Tier: {player.tier}</span></p>
                    <br />
                    <p>Projected Points: {player.proj_points}</p>
                    <br />
                    <DeterminePosition player={player} />
                    
                </div>
            </div>
            : <h1>"No player available"</h1>}
        </main>
    )
}


function DeterminePosition({player}: {player: Player}){
    const possible_positions = ["WR", "TE", "RB", "DST", "QB", "K"];

    if (!possible_positions.includes(player.position)){
        return "This is not a valid player position";
    }
    
    switch (player.position) {
        case "RB":
            return (
                <div>
                    <p>Projected Rushing Yards: {player.rushing_yards}</p>
                    <p>Projected Rushing Touchdowns: {player.rushing_tds}</p>
                    <br />
                    <p>Projected Receptions: {player.receptions}</p>
                    <p>Projected Receiving Yards: {player.receiving_yards}</p>
                    <p>Projected Receiving Touchdowns: {player.receiving_tds}</p>
                </div>
            )

        case "QB":
            return (
                <div>
                    <p>Projected Passing Yards: {player.passing_yards}</p>
                    <p>Projected Passing Touchdowns: {player.passing_tds}</p>
                    <br />
                    <p>Projected Rushing Yards: {player.rushing_yards}</p>
                    <p>Projected Rushing Touchdowns: {player.rushing_tds}</p>
                </div>
            )
        default:
            return (
                <div>
                    <p>Projected Receptions: {player.receptions}</p>
                    <p>Projected Yards: {player.receiving_yards}</p>
                    <p>Projected Touchdowns: {player.receiving_tds}</p>
                </div>
            )
    }
}