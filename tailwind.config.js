/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/**/*.{js,ts,jsx,tsx,mdx}',      // Standard for Next.js App Router
    './pages/**/*.{js,ts,jsx,tsx,mdx}',    // If you use Pages Router
    './components/**/*.{js,ts,jsx,tsx,mdx}', // For shared components outside 'app' or 'pages'
    // Add any other specific paths where you use Tailwind classes, e.g., './src/**/*.{js,ts,jsx,tsx,mdx}'
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}