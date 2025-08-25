'use client';
import FilterBar from "../components/FilterBar";

export default function PositionalPage(){
    return (
        <>
            <div className="grid items-center justify-items-center mt-15">
                <main className="flex flex-col mt-55 items-center justify-items-center gap-[32px]">
                    <p>This is a tiered approach for drafting.</p>
                    <p>This has been a popular strategy in recent years are players are interested in being more flexible in their decision making throughout the draft.</p>
                    <p>Please select a tiering option below for all players, or by position.</p>
                </main> 
            </div>
            <SelectPosition />
        </>
    )
}

function SelectPosition(){
    return (
        <nav className='flex items-center justify-evenly bg-gray-900 px-10 py-10 m-10 text-white m-0 shadow rounded-xl'>
            <ul className="flex gap-6 text-lg">
                <li><a href='/positional/all' className="hover:text-gray-400">All Players</a></li>
                <li><a href="/positional/wr" className="hover:text-gray-400">Wide Receiver</a></li>
                <li><a href="/positional/rb" className="hover:text-gray-400">Running Backs</a></li>
                <li><a href="/positional/te" className="hover:text-gray-400">Tight Ends</a></li>
                <li><a href="/positional/qb" className="hover:text-gray-400">Quarterbacks</a></li>
            </ul>
        </nav>
    )
}