export default function Navbar(){
    return (
        <nav className='flex items-center justify-evenly bg-gray-900 px-10 py-10 m-10 text-white m-0 shadow rounded-xl'>
            <div className='text-3xl font-bold px-10'>Fantasy Football Rankings 2025</div>
            <ul className="flex gap-6 text-lg">
                <li><a href="/rankings" className="hover:text-gray-400">Rankings</a></li>
                <li><a href="/players" className="hover:text-gray-400">Players</a></li>
                <li><a href="#" className="hover:text-gray-400">About</a></li>
            </ul>
        </nav>
    )
}