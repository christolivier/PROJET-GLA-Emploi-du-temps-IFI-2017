
$( document ).ready(function() {
 $("#tx2").attr("readonly",true);
 $("#tx3").attr("readonly",true);
  $("#tx4").attr("readonly",true);
  $("#tx5").attr("readonly",true);
  $("#tx6").attr("readonly",true);
  $("#file").hide();
 
$('#ch2').click(function() {
    var $this = $(this);
    // $this will contain a reference to the checkbox   
    if ($this.is(':checked')) {
       $("#tx2").attr("readonly",false);
      
	 
    } else {
        $("#tx2").attr("readonly",true);
       
    }
});

$('#ch3').click(function() {
    var $this = $(this);
    // $this will contain a reference to the checkbox   
    if ($this.is(':checked')) {
       $("#tx3").attr("readonly",false);
	 
    } else {
        $("#tx3").attr("readonly",true);
		 
    }
});

$('#ch4').click(function() {
    var $this = $(this);
    // $this will contain a reference to the checkbox   
    if ($this.is(':checked')) {
       $("#tx4").attr("readonly",false);
	 
    } else {
        $("#tx4").attr("readonly",true);
		 
    }
});


$('#ch4').click(function() {
    var $this = $(this);
    // $this will contain a reference to the checkbox   
    if ($this.is(':checked')) {
       $("#tx4").attr("readonly",false);
	 
    } else {
        $("#tx4").attr("readonly",true);
		 
    }
});

$('#ch5').click(function() {
    var $this = $(this);
    // $this will contain a reference to the checkbox   
    if ($this.is(':checked')) {
       $("#tx5").attr("readonly",false);
	 
    } else {
        $("#tx5").attr("readonly",true);
		 
    }
});

$('#ch6').click(function() {
    var $this = $(this);
    // $this will contain a reference to the checkbox   
    if ($this.is(':checked')) {
       $("#tx6").attr("readonly",false);
	 
    } else {
        $("#tx6").attr("readonly",true);
		 
    }
});

});