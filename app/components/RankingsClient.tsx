'use client';

import React, { useState } from "react";
import PlayerCard from "./PlayerCard";
import FilterBar from "./FilterBar";

type Player = {
    id: number
    name: string
    team: string
    position: string
    position_rank: number
    proj_points: number
}

type RankingsClientProps = {
    players: Player[];
}

export default function RankingsClient({players}: RankingsClientProps) {
    const [ filter, setFilter ] = useState<string>('All');

    const filteredPlayers = filter === "All" 
        ? players
        : players.filter((player) => player.position === filter);

    return (
        <div>
            <FilterBar selectedPositions={filter} setSelectedPositions={setFilter}/>
            <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 mt-6">
                {filteredPlayers.map((player, index) => (
                    <a href={`/players/${player.id}`} key={player.id}>
                        <PlayerCard  player={player} />
                    </a>
                ))}
            </div>
        </div>
    )
}