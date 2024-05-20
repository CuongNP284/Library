<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CHKH Library</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                text-align: center;
            }
            h1 {
                color: #333;
                margin-top: 50px;
            }
            form {
                margin-top: 20px;
            }
            input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                font-size: 16px;
                border-radius: 5px;
            }
            input[type="submit"]:hover {
                background-color: #0056b3;
            }
            a {
                color: #007bff;
                text-decoration: none;
                margin-top: 20px;
                display: block;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <h1>Hello My Friend, This is the page before you create a new account</h1>
        <form action="UserLoginController" method="POST">
            <input name="action" value="create" type="hidden">
            <input type="submit" value="Create An Account"> 
        </form>
        <a href="userlogin.jsp">Return to User Login Page</a>
    </body>
</html>