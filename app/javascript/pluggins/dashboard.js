const showInfo = () => {
  const buttons = document.querySelectorAll('.btn-profile')
  const displays = document.querySelectorAll('.content-display')
  const column = document.getElementById('content-column')
   // console.log(column);

  buttons.forEach((btn) => {
    btn.addEventListener('click', (event) => {
      // $(column).replaceWith(content);
      // console.log(column);
      displays.forEach((section) => $(section).hide());
      var display = btn.getAttribute('id');
      var content = document.getElementsByClassName(display);
      $(content).show();

      buttons.forEach((button) => {
        $(button).removeClass('active-toto')
      });

      $(btn).addClass('active-toto');
    });
  })
}


export { showInfo };
