<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html lang="zxx">

<head>
    <title>注册</title>
    <!-- Meta tag Keywords -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Simple Signin Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements"
    />
	<script type= "text/javascript" src= "./style/js/jQuery-1.11.1.js"></script >
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- Meta tag Keywords -->
    <!-- css files -->
    <link rel="stylesheet" href="./style/css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="./style/css/zulu.css" type="text/css" media="all" />
    <!-- Style-CSS -->
    <link rel="stylesheet" href="./style/css/font-awesome.css">
    <!-- Font-Awesome-Icons-CSS -->
    <!-- //css files -->
    <!-- web-fonts -->
    <link href="//fonts.googleapis.com/css?family=Play:400,700" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <!-- //web-fonts -->
</head>

<body>
<!--header-->
<div style="height: auto">
    <div style="height:80px ">
        <div class="header-w32">
            <h1>
                <span style="color: #f152a1">M</span><span style="color: dodgerblue">@</span><span style="color:#fbff10;">i</span><span style="color: #ff191e	">l</span>
            </h1>
        </div>
        <div class="header-w3l">
            <h1>
                <span><u style="color: aqua">O</u><u style="color: blueviolet"><span>n</span></u><u style="color: chartreuse">e </u><u style="color: deeppink">P</u><u style="color: blanchedalmond">u</u><u style="color: fuchsia">n</u><u style="color: yellow">c</u><u style="color: orangered">h</u></span>
                <b style="color: #3b0ef5;font-size: 15px">西邮第一品牌</b>
            </h1>
        </div>
        <div class="header-w33">
                <h1>
                  		  <a  href="#">客服中心</a>|<a href="#">反馈中心</a>|<a href="#">帮助中心</a>
                </h1>
            </div>
    </div>
    <div class="top-line">
    </div>
    <!--//header-->
    <div class="main-content-agile">

        <div id="zhuce" class="sub-main-w3">
            <form action="login.do?register=loginre" method="post">
                <label><span>用户名:</span></label>
                <div class="pom-agile">
                    <span class="fa fa-user-o" aria-hidden="true"></span>
                    <input placeholder="Username" name="Name" class="user" type="text" required="">
                </div>

                <label><span>密码(请输入6-14位数字、字母、下划线):</span></label>
                <div class="pom-agile">
                    <span class="fa fa-key" aria-hidden="true"></span>
                    <input placeholder="Password" name="Password" class="pass" type="password" required="">
                </div>
                <label><span>再次输入:</span></label>
                <div id="confirm" class="pom-agile">
                    <span class="fa fa-key" aria-hidden="true"></span>
                    <input placeholder="Password" name="Password_confirm" class="pass" type="password" required="">
                </div>
                <div class="right-w3l">
                    <input type="submit" value="确定" onclick="up();">
                </div>
                <script>
                
                	 function up() {
                     	$pass=$(":password").eq(0);
                 		$confirm=$(":password").eq(1);
                 	
                 		if($pass.val()==''){
                 			
                 		}
                 		else if($confirm.val()==''){
                 			
                 		}
                 		else if($pass.val()!=$confirm.val()){	
							alert("两次密码不一致");
                 		}
                 		else{
                 			  $(location).attr("href","zhuce.jsp");
                 		}                 
                     }
                	 
                	 function down(){
                		 $(location).attr("href","index.jsp");
                	 }
              
                </script>
                <div class="right-w32">
                    <input type="button" value="取消" onclick="down();">
                </div>
            </form>
        </div>
    </div>
    <!--//main-->
    <!--footer-->
    <div class="footer">
        <p><a href="#">关于我们</a> | <a href="#">联系中心</a> | <a href="#">隐私政策</a> | &copy; Copy 2018-9-13|by Design
            <a href="#">xxx</a>
        </p>
    </div>
</div>
<!--//footer-->
</body>

</html>