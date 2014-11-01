
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
  
});

