(function ($, W, D)
{
    var JQUERY4U = {};

    JQUERY4U.UTIL =
            {
                setupFormValidation: function ()
                {
                    //form validation rules
                    $("#register-form").validate({
                        rules: {
                            firstname: "required",
                            lastname: "required",
                            email: {
                                required: true,
                                email: true
                            },
                            username: {
                                required: true,
                                minlength: 2
                            },
                            password: {
                                required: true,
                                minlength: 8
                            },
                            cpassword: {
                                required: true,
                                minlength: 8,
                                //equalTo :"#password"
                            },
                            agree: "required"
                        },
                        messages: {
                            firstname: "Please enter your firstname",
                            lastname: "Please enter your lastname",
                            username: {
                                required: "Please enter Username",
                                minlength: "Your Usernamed must be at least 2 characters long"
                            },
                            password: {
                                required: "Please provide a password",
                                minlength: "Your password must be at least 8 characters long"
                            },
                            cpassword: {
                                required: "Please provide a Confirm password",
                                minlength: "Your password must be at least 8 characters long",
                                //equalTo :"Please enter the same password as above"
                            },
                            email: "Please enter a valid email address",
                            agree: "Please accept our policy"
                        },
                        submitHandler: function (form) {
                            form.submit();
                        }
                    });
                }
            };
    
      

    //when the dom has loaded setup form validation rules
    $(D).ready(function ($) {
        JQUERY4U.UTIL.setupFormValidation();
        
        
        
        $(".uname").change(function(){
        	
	        var uname = $(this).val();
	        
	            $(".status").html("<img src='images/gif/loading.gif'><font color=gray> Checking availability...</font>");
	             $.ajax({
	                type: "POST",
	                url: "CheckUserNameAvailability",
	                data: "uname="+ uname,
	                success: function(msg){

	                    $(".status").ajaxComplete(function(event, request, settings){
	                         
	                        $(".status").html(msg);

	                    });
	                }
	            });
	        
	    });
        
        
    });

})(jQuery, window, document);



