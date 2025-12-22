'use client';
import { useEffect, useState } from "react";
import RankingsClient from "@/app/components/RankingsClient";

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

type TieredPlayers = {
    [key: number]: Player[];
}

export default function TieredRanks() {

    const [ players, setPlayers ] = useState<Player[]>([]);
    const [ error, setError ] = useState<String | null >(null);
    const [ loading, setLoading ] = useState(true);

    useEffect(() => {
        const fetchPlayers = async () => {
            try {
                const response = await fetch("/api/players");
                if (!response.ok){
                    throw new Error(`HTTP error ${response.status}`);
                }
                const data: Player[] = await response.json();
                setPlayers(data);
            } catch (err: any){
                console.error("There was an error", err);
                setError(err.message || "Failed to fetch player");
            } finally {
                setLoading(false);
            }
        };
        fetchPlayers();
    }, []);

    if (loading) {
        return <p>Loading in players...</p>
    }
    
    if (error) {
        return <p>Error: {error}</p>
    }

    const tieredPlayers: TieredPlayers = players.reduce((acc, player) => {
        const { tier } = player;
        if (!acc[tier]) {
            acc[tier] = [];
        }
        acc[tier].push(player);
        return acc;
    }, {} as TieredPlayers);
    
    return (
        <main className="p-8">
            <h1 className="text-4xl font-bold mb-6">2025 Fantasy Rankings</h1>
            {Object.keys(tieredPlayers).sort((a, b) => Number(a) - Number(b)).map(tier => (
                <div key={tier} className="mb-8">
                    <h2 className="text-2xl font-semibold mb-4">Tier {tier} Players</h2>
                    <RankingsClient players={tieredPlayers[Number(tier)]} />
                </div>
            ))}
        </main>
    );
}