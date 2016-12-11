
$( document ).on('turbolinks:load', function() {
   var name=$( "table tr:last-child td input" ).attr("name");
   var playerIndex=0;
   if(name){
        var num=name.match(/(\d)+/)[0];
        console.log("num="+num);
        var lastRowIndex=parseInt(num);
        if(playerIndex < lastRowIndex) {
            playerIndex=lastRowIndex;
        }
        console.log("playerIndex="+playerIndex);
        var idv=""
        $('.btn-default').click(function() {
         // alert( "Handler for .click() called." );
            $(this).parent().parent().remove();

        });

   }
     $( "#addplayer1" ).click(function() {
             //alert( "Handler for .click() called." );
             var deletebutton=' <button type="button" class="btn btn-default btn-sm">'+
                                                 '<span class="glyphicon glyphicon-remove"></span>'+
                                              '</button> ';
             var input1=deletebutton+'<td><input type=\"text\"  name=\"players['+(playerIndex+1)+'][name]\" id=\"players_'+(playerIndex+1)+'_name\"></td>';
             var input2='<td><input type=\"text\"  name="players['+(playerIndex+1)+'][rating]\" id=\"players_'+(playerIndex+1)+'_rating\"></td>';
             $('#playertable tr:last').after('<tr>'+input1+input2+'</tr>');
             playerIndex=playerIndex+1;
           });

})
