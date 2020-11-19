// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


//
 // Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// import "@fortawesome/fontawesome-free/js/all";

import "controllers"

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { toggleRequired } from 'pluggins/checkbox';


// const nb_meals = () => {
//   let nr = document.querySelector('#time');
//   if(nr) {
//     let selecteBox = document.querySelector('#booking_number_of_meals');
//     document.addEventListener('change', (e) => {
//       nr.innerText = `Cooking Time: ${e.target.value === "" ? 0 : 10 + e.target.value * 30} min`;
//     })
//   }
// }
const nb_meals = () => {
  let nr = document.querySelector('#time');
  if(nr) {
    document.addEventListener("change", (e) => {
      nr.innerText = `Cooking Time: ${e.target.value === "" ? 0 : 10 + e.target.value * 30} min`;
    });
  }
}

const price = () => {
  let nr = document.querySelector('#price');
  if(nr) {
    document.addEventListener('change', (e) => {
      nr.innerText = `Total Price: ${cooker_price * e.target.value} €`
    })
  }
}

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  nb_meals();
  price();
  toggleRequired();
});


