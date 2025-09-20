'use client';

export default function PositionalPage(){
    return (
        <>
            <div className="grid items-center justify-items-center mt-15">
                <main className="flex flex-col mt-55 items-center justify-items-center gap-[32px]">
                    <p>This is a tiered approach for drafting.</p>
                    <p>This has been a popular strategy in recent years are players are interested in being more flexible in their decision making throughout the draft.</p>
                    <p>Please select a tiering option below for all players, or by position.</p>
                    <SelectPosition />
                    <h1 className='text-xl font-bold'>Tier 1</h1>
                    <p>Players that are the cream of the crop. These players are the number 1 options on their team at their position and are the focal point of the offense.</p>
                    <p>These players possess game-breaking talent and are situation-proof.</p>
                    <h1 className='text-xl font-bold'>Tier 2</h1>
                    <p>Players that are either unordinarily talented or in great situations, but not necessarily both. These are players that will serve as top 12 options, but will be inconsitent or have a higher than average chance of injury.</p>
                    <p>If things break right, these are players that can rise to be in the upper echelon throughout the season.</p>
                    <h1 className='text-xl font-bold'>Tier 3</h1>
                    <p>Dependable players who will serve as solid weekly options. These are players that hold strong value, and they are often veterans or up-and-comers.</p>
                    <p>While they might not always produce as a top echelon option, they will be a cornerstone of your team.</p>
                    <h1 className='text-xl font-bold'>Tier 4</h1>
                    <p>Players in tier 4 are players with solid talent or situation, but with question marks surrounding their volume. These players might be coming off of down years.</p>
                    <p>While these players will be starters on their respective teams, their production and roles are in question as the season progresses.</p>
                    <h1 className='text-xl font-bold'>Tier 5</h1>
                    <p>These are either high upside players or boring veterans. These players can make or break your team.</p>
                    <p>Drafting the correct players in tier 5 can be the difference between having a weekly contributer or a desperate flex play.</p>
                    <h1 className='text-xl font-bold'>Tier 6</h1>
                    <p>Tier 6 players are often coming off of injuries, or are facing suspension. They are most likely not expected to be an every week starter for their team in real-life.</p>
                    <p>These are often unproven players with upside, older players trying to hold onto their role, or players who we won't have available to start for the full 17 games.</p>
                    <h1 className='text-xl font-bold'>Tier 7</h1>
                    <p>These are typically players who we've seen play and simply don't believe in. This consists of veterans who have no returned much value in their career or washed individuals.</p>
                    <p>These are players that we are hoping don't end up on our team or bench.</p>
                    <h1 className='text-xl font-bold'>Tier 8</h1>
                    <p>These are players who are simply not good, but maybe just have the right situation to be useful.</p>
                    <p>Again, pass on these players in favor of upside plays.</p>
                    <h1 className='text-xl font-bold'>Tier 9</h1>
                    <p>Unproven players that might be able to contribute due to injuries or leapfrogging an underperforming veteran. These won't provide standalone value in week 1, but are good shots to be successful this season.</p>
                    <p>These are good targets when looking at skill positions past pick 100.</p>
                </main> 
            </div>
        </>
    )
}

function SelectPosition(){
    return (
        <nav className='max-w-3xl mx-auto flex items-center justify-evenly bg-gray-900 px-10 py-10 m-50 text-white shadow rounded-xl'>
            <ul className="flex gap-6 text-lg">
                <li><a href='/positional/all' className="hover:text-gray-400 px-10">Go to Tiered Rankings</a></li>
            </ul>
        </nav>
    )
}