import flatpickr from 'flatpickr';
const toggleDateInputs = function() {
    const availableDates = JSON.parse(document.querySelector('.date-availability').dataset.available)
    flatpickr(".datepicker", {
    minDate: 'today',
    dateFormat: 'Y-m-d',
    enable: availableDates,
  })
}
export { toggleDateInputs }