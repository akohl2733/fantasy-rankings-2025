'use client';
import React, { useState, useRef, useEffect } from "react";
import { useRouter } from "next/navigation";

type Player = {
    id: number
    name: string
    team: string
    position: string
    position_rank: number
    receptions: number
    receiving_yards: number
    receiving_tds: number
    rushing_yards: number
    rushing_tds: number
    passing_yards: number
    passing_tds: number
    turnovers: number
    proj_points: number
    tier: number
}

interface SearchBarProps {
    options: Player[];
    placeholder?: string;
    onSelect?: (selectedOption: string) => void;
}

const SearchBar: React.FC<SearchBarProps> = ({options, placeholder="Start typing....", onSelect}) => {
    const [ inputValue, setInputValue ] = useState<string>('');
    const [ filteredOptions, setFilteredOptions ] = useState<Player[]>([]);
    const [ selectedOptions, setSelectedOptions ] = useState<boolean>(false);
    const inputRef = useRef<HTMLInputElement>(null);
    const router = useRouter();


    useEffect(() => {
        if (inputValue.length > 0) {
            const filtered = options.filter(option => 
                option.name.toLowerCase().includes(inputValue.toLowerCase())
            )
            setFilteredOptions(filtered);
            setSelectedOptions(true);
        } else {
            setFilteredOptions([]);
            setSelectedOptions(false);
        }
    }, [inputValue, options])

    const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        setInputValue(event.target.value);
    }

    const handleSelectedOption = (option: Player) => {
        setInputValue(option.name);
        setSelectedOptions(true);
        if (onSelect) {
            onSelect(option.id.toString());
        }
        router.push(`/players/${option.id}`);
    }

    const handleBlur = () => {
        setTimeout(() => {
        setSelectedOptions(false);
        }, 100);
    };

    const handleFocus = () => {
        if (inputValue.length > 0) {
        setSelectedOptions(true);
        }
    };

    return (
    <div className="relative w-full max-w-md mx-auto p-4 text-black">
      <h2 className="text-2xl text-white font-bold text-center mb-4 text-gray-800">Search for a Player</h2>
      <input
        ref={inputRef}
        type="text"
        value={inputValue}
        onChange={handleChange}
        onFocus={handleFocus}
        onBlur={handleBlur}
        placeholder={placeholder}
        className="w-full px-4 py-2 border border-gray-300 bg-white rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent text-lg"
        aria-label="Search input"
      />

      {/* Conditional rendering for the options list */}
      {selectedOptions && filteredOptions.length > 0 && (
        <ul className="absolute z-10 w-full bg-white border border-gray-300 rounded-lg shadow-lg mt-1 max-h-60 overflow-y-auto">
          {filteredOptions.map((option, index) => (
            <li
              key={index}
              className="px-4 py-2 cursor-pointer hover:bg-blue-100 text-gray-800 text-lg"
              onClick={() => handleSelectedOption(option)}
            >
              {option.name}
            </li>
          ))}
        </ul>
      )}

      {/* This "button" is conceptual, the input itself triggers the options
      <button
        type="button"
        onClick={() => inputRef.current?.focus()} // Focus the input when this button is clicked
        className="mt-4 w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-lg shadow-md transition duration-300 ease-in-out transform hover:scale-105 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-75"
      >
        Show Player Options
      </button> */}
    </div>
  );
}

export default SearchBar;