export default function Navbar(){
    return (
        <nav className='flex items-center justify-between bg-gray-900 px-6 py-4 text-white shadow'>
            <div className='text-2xl font-bold px-10'>Fantasy Football Rankings 2025</div>
            <ul className="flex gap-6 text-sm">
                <li><a href="#" className="hover:text-gray-400">Rankings</a></li>
                <li><a href="#" className="hover:text-gray-400">Players</a></li>
                <li><a href="#" className="hover:text-gray-400">About</a></li>
            </ul>
        </nav>
    )
}