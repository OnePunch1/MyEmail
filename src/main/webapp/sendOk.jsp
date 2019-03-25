<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="entity.User,dao.*,Sqlconnect.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">

<head>
<%if(session.getAttribute("user")==null)
{
	out.println("<script>alert(\"尚未登录\");window.location.href=\"./index.jsp\"</script>");
}
%> 
    <title>主页</title>
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

<div>
    <div>
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
             <div class="header-w34">
             <%
             	User user=new User();
             	if(session.getAttribute("user") instanceof User){
             		user=(User)session.getAttribute("user");
             	}
             %>
                <h1><a href="#"><%=user.getUserName()%></a></h1>
                <h2><a href="zhuye.jsp">首页</a> | <a href="#">个人中心</a></h2>
            </div>
            <div class="header-w33">
                <h1>
                		
                  		 <a href="#">反馈中心</a>|
                  		 <a href="#">帮助中心</a>|
                  		<%--  <%	
                  		 	/* session.invalidate(); */
                  		 %>
                  		 <script type="text/javascript">
                  		 	function  exit() {
								location.replace("http://localhost:8080/email/index.jsp");
							}
                  		 </script> --%>
                  		 <a href="login.do?act=loginout">退出</a>
                  		 
                </h1>
            </div>
         </div>
    </div>
    <div class="top-line">
    </div>

<!--//header-->
<script type="text/javascript">
	function onover(btn){
		$(btn).addClass("hidd_dao");
	}
	function onleave(btn) {
		if($(btn).hasClass("hidd_dao")){
			$(btn).removeClass();
		}
	}
</script>
<div>
    <div class="header-w35">
           <div class="header-w35-dao">
                <ul>
                    <li onmouseover="onover(this);" onmouseleave="onleave(this);">
                        <input type="button" class="header-w35-xian-tu1" disabled>
                         <a href="send.jsp" style="color:#5859a0;font-weight:600;"> 写信</a>
                    </li>
                    <li onmouseover="onover(this);" onmouseleave="onleave(this);">
                        <input type="button" class="header-w35-xian-tu2" disabled>
                         <a href="recieve.jsp" style="color: #5859a0;font-weight: 600;"> 收信</a>
                    </li>
                    <li onmouseover="onover(this);" onmouseleave="onleave(this);">
                        <input type="button" class="header-w35-xian-tu3" disabled>
                        <a href="#" style="color: #5859a0;font-weight: 600;"> 通讯录</a>
                    </li>
                </ul>
           </div>
            <div class="header-w35-xian">
                <a href="recieve.jsp"><h1 onmouseover="onover(this);" onmouseleave="onleave(this);"> 收件箱</h1></a>
                  <a href="alsend.jsp"><h2 onmouseover="onover(this);" onmouseleave="onleave(this);"> 已发送</h2></a> 
                <h3 onmouseover="onover(this);" onmouseleave="onleave(this);">已删除</h3>
                <a href="caogao.jsp" ><h1 onmouseover="onover(this);" onmouseleave="onleave(this);"> 草稿箱</h1></a>
                <h1 onmouseover="onover(this);" onmouseleave="onleave(this);"	> 垃圾箱(4)</h1>
            </div>
            <div id="floder" class="header-w35-xian-floder">
                <img class="floder-tu" onclick="floder_op();"  hidefocus/>
                <script>
                    function floder_op() {
                        $img=$("#floder").children().eq(0);
                        if($img.hasClass("floder-tu-open")){
                            $img.removeClass();
                            $img.addClass("floder-tu")
                        }
                        else {
                            $img.removeClass();
                            $img.addClass("floder-tu-open")
                        }
                    }
                </script>
                <a style="color:#5859a0;" href="#" onmouseover="onover(this);" onmouseleave="onleave(this);">我的文件夹</a>
            </div>
    </div>
    <div class="header-w36">
		     
				<div class="header-w36-zongji">
					<b>下午好</b>
					<a href="#"><%=user.getUserName()%></a>
				</div>
		      	<div class="header-w36-zongji-1">
		      	 	<span><font style="color:#56a982;">此邮件已发送，并已保存在"已发送"文件夹</font></span>
		      	 </div>
		      	
		      	<div class="header-w36-wenhou" style=" letter-spacing:2px;  width:865px;height:475px;float:left;padding-top:8px;padding-left:35px;background-color:#d3d6d8;">
			      	 <a href="#" style="font-size: 15px;text-decoration:underline;">查看此邮件</a>
			      	 <a href="#" style="font-size: 15px;text-decoration:underline;">查看发送状态</a>
		      	</div>
	
    </div>
    <div class="header-w37">     
			      <div>
				        <table class="header-w37-tong">
				            <tr>
				                <td>通讯录</td>
				            </tr>
				        </table>
			        </div>
					<div class="header-w37-xun">
						<h1>qqqqqqqqqq</h1>
					</div>
   	</div>
    </div>
    

<!--//footer-->
</div>
</body>

</html>