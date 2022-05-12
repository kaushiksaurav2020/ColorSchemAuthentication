 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(document).ready(function() {                       
            $('#btnotp').click(function() { 
 
                $.get('getServeletOtp', function(responseText) { 
                    $('#somediv').text(responseText);        
                });
            });
        });


        $("#btnotp").click(function(){

                 
         $.ajax({
 
            url:'getServeletOtp',
           // data: {username: otp, otp: otp},
            
            type:'get',
            cache:false,
            success:function(data){
               alert(data);
               $('#somediv').text(responseText); 
            },
            error:function(){
              alert('error');
            }
         }
    );
}
);
    </script>
    </head>
    <body>
        <form action="">
   <input type="hidden" id="username" name="username" value="rajesh"/>
    <input type="hidden" id="otp" name="otp" value="123456"/> 
 

    <p> <input type="button" value="Get OTP" id="btnotp"/></p>
    <div id="somediv"> </div>
 </form>
    </body>
</html>
