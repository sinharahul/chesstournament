function addEvent(e1,event,callback){
   if('addEventListener' in e1){
      e1.addEventListener(event,callback,false);
   }
}
function addForm() {
  var form=document.getElementById('new_tournament');
  if(form==null||form==undefined){
   return;
   }
  addEvent(form,'submit',function(e) { //When user submits form
        var valid=true;
               //Stop it being sent
        var elements=this.elements;    //Get all form elements
        var tournamentname=elements[2];
        var rounds=elements[3];
        var msg='';
        if(tournamentname.value=='' ){
           valid=false;
           msg= "Tournament name undefined\n";
          }
         if( rounds.value==undefined || (rounds.value <=0 || rounds.value >=5 ) ){
                   valid=false;
                   msg += "Tournament rounds valid should be between 1 and 5\n";
                  }
        if(!valid){
           document.getElementById('message').textContent=msg;
           e.preventDefault();
          }
    });
}
//Rails 5 document on load technique
$(document).on('turbolinks:load', addForm);