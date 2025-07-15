'use client';

import React, { useState } from "react";
import PlayerCard from "./PlayerCard";
import FilterBar from "./FilterBar";

type Player = {
    name: string;
    position: string;
    team: string,
    bye: number;
    rank: number;
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
                    <PlayerCard key={index} player={player} />
                ))}
            </div>
        </div>
    )
}