<%@page import="prj301library.Donates.DonateDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CHKH Library</title>
    </head>
    <body>
        <style>

            body{
                font-size: 16px;
                font-family: Arial, Helvetica, sans-serif;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            tr:hover {
                background-color: #f5f5f5;
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

            /*            .detail {
                            display: flex;
                            justify-content: center;  Horizontally center the content 
                            align-items: center;  Vertically center the content 
                            margin: 20px 0px 
                        }*/

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

            #box{
                margin-left: 60px;
                margin-top: 10px;
            }

            .taomoi{
                margin: 10px 0px;
            }

            a{
                text-decoration: none;
                color: black;
            }
            .detail {
                display: flex;
                justify-content: center; /* Horizontally center the content */
                align-items: center; /* Vertically center the content */
                margin: 20px 0px 
            }

            .cainut{
                display: flex;
                justify-content: center; /* Horizontally center the content */
                align-items: center;
                margin-bottom: 12px;
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
        <div id="box">
            <form action='' method=GET> 
                <input name=keyword type=text placeholder="Search by ID" value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>" placeholder="Search " style="width: 200px">
                <input type=submit value=Search style="padding:  6px 12px">
            </form> 
        </div>

        <div class="info"><h1>Donate list</h1></div>


        <div class="detail">
            <table>
                <tr><td>DonateID</td>
                    <td>UserID</td>
                    <td><a href=?colSort=bookname>Book Name</a></td>
                    <td><a href=?colSort=bookauthor>Book Author</a></td>
                    <td><a href=?colSort=booklanguage>Book Language</a></td>
                    <td>Created Date</td>
                    <td><a href=?colSort=status>Status</a></td>

                    <%
                        List<DonateDTO> list = (List<DonateDTO>) request.getAttribute("donatelist");
                        for (DonateDTO donate : list) {
                            pageContext.setAttribute("donate", donate);
                    %>
                <tr><td>
                        <a href="UserDonateController?action=details&id=${donate.donateid}"> ${donate.donateid}</a></td>
                    <td>${donate.userid}</td>
                    <td>${donate.bookname}</td>
                    <td>${donate.bookauthor}</td>
                    <td>${donate.booklanguage}</td>                   
                    <td>${donate.created_date}</td>
                    <td>${donate.status}</td>
                </tr>
                <%
                    }
                %>   


            </table>
        </div>


        <div class="cainut">
            <form action="UserDonateController" method="POST">
                <input name="action" value="create" type="hidden">
                <input type="submit" value="Create">
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
