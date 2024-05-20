<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CHKH Library</title>

        <style>
            table{
                margin-top: 10px
            }
            table, tr, td{
                border-collapse: collapse;
                width: 400px;
                border: 1px solid black;
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
                margin-right: 20px;
            }   


            .banner img {
                width: 100%;
                height: 300px;
            }

            .Info {
                margin: 20px 0;
                text-align: center;
            }

            .Info_paraghraph{
                font-size: large;
            }

            .footer {
                text-align: center;
                background-color: black;
                color: white;
            }

            .footer-content {
                padding: 10px 0;

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

            .info{
                display: flex;
                justify-content: center; /* Horizontally center the content */
                align-items: center; /* Vertically center the content */
                margin: 20px 0px;
                text-transform: uppercase;
                color: #ff445c
            }

            .detail {
                display: flex;
                justify-content: center; /* Horizontally center the content */
                align-items: center; /* Vertically center the content */
                margin: 20px 0px 
            }

            input[type="submit"] {
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
                margin: 12px 0;

            }
            a{
                text-decoration: none;
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
    </head>
    <body>
        <div class="header">
            <div class="header_menu">
                <div id="mySidenav" class="sidenav">
                    <a href="javascript:void(0)" id="closebtn" class="closebtn" onclick="closeNav()">&times;</a>
                    <a href="home_page.jsp">Home</a>
                    <a href="UserBookController">Books</a>
                    <a href="information.jsp">Information</a>
                    <a href="UserDonateController">Donate</a>
                    <a href="UserBookController?action=showcart&userID=${sessionScope.usersession.id}">Cart</a>
                    <a href='userlogin?action=logout'>Logout</a>


                </div>

                <span style="font-size:30px;cursor:pointer;" onclick="openNav()">&#9776; Menu</span>
            </div>

            <div class="header_logo">
                <a href="home_page.jsp"><img src="images/logo2_1.png"></a>
            </div>


            <div class="header_search">
                <div class="account-icon" onclick="toggleAccountPopup()">
                    <img src="images/profile user person account.svg" alt="Account Icon">
                    <div id="account-popup" class="popup">
                        <div class="popup-content">
                            <!-- Your account details content goes here -->
                            <p>Hello username: ${sessionScope.usersession.username}</p>
                            <p>With ID ${sessionScope.usersession.id}</p>
                            <!-- Add more details as needed -->
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <div class="banner">

            <img src="images/Banner00.jpg" alt="Chanel" />

        </div>   

        <div class="info"><h1>Donate Form</h1></div>

        <div class="detail">
            <form action="./UserDonateController" method="POST">
                <table>

                    <tr><td>Donate ID</td><td><input name="id" value="${requestScope.donate.donateid}" required="Please enter" readonly="a"</td></tr>
                    <tr><td>User ID</td><td><input name="userID" value="${sessionScope.usersession.id}" required="Please enter" readonly="a"</td></tr>
                    <tr><td>Book Name</td><td><input name="bookName" value="${requestScope.donate.bookname}" required="Please enter" placeholder="Truyen Kieu"</td></tr>
                    <tr><td>Book Author</td><td><input name="bookAuthor" value="${requestScope.donate.bookauthor}" required="Please enter" placeholder="Nguyen Du"</td></tr>
                    <tr><td>Book Language</td><td><input name="bookLanguage" value="${requestScope.donate.booklanguage}" required="Please enter" placeholder="Vietnamese/English"</td></tr>

                    <tr><td>Created Date</td><td><input name="created_date" value="${requestScope.donate.created_date}" required="Please enter" placeholder="YYYY-MM-DD"</td></tr>		 
                    <tr><td>Status</td><td><input name="status" value="False" required="Please enter" placeholder="True/False" readonly="a"</td></tr>		 

                </table>

                <div class="cainut" style="margin-top: 15px">
                    <input name="action" value="${requestScope.nextaction}" type="hidden">
                    <input type="submit" value="Save">
                </div>

            </form>
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
