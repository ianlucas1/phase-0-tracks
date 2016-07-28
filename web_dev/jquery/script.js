$(document).ready(function() {


  // SETTING SOME VARIABLES FOR RE-USE  
  $pig = $('#flying-pig')
  $mario = $('#mario')


  // FLYING THE PIG WITH THE MOUSEPAD
  $pig.draggable();

  $pig.mouseenter(function() {
       $(this).animate({
           height: '+=10px',
       });
   });

    $pig.mouseleave(function() {
       $(this).animate({
           height: '-=10px'
       }); 
   });


  // MOVING MARIO AROUND BY PRESSING KEYS
  $(document).keydown(function(key) {

    switch(parseInt(key.which,10)) {
    
      case 37: // left arrow moves left
        $mario.animate({left: "-=20px"}, 5);
      break;
      
      case 38: // up arrow moves up
        $mario.animate({top: "-=20px"}, 5);
      break;
      
      case 39: // right arrow moves right
        $mario.animate({left: "+=20px"}, 5);
      break;
      
      case 40: // down arrow moves down
        $mario.animate({top: "+=20px"}, 5);
      break;
      
      case 70: // 'f' key moves further away 
        $mario.animate({height: '-=25px'}, 5);
      break;

      case 67: // 'c' key moves closer 
        $mario.animate({height: '+=25px'}, 5);
      break;

      case 74: // 'j' key jumps to the right
        $mario.animate({top: "-=75px"}, 20);
        $mario.animate({left: "+=150px"}, 20);
        $mario.animate({top: "+=75px"}, 20);
      break;
    }
  });


  // EXPLODING THE SPRITES TO REMOVE THEM
  $('img').dblclick(function() {
      $(this).effect('explode');
  });

});









