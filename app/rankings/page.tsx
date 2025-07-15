import { promises as fs } from 'fs';
import path from 'path';
import PlayerCard from '@/app/components/PlayerCard';
import RankingsClient from '../components/RankingsClient';

type Player = {
    name: string;
    position: string;
    team: string;
    bye: number;
    rank: number;
}

export default async function RankingsPage() {
    const filePath = path.join(process.cwd(), 'backend', 'all_players', 'cleaned_rankings.json');
    const jsonData = await fs.readFile(filePath, 'utf-8');
    const players: Player[] = JSON.parse(jsonData);

    return (
        <main className="p-8">
            <h1 className="text-4xl font-bold mb-6">2025 Fantasy Rankings</h1>
            <RankingsClient players={players}/>
        </main>
    );
}