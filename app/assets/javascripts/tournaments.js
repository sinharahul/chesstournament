
$( document ).on('turbolinks:load', function() {
   var name=$( "table tr:last-child td input" ).attr("name");
   if(name){
        var num=name.match(/(\d)+/)[0];
        console.log("num="+num);
        var playerIndex=parseInt(num);
        console.log("playerIndex="+playerIndex);
        var idv=""
        $('.btn-default').click(function() {
         // alert( "Handler for .click() called." );
            $(this).parent().parent().remove();

        });
        $( "#addplayer1" ).click(function() {
          //alert( "Handler for .click() called." );
          var input1='<td><input type=\"text\"  name=\"players['+(playerIndex+1)+'][name]\" id=\"players_'+(playerIndex+1)+'_name\"></td>';
          var input2='<td><input type=\"text\"  name="players['+(playerIndex+1)+'][rating]\" id=\"players_'+(playerIndex+1)+'_rating\"></td>';
          $('#playertable tr:last').after('<tr>'+input1+input2+'</tr>');
          playerIndex=playerIndex+1;
        });

   }
})
