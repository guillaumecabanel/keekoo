const colors = require('tailwindcss/colors');

module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    fontFamily: {
      sans: ['Open Sans', 'sans-serif'],
    },
    extend: {
      colors: {
        gray: colors.blueGray,
      },
    },
  },
  variants: {
    extend: {
      backgroundColor: ['active', 'focus'],
      borderColor: ['focus'],
      opacity: ['disabled'],
    },
  },
  plugins: [],
}
