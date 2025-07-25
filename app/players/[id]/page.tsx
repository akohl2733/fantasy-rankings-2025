'use client';
import { useEffect, useState } from "react";

type Player = {
    id: number
    name: string
    team: string
    position: string
    position_rank: number
    proj_points: number
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
                    <p>Projected Points: {player.proj_points}</p>
                    <p>Team: {player.team}</p>
                    <p>Position: {player.position}</p>
                </div>
            </div>
            : <h1>"No player available"</h1>}
        </main>
    )
}