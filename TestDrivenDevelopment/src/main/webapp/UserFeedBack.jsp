<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</head>

<body>
Feedback Title : <input type="text" id ="title"></br>
Feedback Category : <select id ="categaroy"><option value="">Select ..</option><option value="issue">Issue</option><option value="Feedback">Feedback</option></select></br>
Feedback moduleName : <div id="selectVal"></div></br>
Feedback Description  : <input type="text" id ="comments"></br>
<button onClick="updateFeedback()" name ="Submit">Submit</button>
</body>
<script>
 function updateFeedback(){
	 
/* 	 if($("#feedBackTitle").val() == ""){
		 alert("Please enter the title");
		 return false ;
	 }else 	 if($("#feedBackTitle").val() == ""){
		 alert("Please select the category");
		 return false ;
	 }else 	 if($("#feedBackTitle").val() == ""){
		 alert("Please enter the Description");
		 return false ;
	 }	 */ 
	
	 var data={"title":$("#title").val(),"categaroy":$("#categaroy").val(),"moduleName":$("#moduleName").val(),"comments":$("#comments").val()};
	 
	 $.ajax({url: "index.jsp?jsonStr="+JSON.stringify(data), success: function(result){
         alert(result);
     }});
} 
 $.ajax({url: "index.jsp?jsonStr="+JSON.stringify(data)+"&type=module", success: function(result){
     //alert(result);
     $("#selectVal").html("<select id ='moduleName'>"+result+"</select>");
	 
 }});
</script>
</html>
