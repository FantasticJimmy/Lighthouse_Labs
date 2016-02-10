"use strict";
$(document).ready(function(){

  $('.btn-success').on('click',function(){


    var bankroll = Number($('#bankroll').val());
    if (bankroll <= 0){ $('#message').text("Your bacnkroll needs to be over 0");
      return
    }
    var bet = Number($('#bet').val());
    if (bet > bankroll) {
      $('#message').text("You cannot bet more than you got.");
      return
    }
    var gameNumber = Math.floor(Math.random() * 6);
    var playerNumber = Number($('#playerNumber').val());

    if (gameNumber==playerNumber){
      bankroll += bet;
      $('#message').text("You won! Number was "+gameNumber+". "+"Your balance: "+bankroll);
      $('#thing').fadeIn();
    }
    else if(Math.abs(gameNumber-playerNumber)===1){
      $('#message').text("You were close, number was "+gameNumber+". "+"Your balance: "+bankroll);
    }
    else{
      bankroll -= bet;
      $('#message').text("You lost! Number was "+gameNumber+". "+"Your balance: "+bankroll);
      $('#thing').fadeOut();
    }
    $('#bankroll').val(bankroll);
  });

  $('.btn-primary').on('click',function(){
    $('#bankroll').val(null);
    $('#bet').val(null);
    $('#playerNumber').val(null);
    $('#message').text("Resetted!");
  });

});
