<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CHKH Library</title>
    </head>
    <body>

        <style>
            #searchbox{
                margin-top: 5px;
            }
            body{
                font-size: 16px;
                font-family: Arial, Helvetica, sans-serif;
            }
            table{
                margin-top: 10px
            }
            table, tr, td{
                border-collapse: collapse;
                width: 400px;
                border: 2px solid black;
                text-align: center;
            }
            tr,td{
                padding: 6px 10px;
            }
            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }


            .header_logo img {
                width: 200px;
                height: 150px;
            }

            .header_search{
                margin-right: 0px;
            }   


            .footer {
                text-align: center;
                background-color: black;
                color: white;
            }

            .footer-content {
                padding: 10px 0;
            }


            .checked {
                color: orange;
            }

            .sidenav {
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: black;
                overflow-x: hidden;
                transition: 0.5s;
                padding-top: 60px;
                -webkit-box-orient: 0px 0px 5px 2px rgba(0, 0, 0, 0.75);
                -moz-box-shadow: 0px 0px 5px 2px rgba(0, 0, 0, 0.75);
                box-shadow: 0px 0px 5px 2px rgba(0, 0, 0, 0.75);
            }



            .sidenav a {
                padding: 8px 8px 8px 32px;
                text-decoration: none;
                font-size: 25px;
                color: #818181;
                display: block;
                transition: 0.3s;
                color: white;
            }

            #closebtn{
                padding: 8px 32px 8px 32px;

            }

            .sidenav a:hover {
                color: black;
                font-weight: bold;
                background-color: white;
            }

            .sidenav .closebtn {
                position: absolute;
                top: 0;
                right: 0;
                font-size: 36px;
                margin-left: 50px;
            }

            @media screen and (max-height: 450px) {
                .sidenav {
                    padding-top: 15px;
                }

                .sidenav a {
                    font-size: 18px;
                }
            }

            body{
                font-family: sans-serif;
            }

            .detail {
                display: flex;
                justify-content: center; /* Horizontally center the content */
                align-items: center; /* Vertically center the content */
                margin: 20px 0px 
            }

            #box{
                margin-left: 60px;
            }

            a{
                text-decoration: none;
                color: black;
            }

            input[type="submit"]{
                background: #ff445c;
                color: #fff;
                border: 1px solid #ff4b2b;
                border-radius: 5px;
                font-size: 8px;
                font-weight: bold;
                padding: 12px 12px;
                letter-spacing: 1px;
                text-transform: uppercase;
                transition: background-color 0.3s
            }

            .cainut{
                display: flex;
                justify-content: center; /* Horizontally center the content */
                align-items: center;
                margin-bottom: 12px;
            }

            .cainut2{
                display: flex;
                justify-content: center; /* Horizontally center the content */
                align-items: center;
                margin-bottom: 12px;
            }

            button{
                background: #ff445c;
                color: #fff;
                border: 1px solid #ff4b2b;
                border-radius: 5px;
                font-size: 8px;
                font-weight: bold;
                padding: 12px 12px;
                letter-spacing: 1px;
                text-transform: uppercase;
                transition: background-color 0.3s
            }
            .info{
                display: flex;
                justify-content: center; /* Horizontally center the content */
                align-items: center; /* Vertically center the content */
                margin: 20px 0px;
                text-transform: uppercase;
                color: #ff445c
            }

            .banner img {
                width: 100%;
                height: 300px;
            }
            .account-icon {
                position: relative;
            }

            .popup {
                display: none;
                position: absolute;
                top: calc(100% + 5px); /* Position the pop-up below the icon */
                left: -400%;     /* keep the box below the icon */
                background-color: #fff;
                border: 1px solid #ccc;
                padding: 20px;
                z-index: 1000;
            }

            .popup-content {
                max-width: 300px; /* Adjust as needed */
            }

            .close {
                position: absolute;
                top: 5px;
                right: 10px;
                cursor: pointer;
            }
        </style>

        <div class="header">
            <div class="header_menu">
                <div id="mySidenav" class="sidenav">
                    <a href="javascript:void(0)" id="closebtn" class="closebtn" onclick="closeNav()">&times;</a>
                    <a href="BookController">Books</a>
                    <a href="DonateController">Donate</a>  
                    <a href="BookController?action=showadmincart">View User Cart</a>      
                    <a href="UserController">User Management</a>
                    <a href='login?action=logout'>Logout</a>

                </div>

                <span style="font-size:30px;cursor:pointer;" onclick="openNav()">&#9776; Menu</span>
            </div>

            <div class="header_logo">
                <a href="BookController"><img src="images/logo2_1.png"></a>
            </div>


            <div class="header_search">
                <div class="account-icon" onclick="toggleAccountPopup()">
                    <img src="images/profile user person account.svg" alt="Account Icon">
                    <div id="account-popup" class="popup">
                        <div class="popup-content">
                            <!-- Your account details content goes here -->
                            <p>Hello Admin: ${sessionScope.adminsession.adminname}</p>
                            <p>With ID ${sessionScope.adminsession.id}</p>
                            <!-- Add more details as needed -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="banner">

            <img src="images/Banner00.jpg" alt="Chanel" />

        </div>

        <div class="info"><h1>Book Details</h1></div>




        <div class="detail">
            <table>
                <tr><td>Book ID</td><td>${requestScope.book.bookid}</td></tr>
                <tr><td>Book Name</td><td>${requestScope.book.bookname}</td></tr>
                <tr><td>Book Author</td><td>${requestScope.book.bookauthor}</td></tr>		 
                <tr><td>Book Type</td><td>${requestScope.book.booktype}</td></tr>		 
                <tr><td>Book Language</td><td>${requestScope.book.booklanguage}</td></tr>		 

            </table>
        </div>

        <div class="cainut">
            <form action="BookController" style="padding-top: 10px">
                <input type=hidden name="id" value="${requestScope.book.bookid}">
                <input type=hidden name="action" value="edit">
                <input type=submit value="Edit" ></form>
        </div>

        <div class="cainut2">
            <a href="BookController"><button>Return to list</button></a>
        </div>




        <div class="footer">
            <div class="footer-content" style="font-family: 'Poppins', sans-serif;">
                <p>Email : CuongNPSE183844@fpt.edu.vn</p>
                <p>Address: FPT University, District 9, TPHCM</p>
                <h5>&copy; Copyright 2024. CHKH_Library.com</h5>
            </div>
        </div>
        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = '300px'
            }
            function closeNav() {
                document.getElementById("mySidenav").style.width = '0px'
            }
            function toggleAccountPopup() {
                var popup = document.getElementById("account-popup");
                popup.style.display = popup.style.display === "none" ? "block" : "none";
            }

            function closeAccountPopup() {
                var popup = document.getElementById("account-popup");
                popup.style.display = "none";
            }
        </script>
    </body>
</html>
