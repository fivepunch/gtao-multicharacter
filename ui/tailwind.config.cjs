/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {
      fontFamily: {
        inter: ["Inter", "sans-serif"],
      },
      backgroundImage: {
        select: "url('../select.jpg')",
        create: "url('../create.jpg')",
      },
    },
  },
  plugins: [],
};
