const nb_meals = () => {
  let nr = document.querySelector('#time');
  if( nr ) {
    let selectbox = document.querySelector('#booking_number_of_meals');
    selectbox.addEventListener("change", (e) => {
      nr.innerText = `Cooking Time: ${e.target.value === "" ? 0 : 10 + e.target.value * 30} min`;
    });
  }
}

const price = () => {
  let priceChange = document.querySelector('#price-meals');
  if ( priceChange ) {
    let nbOfMeals = document.querySelector('#time');
    nbOfMeals.addEventListener("change", (e) => {
      priceChange.innerText = `Total Price: ${cooker_price / 60 * 10 + e.target.value * 30} €`
    })
  }
}

export { nb_meals, price };
