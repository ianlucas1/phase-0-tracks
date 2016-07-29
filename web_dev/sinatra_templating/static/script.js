// Fun with jQuery...unfortunately, these effects don't
// persist if the screen is refreshed

$(document).ready(function(){
  
  // Make list item expand when mouse is over it
  $(document).on('mouseenter', '.todolist li', function() {
    $(this).animate({height: '+=10px',});
  });

  // Make list item that has been expanded shrink when mouse leaves it
  $(document).on('mouseleave', '.todolist li', function() {
    $(this).animate({height: '-=10px',});
  });

  // Make list re-arrangeable
  $('ol').sortable();

  // Click once on a task to strike it out
  $(document).on('click', '.todolist li', function() {
    $(this).css('text-decoration', 'line-through'); 
  });

  // Click twice on a task to make it disappear dramatically
  $('li').dblclick(function() {
    $(this).effect('explode');
  });

  // $(document).on('click', '.todolist li', function() {
  //      $(this).css('font-weight', 'bold'); 
  //   });

  // $(document).on('dblclick', '.todolist li', function() {
  //    $(this).css('font-weight', 'normal'); 
  // });

});
