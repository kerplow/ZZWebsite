function changedHandler(value) {
  console.log(value);

  var cleaning_table = document.querySelector('.cleaning-table');
  if ( value === 'drag' ) {
    console.log('draggable');
    cleaning_table.classList += ' draggable';
  } else if ( value === 'static' ) {
    console.log('not draggable');
    cleaning_table.classList.remove('draggable');
  };
};
