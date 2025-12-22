"use client";
import { useEffect, useState } from 'react';
import RankingsClient from '../components/RankingsClient';

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

export default function RankingsPage() {

    const [ players, setPlayers ] = useState<Player[]>([]);
    const [ loading, setLoading ] = useState(true);
    const [ error, setError ] = useState<string | null>(null);

    useEffect(() => {
        const fetchPlayers = async () => {
            try {
                const response = await fetch("/api/players/")
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
    }, [])

    if (loading) {
        return <p>Loading in players...</p>
    }

    if (error) {
        return <p>Error: {error}</p>
    }

    return (
        <main className="p-8">
            <h1 className="text-4xl font-bold mb-6">2025 Fantasy Rankings</h1>
            <RankingsClient players={players}/>
        </main>
    );
}