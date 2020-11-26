import flatpickr from 'flatpickr';
const toggleDateInputs = function() {
  let inputDate = document.querySelector('.date-availability')

  if (inputDate) {
    const availableDates = JSON.parse(inputDate.dataset.available)
    flatpickr(".datepicker", {
    minDate: 'today',
    dateFormat: 'Y-m-d',
    enable: availableDates,
    })
  }
}
export { toggleDateInputs }