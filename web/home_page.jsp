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

            .best_seller {
                margin: 20px 0;
            }

            .best_seller input{
                background: black;
                color: #fff;
                border: 1px solid black;
                border-radius: 20px;
                font-size: 12px;
                font-weight: bold;
                padding: 12px 45px;
                letter-spacing: 1px;
                text-transform: uppercase;
                transition: background-color 0.3s ease;
            }

            .best_seller-title, .accessories_title {
                text-align: center;
                color: red;
            }

            .best_seller-content {
                display: flex;
                justify-content: center;

            }


            .accessories_item-image, .accessories_item,
            .accessories_item-content,
            .best_seller-content-image, 
            .best_seller-content-details {
                max-width: calc((100%/12)*5);
            }

            .best_seller-content-image img {
                width: 100%;
                height: 100%;
            }

            .best_seller-content-details {
                margin-left: 16px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .best_seller-content-details-info {
                margin-left: 20px;
                font-size: large;
            }

            .best_seller-content-details-info h2 {
                color: black;
                font-weight: bold;
            }


            .best_seller-content-details-info button {
                background: black;
                color: #fff;
                border: 1px solid black;
                border-radius: 20px;
                font-size: 12px;
                font-weight: bold;
                padding: 13px 53px;
                letter-spacing: 1px;
                text-transform: uppercase;
                transition: transform 80ms ease-in;
                margin-top: 10px;
                font-size: small;
            }

            .best_seller-content-image {
                margin-right: 16px;
            }

            .accessories{
                margin: 50px 0;
            }
            .accessories_list {
                display: flex;

            }

            .accessories_list {
                display: flex;
                justify-content: center;
            }

            .accessories_item {
                display: flex;
                padding: 5px 0;
                margin: 0 10px;
                justify-content: space-around;
                border-style: solid;
                border-radius: 5%;
                border-width: 1px;
                text-align: center;
                align-items: center;
            }



            .accessories_item-image img {
                width: 100%;
                margin: 10px 10px;
            }

            .accessories_item-content {
                text-align: justify;
                font-size: large;
            }

            .footer {
                text-align: center;
                background-color: black;
                color: #fff;
            }

            .footer-content {
                padding: 10px 0;
                ;
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
        <div class="container">
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

            <div class="best_seller">
                <div class="best_seller-content">
                    <div class="best_seller-content-details">
                        <div class="best_seller-content-details-info">
                            <h2 style="text-transform: uppercase;">How we decided to give you free books</h2>

                            <p>Đọc sách mang đến nhiều lợi ích bất ngờ mà bạn không hề biết đến. Đọc sách đúng cách giúp kích thích não bộ phát triển tốt hơn, hạn chế lão hóa và giảm khả năng mất trí nhớ.</p>

                        </div>
                    </div>
                </div>
                <div style="clear: both;"></div>
            </div>



            <div class="accessories">

                <h1 class="accessories_title" style="text-transform: uppercase; font-family: 'Open Sans', sans-serif;">Famous Books</h1>
                <div class="accessories_list">

                    <div class="accessories_item">
                        <div class="accessories_item-image">
                            <img src="images/dac nhan tam.png" style="margin-top: 20px;"/>
                        </div>

                        <div class="accessories_item-content">
                            <h3>Đắc Nhân Tâm</h3>
                            <p>Đắc Nhân Tâm của tác giả Dale Carnegie được xem là quyển sách kinh điển hay nhất mọi thời đại. Quyển sách này nêu bật lên các nguyên tắc trong việc đối nhân xử thế rất khôn ngoan bắt đầu từ việc thấu hiểu, những bài học thu phục lòng người và làm mọi người yêu mến. 
                            </p>
                        </div>


                    </div>


                    <div class="accessories_item"> 

                        <div class="accessories_item-image">
                            <img src="images/cuon theo chieu gio.jpg" />
                        </div>

                        <div class="accessories_item-content">
                            <h3>Cuốn Theo Chiều Gió - Margaret Mitchell</h3>
                            <p>Cuốn Theo Chiều Gió là tiểu thuyết kinh điển của nền văn học Mỹ xuất bản lần đầu năm 1963. Cuốn sách lấy bối cảnh từ cuộc nội chiến khốc liệt giữa Bắc và Nam Mỹ để khắc họa tình yêu thương con người, sức mạnh vượt qua khổ đau, bất hạnh và tình yêu nam nữ. Nhân vật chính của tiểu thuyết là cô gái Scarlett O’hara cùng với chàng trai Rhett Butler, họ đã sống, đã yêu và đã tạo nên những hình tượng văn chương bất hủ, xóa nhòa mọi chuẩn mực về con người trong thời đại đó, khiến người đọc nhớ mãi không quên.</p>
                        </div>

                    </div>
                </div>
                <div style="clear: both; margin-bottom: 10px;"></div>

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
