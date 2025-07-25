import Button from "./FilterButton";

type Player = {
    id: number
    name: string
    team: string
    position: string
    position_rank: number
    proj_points: number
}

function giveColor(position: string): string {
    switch(position) {
        case "WR":
            return "bg-blue-200";
        case "RB":
            return "bg-green-200";
        case "TE":
            return 'bg-red-200';
        case "QB":
            return 'bg-orange-200';
        case "K":
            return 'bg-yellow-200';
        default:
            return 'bg-white';
}
}

export default function PlayerCard({ player }: { player: Player }) {
    return (
        <div className={`group ${giveColor(player.position)} shadow rounded-xl p-4 flex flex-col items-center text-center hover:bg-gray-200 transition`}>
            <h2 className="text-4xl font-semibold mb-1 group-hover:text-black text-gray-600">{player.id}: {player.name}</h2>
            <p className="text-xl text-gray-900">{player.position} | {player.team}</p>  
            <p className="text-xl mt-2 text-red-500">Projected Points: {player.proj_points}</p>   
        </div>
    );
}