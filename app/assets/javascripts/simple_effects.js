
$(function() {
  // Hide completed tasks when checkbox is clicked. projects/show
  $('#hide-completed').click(function() {
    $('.task-completed').toggle();
  });
  // Change label to checkbox that hides completed tasks. project/show
  $('#hide-completed').change(function(){
    var c = this.checked ? ' Show completed tasks' : ' Hide completed tasks';
    $('#checkbox-label').text(c);
  });
  // toggle project form
  $('#new-project').click(function(){
    $('#create-project-form').slideToggle();
  });
  //toggle task form
  $('#new-task').click(function(){
    $('#create-task-form').slideToggle();
  });


  
  $('#date').datepicker({ 
    showAnim: "fadeIn",
    minDate: 0,
    dateFormat: "yy-mm-dd"
  });
});

