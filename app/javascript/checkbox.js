function handleCheckboxClick(clickedCheckbox) {
  const checkboxes = document.querySelectorAll('input[type="checkbox"]');
  checkboxes.forEach((checkbox) => {
    if (checkbox !== clickedCheckbox) {
      checkbox.checked = false;
    }
  });

  if (clickedCheckbox.id === 'checkbox_1') {
    document.getElementById('tr1').style.display = 'block';
    document.getElementById('tr2').style.display = 'none';
  } else if (clickedCheckbox.id === 'checkbox_2') {
    document.getElementById('tr1').style.display = 'none';
    document.getElementById('tr2').style.display = 'block';
  };
};

window.addEventListener('load', function() {
  const checkboxes = document.querySelectorAll('input[type="checkbox"]');
  checkboxes.forEach((checkbox) => {
    checkbox.addEventListener('click', function() {
      handleCheckboxClick(this);
    });
  });
});