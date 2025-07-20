'use client';

import React, { useState } from 'react';
import Button from './FilterButton';

type FilterBarProps = {
    selectedPositions: string;
    setSelectedPositions: (position: string) => void;
}

export default function FilterBar({ selectedPositions, setSelectedPositions }: FilterBarProps) {
    return (
        <div className="text-2xl font-semibold mb-6 flex !space-x-5">
            <Button onClick={() => setSelectedPositions("WR")} className="hover:text-sky-600">WR</Button>
            <Button onClick={() => setSelectedPositions("RB")} className="hover:text-sky-600">RB</Button>
            <Button onClick={() => setSelectedPositions("QB")} className="hover:text-sky-600">QB</Button>
            <Button onClick={() => setSelectedPositions("TE")} className="hover:text-sky-600">TE</Button>
            <Button onClick={() => setSelectedPositions("K")} className="hover:text-sky-600">K</Button>
            <Button onClick={() => setSelectedPositions("DST")} className="hover:text-sky-600">DEF/ST</Button>
            <Button onClick={() => setSelectedPositions("All")} className="hover:text-sky-600">All</Button>
        </div>
    );
}