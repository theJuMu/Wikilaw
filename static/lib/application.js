
(function($){
    $countForms = 2;
    $.fn.addForms = function(){
        var myform =   
    "     <input type='text' name='surname"+$countForms+"' placeholder='Nom' >"+
    "     <input type='text' name='name"+$countForms+"' placeholder='Prénom' >"+
    "     <input type='text' name='adress"+$countForms+"' placeholder='Adresse' >"+
    "     <input type='text' name='date"+$countForms+"' placeholder='Date de naissance' >"+
    "     <input type='number' name='capital"+$countForms+"' placeholder='Capital apporté' >"+
    "     <button>supprimer</button>"+
    "     <p>&nbsp;</p>";


myform = $("<div>"+myform+"</div>");
$("button", $(myform)).click(function(){ $(this).parent().parent().remove(); });

$(this).append(myform);
$countForms++;
    };
})(jQuery);         

$(function(){
    $("#mybutton").bind("click", function(){
        $("#container").addForms();
    });
});

jQuery(function() {
      $("#collapse").collapse('show');
});

jQuery(function() {
      $(".remark").popover(
      {
      placement: 'top',
      html : true
      }
      );
});

$(document).ready(function(){
      $("#SignupForm").formToWizard({ submitButton: 'Save Account'} )
});
