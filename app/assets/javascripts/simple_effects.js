
$(function() {
  // Hide completed tasks when checkbox is clicked. projects/show
  $('#checkbox-hide').click(function() {
    $('.task-completed').toggle();
  });
  // Change label to checkbox that hides completed tasks. project/show
  $('#checkbox-hide').change(function(){
    var c = this.checked ? ' Show completed tasks' : ' Hide completed tasks';
    $('#checkbox-label').text(c);
  });
  // toggle project form
  $('#new-project').click(function(){
    $('#create-project-form').slideToggle();
  });
  // Info for the date picker
  $('#date').datepicker({ 
    showAnim: "fadeIn",
    minDate: 0,
    dateFormat: "yy-mm-dd"
  });
});

