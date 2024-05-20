<!DOCTYPE html>
<html>
    <head>
        <title>CHKH Library</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <style>
            @import url("https://fonts.googleapis.com/css2?famil=Mosteserrat");

            *{
                box-sizing: border-box;
            }

            h1{
                font-weight: bold;
                margin: 0;
            }

            p{
                font-size: 14px;
                font-weight: 100;
                line-height: 20px;
                letter-spacing: 0.5px;
                margin: 20px 0 30px;
            }

            span{
                font-size: 12px;
            }

            a{
                color: #333;
                font-size: 14px;
                text-decoration: none;
                margin: 15px 0;
            }

            body{
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-image: url(images/LibraryPal.png);
            }


            .login-button {
                background: #ff445c;
                color: #ff445c;
                border: 1px solid #ff4b2b;
                border-radius: 20px;
                font-size: 12px;
                font-weight: bold;
                padding: 12px 45px;
                letter-spacing: 1px;
                text-transform: uppercase;
                transition: transform 80ms ease-in;
            }

            .container{
                position: relative;
                width: 450px;
                max-width: 100%;
                min-height: 480px;
                background: #fff;
                border-radius: 10px;
                box-shadow: 
                    0 14px 28px rgba(0, 0, 0, 0.2),
                    0 10px 10px rgba(0, 0, 0, 0.2);
                overflow: hidden;
                font-family: "Montserrat", sans-serif;
            }

            .over-container{
                display: none;
            }

            .form-container{
                position: absolute;
                top: 0;
                height: 100%;
                transition: all 0.6s ease-in-out;
            }

            .sign-in-container{
                left: 0;
                width: 100%;
                z-index: 2;
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


            #userlogin{
                text-transform: uppercase;
                transition: all 200ms linear;
                font-weight: 600;
                padding-bottom: 10px;
                margin-top: 15px;
            }

            #userlogin :hover{
                color: #ff416c;

            }

            .logo img{
                height: 70px;
                width: 70px;
                margin-bottom: 15px;
            }

            body{
                font-family: sans-serif;
            }
        </style>
    </head>
    <body>
        <div class="body">
            <div class="container" id="container">
                <div class="form-container sign-in-container">

                    <form action="./login" name="" method="POST">
                        <div class="logo">
                            <img src="images/Logo.png" alt="">
                        </div>
                        <h1 style="text-transform: uppercase;">Admin login</h1>
                        <div id="userlogin">
                            <a href="userlogin.jsp">User Login</a>
                        </div>
                        <input name="adminname" type="text" placeholder="Your AdminName">
                        <input name="password" type="password" placeholder="Your Password">
                        <input value="Login" type="submit">
                        <% String error = (String) request.getAttribute("error"); %>
                        <% if (error != null) {%>
                        <h3 style="color: red"> <%= error%> </h3>
                        <% }%>
                    </form>

                </div>
            </div>
        </div>
    </body>
</html>
