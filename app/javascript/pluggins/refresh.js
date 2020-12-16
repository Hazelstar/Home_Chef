// const nb_meals = () => {
//   let nr = document.querySelector('#time');
//   if( nr ) {
//     let selectbox = document.querySelector('#booking_number_of_meals');
//     selectbox.addEventListener("change", (e) => {
//       nr.innerText = `Cooking Time: ${e.target.value === "" ? 0 : 10 + e.target.value * 20} min`;
//     });
//   }
// }

// const price = () => {
//   let nr = document.querySelector('#price-meals');
//   if ( nr ) {
//     let selectbox = document.querySelector('#booking_number_of_meals');
//     selectbox.addEventListener("change", (e) => {
//       nr.innerText = `Total Price: ${cooker_price / 60 * 10 + e.target.value * 20} €`;
//     })
//   }
// }

// export { nb_meals, price };

let dynamicBooking = () => {
  let selectbox = document.querySelector('#booking_number_of_meals')

  if (selectbox) {
    const mealsTime = document.querySelector('#time');
    const mealsPrice = document.querySelector('#price-meals');

    selectbox.addEventListener("change", (event) => {
      const cookingTime = event.target.value === "" ? 0 : 10 + 20 * event.target.value;
      mealsTime.innerText = `Cooking Time: ${Math.floor(cookingTime / 60)}h${cookingTime % 60}`;
      const cookingPrice = Math.round((window.cooker_price / 60 * cookingTime) * 100) / 100;
      mealsPrice.innerText = `Total Price: ${cookingPrice}€`;
    });
  };
}


export { dynamicBooking };
