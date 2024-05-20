<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CHKH Library</title>

        <style>

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


            .banner img {
                width: 100%;
                height: 300px;
            }

            .Our_quotes {
                margin: 20px 0;
                text-align: center;
            }

            .Quotes{
                font-size: medium;
            }

            .meetus {
                margin: 70px 0;
                text-align: center;
            }

            .contact_info {
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 30px;
                margin-left: 20px;
            }

            .contact {
                background: white;
                color: black;
                border: 1px solid   ;
                border-radius: 20px;
                font-size: 15px;
                font-weight: bold;
                padding: 10px 100px;
                letter-spacing: 1px;
                text-transform: uppercase;
                margin-left: 20px;
            }

            .contact1 {
                background: white;
                color: black;
                border: 1px solid   ;
                border-radius: 20px;
                font-size: 15px;
                font-weight: bold;
                padding: 10px 85px;
                letter-spacing: 1px;
                text-transform: uppercase;
                margin-left: 20px;
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

        <div class="Our_quotes">
            <h2 style="text-transform: uppercase;">Our Quotes</h2>

            <div class="Quotes">
                <p>"The more that you read, the more things you will know. The more that you learn, the more places you'll go."- Dr.Seuss</p>

                <p> "A reader lives a thousand lives before he dies. The man who never reads lives only one"- George R.R Martin</p>

                <p> "Đọc sách nên đọc bản văn cho kỹ, nhằm từng chữ một, mới thấy thú vị, thấy chỗ nào không hiểu thấu được thì nghĩ cho kỹ; nghĩ kỹ không ra mới xem chú giải, như thế mới có ý vị"- Lê Quý Đôn</p>
            </div>


            <div style="clear: both;"></div>
        </div>

        <div class="meetus">
            <h2 style="text-transform: uppercase;">To Meet Us</h2>
            <div class="contact_info">
                Hotline:
                <div class="contact">12345678910</div>
            </div>
            <div class="contact_info">
                Address:
                <div class="contact1">FPT University, District 9, TPHCM</div>
            </div>
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
