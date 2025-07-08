import Image from "next/image";
import Navbar from "@/componets/Navbar";

export default function Home() {
  return (

    <div className="grid grid-rows-[20px_1fr_20px] items-center justify-items-center min-h-screen p-8 pb-20 gap-16 sm:p-20 font-[family-name:var(--font-geist-sans)]">
      <Navbar />
      <main className="flex flex-col gap-[32px] row-start-2 items-center sm:items-start">
        <h1 className="text-5xl text-gray-900 dark:text-white mb-6 font-extrabold">
          2025 Fantasy Football Rankings
        </h1>
        <p className='text-lg text-gray-700 dark:text-gray-300 max-w-xl mb-8'>
          Tiered player rankings. Best analytics in the business. Half-point-PPR scoring. All in one place.
        </p>
        <a href="#rankings" className='text-xl text-white dark:text-gray-300'>
          Get Started
        </a>
      </main>
      <footer>  
      </footer>
    </div>
  );
}
