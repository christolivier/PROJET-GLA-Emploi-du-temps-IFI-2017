 $("#login-button").click(function(event){
		 event.preventDefault();
	 
	 $('form').fadeOut(500);
	 $('.wrapper').addClass('form-success');
       
         
});


function rederect() {
  window.location="admin.jsp";
}