<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="entity.*,dao.*"%>
<!DOCTYPE HTML>
<html lang="zxx">

<head>
<%if(session.getAttribute("user")==null)
{
	out.println("<script>alert(\"尚未登录\");window.location.href=\"./index.jsp\"</script>");
}
%>

    <title>写信</title>
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
                  		 <a href="#">反馈中心</a>|<a href="#">帮助中心</a>|<a href="login.do?act=loginout">退出</a>
                </h1>
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
                         <a href="send.jsp" style="color:#5859a0;font-weight:600;">写信</a>
                    </li>
                    <li onmouseover="onover(this);" onmouseleave="onleave(this);">
                        <input type="button" id="recieve" class="header-w35-xian-tu2" disabled>
                         <a href="recieve.jsp" style="color: #5859a0;font-weight: 600;">收信</a>
                    </li>
                    <li onmouseover="onover(this);" onmouseleave="onleave(this);">
                        <input type="button" id="lianxiren" class="header-w35-xian-tu3" disabled>
                        <a href="lianxiren.jsp" style="color: #5859a0;font-weight: 600;">通讯录</a>
                    </li>
                </ul>
           </div>
            <div class="header-w35-xian">
                <a href="recieve.jsp"><h1 onmouseover="onover(this);" onmouseleave="onleave(this);"> 收件箱</h1></a>
                 <a href="alsend.jsp"><h2 onmouseover="onover(this);" onmouseleave="onleave(this);"> 已发送</h2></a> 
                <h3 onmouseover="onover(this);" onmouseleave="onleave(this);">已删除</h3>
                <a href="caogao.jsp" ><h1 onmouseover="onover(this);" onmouseleave="onleave(this);"> 草稿箱</h1></a>
                <h1 onmouseover="onover(this);" onmouseleave="onleave(this);">垃圾箱(4)</h1>
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
                <a style="color:#5859a0;" href="#" onmouseover="onover(this);" onmouseleave="onleave(this);">文件夹</a>
            </div>
    </div>
    <div class="header-w36">
		        <div style="weight:300px;height: 40px;">
		        <div  style="float: left;">
			        <table class="header-w36-table">
			            <tr>
			                <td>写信</td>
			            </tr>
			        </table>
		        </div>
		        <div id="tishi" style="float: left;margin-left: 250px;padding-top: 10px;"></div>
		        </div>
				
		        <div class="header-w36-buton">
		            <script>
		         		/* $(function(){
		         			$("#xfile").change(function(){
		         				var file = document.getElementById('xfile').files[0];
		         				data={
		         						"file":file
		         				}
		         				console.log(data)
		         			})
		         		}) */
		            
		                function input_tuchu(btn) {
		                    if ($(btn).hasClass("header-w36-buton-input")) {
		                        $(btn).removeClass();
		                        $(btn).addClass("header-w36-buton-input2")
		                        if($(btn).attr("id")=='close'){
		                        	 $(location).attr("href","zhuye.jsp");
		                        }else{
			                        if($("#reciever").val()===""){
				                    	$("#tishi").html("<font id=\"fontQ\" class=\"tishi\">请选择收件人！！！</font>");
				                    	setInterval(function(){
				                    		$("#fontQ").fadeOut(2000);
										}, 2000);
				                    }else{
				                   	var formData = new FormData();
				                    	formData.append("reciever",$("#reciever").val());
				                    	formData.append("title",$("#title").val());
				                    	formData.append("text",$("#text").val()); 
				                    	formData.append("file",document.getElementById("xfile").files[0]);
				                    /* 	var fileObj = document.getElementById("xfile").files[0]; */
				                    	/* var data={
				                    			"reciever":$("#reciever").val(),
				                    			"title":$("#title").val(),
				                    			"text":$("#text").val(),
				                    			"file":document.getElementById("xfile").files[0]
				                    	};  */
				                    	if($(btn).attr('id')=='send1'){
				                    		console.log(formData.get("file"))
					                    	 $.ajax({
													"url":"send.send?send1=write",
													"type":"post",
													"data":formData,
													 contentType:false,
										             processData:false,
													"dataType":"json",
													"success":function(str){
														$("#tishi").html("<font id=\"fontQ\" class=\"tishi\">正在发送邮件...</font>");
															if("OK"===str[0]){
																setInterval(function(){
																		$("#fontQ").fadeOut(2000);	
																	 	$(location).attr("href","sendOk.jsp");
																	}, 2000);
																}
															else if("False"===str[0]){
																$("#tishi").html("<font id=\"fontQ\" class=\"tishi\">发送失败！！！</font>");
																setInterval(function(){
										                    			$("#fontQ").fadeOut(2000);
																	}, 2000);
															}else if("Non"===str[0]){
																$("#tishi").html("<font id=\"fontQ\" class=\"tishi\">收件人不存在！！！</font>");
																setInterval(function(){
										                    			$("#fontQ").fadeOut(2000);
																	}, 2000);
															}
													}
											}) 
				                    	}else if($(btn).attr("id")=='save'){
				                    		$.ajax({
				                    			"url":"save.send?send2=save",
				                    			"data":data,
				                    			"datatype":"json",
				                    			"success":function(str){
				                    				if("OK"===str[0]){
														$("#tishi").html("<font id=\"fontQ\" class=\"tishi\">邮件保存成功！！！</font>");
														setInterval(function(){
								                    			$("#fontQ").fadeOut(2000);
															}, 2000);
														}
													else{
														$("#tishi").html("<font id=\"fontQ\" class=\"tishi\">邮件保存失败！！！</font>");
														setInterval(function(){
								                    			$("#fontQ").fadeOut(2000);
															}, 2000);
														}
				                    			}
				                    		})
				                    	}
				                    }
		                        }
		                    }
		                    setTimeout(function () {
		                        if($(btn).hasClass("header-w36-buton-input2")){
		                            $(btn).removeClass();
		                            $(btn).addClass("header-w36-buton-input")
		                        }
		                    },120);
		                }
		         		function xianfu(){
		         			$("#fu").prepend('<span>'+document.getElementById("xfile").files[0].name+'</span>');
		         		}
		            </script>
		            <input id="send1" type="button"  class="header-w36-buton-input" onclick="input_tuchu(this);"  value="发送"/>
		            <input type="button"  class="header-w36-buton-input" onclick=""  value="定时发送"/>
		            <input id="save" type="button"  class="header-w36-buton-input" onclick="input_tuchu(this)"  value="存草稿"/>
		            <input id="close" type="button"  class="header-w36-buton-input" onclick="input_tuchu(this)"  value="关闭"/>
		        </div>
		        <form action="write.send?send=sendOk">
		        <div class="header-w36-person">
		                <a href="#">收信人:</a>
		                <input type="text" id="reciever" name="reciever" style="width: 670px;height: 19px;"/>
		            </h1>
		            <h2>
		                <span>主题:</span>
		                <input id="title" type="text" name="title" style="width: 670px;height: 19px;"/>
		            </h2>
		            <h3 id="fu">
		                <label id="fujian"  class="header-w36-buton-input-lable" style="cursor:pointer;" for="xfile">添加附件</label>
		                <input type="file" onchange="xianfu();" id="xfile" style="position:absolute;clip:rect(0 0 0 0);"/>
		            </h3>
		        </div>
		        <div class="header-w36-person">
		            <div style="margin-top:20px;background: #dde0e2;height: 295px;">
		                    <div style="padding-left:20px;float:left;color:#6d4b9f;">正文:</div>
		                    <div style="float:left;background: #dde0e2;">
		                    	<span></span>
		                        <textarea id="text" name="text" style="resize:none;width: 802px;height: 252px;font-size:20px;background-image:url('style/images/txtback.jpg');"></textarea>
		                    </div>
		                     <div style="padding-left:55px;padding-top:8px;font-size:10px;float:left;color:#6d4b9f;">
		                    	 <span>发件人:<%=user.getUserName()%></span>
		                    </div>
		                  	
		       		</div>
		        </div>
              	<div class="header-w36-send">
            		<input id="send1" type="button"  class="header-w36-buton-input" onclick="input_tuchu(this);"  value="发送"/>
		            <input type="button"  class="header-w36-buton-input" onclick=""  value="定时发送"/>
		            <input id="save" type="button"  class="header-w36-buton-input" onclick="input_tuchu(this)"  value="存草稿"/>
		            <input id="close" type="button"  class="header-w36-buton-input" onclick="input_tuchu(this)"  value="关闭"/>
       			</div>
       			</form>
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