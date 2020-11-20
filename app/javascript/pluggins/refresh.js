const nb_meals = () => {
  let nr = document.querySelector('#time');
  if( nr ) {
    document.addEventListener("change", (e) => {
      nr.innerText = `Cooking Time: ${e.target.value === "" ? 0 : 10 + e.target.value * 30} min`;
    });
  }
}

const price = () => {
  let nr = document.querySelector('#price')
  if (nr) {
    document.addEventListener('change', (e) => {
      nr.innerText = `Total Price: ${cooker_price * e.target.value} €`
    })
  }
}

export { nb_meals, price };
