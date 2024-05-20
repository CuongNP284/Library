<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CHKH Library</title>
        <style>
            .logo img{
                height: 70px;
                width: 70px;
                margin-bottom: 15px;
                margin-top: 20px;
            }


            .form-container form{
                height: 100%;
                /* width: 500px; */
                background: #fff;
                padding: 0 50px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                text-align: center;
            }


            .form-container input{
                width: 100%;
                background: #eee;
                border: none;
                padding: 12px 15px;
                margin: 8px 0;
            }
.container{
    position: relative;
    width: 600px;
    max-width: 100%;
    min-height: 480px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 
    0 14px 28px rgba(0, 0, 0, 0.2),
    0 10px 10px rgba(0, 0, 0, 0.2);
    overflow: hidden;
    font-family: "Montserrat", sans-serif;
    padding-bottom: 10px;
}

body{
    position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-image: url(images/LibraryPal.png);
}

a{
    text-decoration: none;
    color: black;
    text-transform: uppercase;
}

a:hover{
    color: #ff416c;
}

        </style>
    </head>
    <body>
<div class="body">
        <div class="container" id="container">

            <div class="form-container sign-in-container">
                <form action="./UserLoginController" method="POST">
                    <div class="logo">
                        <img src="images/Logo.png" alt="">
                    </div>
                    <table>
                        <tr><td></td><td><input name="id" value="${requestScope.user.id}" required="Please enter" type="hidden"</td></tr>
                        <tr><td>Your First Name</td><td><input type="text" name="userFName" value="${requestScope.user.userfname}" required="Please enter" placeholder="Cuong"</td></tr>
                        <tr><td>Your Last Name</td><td><input type="text" name="userLName" value="${requestScope.user.userlname}" required="Please enter" placeholder="Nguyen"</td></tr>		 
                        <tr><td>Your Email</td><td><input type="text" name="userEmail" value="${requestScope.user.useremail}" required="Please enter" placeholder="abc123@gmail.com"</td></tr>		 
                        <tr><td>Your Contact</td><td><input type="text" name="userContact" value="${requestScope.user.usercontact}" required="Please enter" placeholder="10 numbers(0898xxxxxx)"</td></tr>		 
                        <tr><td>Your Username</td><td><input type="text" name="userName" value="${requestScope.user.username}" required="Please enter" placeholder="cuong"</td></tr>	
                        <tr><td>Your Password</td><td><input type="password" name="userPassword" value="${requestScope.user.userpassword}" required="Please enter" placeholder="abcxyz"</td></tr>	
                                <a href="userlogin.jsp">Login User Page</a>

                                <tr><td colspan="2">
                                <input name="action" value="${requestScope.nextaction}" type="hidden">
                                <input type="submit" value="Save">
                            </td></tr>
                    </table>


                </form>

            </div>
        </div>
</div>
    </body>
</html>
