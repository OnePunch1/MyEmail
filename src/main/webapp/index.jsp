<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="entity.User,dao.*,Sqlconnect.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <%
	UserDao usdao=new UserDaoImp();
	User user=new User();
	
	if(session.getAttribute("user") instanceof User){
		user=(User)session.getAttribute("user");
	}
	 if(usdao.find(user)){
		response.sendRedirect(request.getContextPath()+"/zhuye.jsp");
	} 
%>
<head>
    <title>登录</title>
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
    <!-- Style-CSS -->
    <link rel="stylesheet" href="./style/css/font-awesome.css" type="text/css">
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
        <div class="sub-main-w3">
            <form action="login.do?sign=loginsign" method="post">
                <label><span>用户名:</span></label>
                <div class="pom-agile">
                    <span class="fa fa-user-o" aria-hidden="false"></span>
                    <input placeholder="Username" id="name" name="Name" class="user" type="text">
                </div>
                <label><span>密码(请输入6-14位数字、字母、下划线):</span></label>
                <div class="pom-agile">
                    <span class="fa fa-key" aria-hidden="false"></span>
                    <input placeholder="Password" id="pass" name="Password" class="pass" type="password">
                </div>

                <div class="sub-w3l">
                    <div class="sub-agile">
                        <input type="checkbox" id="brand1" value="">
                        <label for="brand1">
                            <span></span><b style="color: black">记住密码</b></label>
                    </div>
                    <a href="#"><b style="color: black">忘记密码?</b></a>
                    <div class="clear"></div>
                </div>
            	 <script>
                    function denglu(btn) {
                        if("登录" === $(btn).val()) {
                         	if($(":text").val()==''||$(":password")==''){
                         		alert("用户名或者密码不能为空！！！");
                         	}
                        }
                    }
                </script>
                <div class="right-w31">
                    <input type="submit" value="登录" onclick="denglu(this);"/>
                </div>
                <script>
                    function zhuce(btn) {
                        if("注册"===$(btn).val()){ $(location).attr("href","zhuce.jsp");}

                    }
                </script>
                <div class="right-w32">
                    <input type="button" value="注册" onclick="zhuce(this);"/>
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