var checkbox = document.querySelector('input[type="checkbox"]');
var priceInput = document.querySelector('input[type="integer"]');
var price_div = document.getElementById('price');

function toggleRequired() {
  checkbox.onchange = function() {
     if(this.checked) {
       price_div.style['display'] = 'block';
       priceInput.setAttribute('required','required');
     } else {
       price_div.style['display'] = 'none';
       priceInput.removeAttribute('required');
     }
  };
}

checkbox.addEventListener('change',toggleRequired,false);


export toggleRequired;

