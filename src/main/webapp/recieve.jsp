<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="entity.*,dao.*,java.util.*"%>
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
                <h1> <a href="#" id="username"><%=user.getUserName() %></a></h1>
                <h2><a href="zhuye.jsp">首页</a> | <a href="#">个人中心</a></h2>
            </div>
            <div class="header-w33">
                <h1>
                  		 <a href="#">反馈中心</a>|<a href="#">帮助中心</a>|<a href="login.do?act=loginout">退出</a>
                </h1>
            </div>
         </div>
    </div>
    <div class="top-line">
    </div>

<!--//header-->
<script type="text/javascript">
	var sum=0;
	function clicksum(btn){
		if($(btn).prop("checked")==true){
			sum=sum+1;
		}else{
			sum=sum-1;
		}
		$("#xuanze").html(sum);
	}

	function onover(btn){
		$(btn).css("background-color","#abb9b6");
		/* $(btn).addClass("hidd_dao"); */
	}
	function onleave(btn) {
		if($(btn).css("background-color")=="rgb(171, 185, 182)"){
			$(btn).css("background-color","#d6d6d6");
		}
	}
	function text1(btn) {
		var data={
				"id":$(btn).parent().attr("id"),
				"title":$(btn).prev().children().html(),
				"text":$(btn).children().html(),
				"date":$(btn).next().children().html()
			};
		$.ajax({
			"url":"read1.read?see=readEm",
    		"type":"post", 
    		"data":data,
    		"datatype":"json",
    		"success":function(str){
    			if("OK"==str[0]){
    				$(location).attr("href","read.jsp");
    			}
    		}
		});
		
	}
	
	 function xiazai1(btn) {
			
	        var url = "http://localhost:8080/email/fujian.down";
	        var fileName = $(btn).attr("id");
	        var form = $("<form></form>").attr("action", url).attr("method", "post");
	        form.append($("<input></input>").attr("type", "hidden").attr("name", "fileName").attr("value", fileName));
	        form.appendTo('body').submit().remove();
	    }
	 function input_tuchu(btn) {
         if ($(btn).hasClass("header-w36-buton-input")) {
             $(btn).removeClass();
             $(btn).addClass("header-w36-buton-input2")
             var id="";
             
             if($("#check").prop("checked")==true){
            	 data=data+'"num":'+$(".qx").length+','
            	 for(var i=0;i<$(".qx").length;i++){
            		 if(i!=$(".qx").length){
            			 id=id+$(".qx").eq(i).parent().parent().attr("id")+",";
            		 }else{
            			 id=id+$(".qx").eq(i).parent().parent().attr("id");
            		 }
            	 }
             }else{
            	 var num=0;
            	 for(var i=0;i<$(":checkbox").length;i++){
            		 if($(":checkbox").eq(i).prop("checked")==true){
            			 num=num+1;
            		 }
            	 }
            	 var sum=0;
            	 for(var i=0;i<$(":checkbox").length;i++){
            		 if($(":checkbox").eq(i).prop("checked")==true){
            			 sum=sum+1;
            			 if(sum!=num){
            				 id=id+$(":checkbox").eq(i).parent().parent().attr("id")+",";
            			 }
            			 else{
            			 	id=id+$(":checkbox").eq(i).parent().parent().attr("id");
            			 }
            		 }
            	 }
             }
             var data={
            		 	"id":id
            		 }
            if(id.length!=0){
            	$.ajax({
            		"url":"recieve.send?recieve2=delete",
            		"type":"post",
            		"data":data,
            		"datatype":"json",
            		"success":function(str){
            			var flag="1";
            			for(var i=0;i<str.length;i++){
            				if("False"===str[i]){
            					flag="0";
            				}
            			}
            			if("1"===flag){
            				$("#tishi").html("<font id=\"fontQ\" class=\"tishi\">删除成功！！！</font>");
            				setInterval(function(){
								$("#fontQ").fadeOut(1000);	
							 	$(location).attr("href","recieve.jsp");
							}, 1000);
            			}else{
            				$("#tishi").html("<font id=\"fontQ\" class=\"tishi\">删除失败！！！</font>");
            				setInterval(function(){
								$("#fontQ").fadeOut(1000);	
							 	$(location).attr("href","recieve.jsp");
							}, 1000);
            			}
            		}
            	})
            }
         }
         setTimeout(function () {
             if($(btn).hasClass("header-w36-buton-input2")){
                 $(btn).removeClass();
                 $(btn).addClass("header-w36-buton-input")
             }
         },120);
     }
	$(function(){
		$("#check").click(function(){
			var input=$(this).prop("checked");
			$(".qx").prop("checked",input);
			var num=0;
			for(var i=0;i<$(".qx").length;i++){
				if(true==$(".qx").eq(i).prop("checked")){
					num=num+1;
				}
			}
			$("#xuanze").html(num);
		})
		var data={
			"user":$("#username").html()
		}
		$.ajax({
			"url":"recieve.send?recieve1=rehref",
			"type":"post",
			"data":data,
			"datatype":"json",
			"success":function(list){
				
				if(list[0]=="False"){
					$(location).attr("href","error.jsp");
				}else{
					$(".header-w36-zongji").html('<span>共'+list.length+'封,已选择<span id="xuanze">0</span>封,其中<a href="#">未读邮件</a>1封</span>');
					for(var i=0;i<list.length;i++){
						var str='<tr'+' id="'+list[i].id+'"><td style="align:center"><input class="qx"  onclick="clicksum(this);" type="checkbox"/></td><td><span>';
						var d=new Date(list[i].date.time);
						var month=d.getMonth()+1;
						console.log(list[i].filePath)
						if(list[i].filePath==" "){
							var fu='<td><span>无附件</span></td>';
						}else{
							var s=list[i].filePath.split("\\upload\\");
						/* 	var fu='<td><span>'+s[1]+'<a href="'+list[i].filePath+'">下载</a></span></td>'; */
						 var fu='<td><span>'+s[1]+'<input id="'+list[i].filePath+'" type="button" value="下载" onclick="xiazai1(this);"/></span></td>'; 
						}
						$("#tbody").append(str+list[i].sender
								+"</span></td><td  style=\"cursor:pointer;\" onmouseover=\"onover(this);\" onmouseleave=\"onleave(this);\" onclick=\"text1(this);\" ><span>"
								+list[i].title+"</span></td>"
								+fu+"<td><span>"+d.getFullYear()+"-"+month+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds()+"</span></td></tr>");
					}
				}
			}
		})
	})
	
</script>
<div>
    <div class="header-w35">
           <div class="header-w35-dao">
                <ul>
                    <li ononmouseover="onover(this);" onmouseleave="onleave(this);">
                        <input type="button" class="header-w35-xian-tu1" disabled>
                         <a href="send.jsp" style="color:#5859a0;font-weight:600;"> 写信</a>
                    </li>
                    <li onmouseover="onover(this);" onmouseleave="onleave(this);">
                        <input type="button" class="header-w35-xian-tu2" disabled>
                         <a href="recieve.jsp" style="color: #5859a0;font-weight: 600;"> 收信</a>
                    </li>
                    <li onmouseover="onover(this);" onmouseleave="onleave(this);">
                        <input type="button" class="header-w35-xian-tu3" disabled>
                        <a href="lianxiren.jsp" style="color: #5859a0;font-weight: 600;"> 通讯录</a>
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
                            $img.addClass("floder-tu");
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
    			<div style="height: 36px;">
			        <div style="float: left;">
			        <table class="header-w36-table">
			            <tr>
			                <td>收信</td>
			            </tr>
			            
			        </table>
			        </div>
			        <div id="tishi" style="float: left;margin-left: 250px;padding-top: 10px;"></div>
					 <div class="search">  	
				       		<input type="text" fullsearch="0" newattachfolder="0" autocomplete="off" value="搜索邮件..."/>
				       		<span class="icon_search"></span>
				      </div>
			     </div>
		        <div class="header-w36-buton">
		            <input type="button"  id="shanchu" class="header-w36-buton-input" onclick="input_tuchu(this);"  value="删除"/>
		            <input type="button"  class="header-w36-buton-input" onclick="input_tuchu(this);"  value="彻底删除"/>
		            <input type="button"  class="header-w36-buton-input" onclick="input_tuchu(this);"  value="转发"/>
		            <input type="button"  class="header-w36-buton-input" onclick="input_tuchu(this);"  value="标记已读"/>
		            <input type="button"  class="header-w36-buton-input" onclick="input_tuchu(this);"  value="移动到"/>
		            <input type="button"  class="header-w36-buton-input" onclick="input_tuchu(this);"  value="选择已读"/>
		            <input type="button"  class="header-w36-buton-input" onclick="input_tuchu(this);"  value="选择未读"/>
		        </div>
		      	 <div class="header-w36-zongji">
		      	 	<span>共0封,已选择0封,其中<a href="#">未读邮件</a>1封</span>
		      	 </div>
		      	 <div class="header-w36-xinjian">
		      	 	<table>
		      	 		<thead>
		      	 			<tr>
		      	 				<td>
		      	 					<input type="checkbox" onclick="clicksum(this);" id="check"/>
		      	 				</td>
		      	 				<td>
		      	 					<span>发件人</span>
		      	 				</td>
		      	 				<td>
		      	 					<span>主题</span>
		      	 				</td>
		      	 				<td>
		      	 					<span>附件</span>
		      	 				</td>
		      	 				
		      	 				<td>
		      	 					<span>时间</span>
		      	 				</td>
		      	 			</tr>
		      	 		</thead>
		      	 		<tbody id="tbody">
		      	 	<!-- 		<tr id="6">
		      	 				<td style="align:center">
		      	 					<input class="qx" type="checkbox"/>
		      	 				</td>
		      	 				<td>
		      	 					<span>何浩飞</span>
		      	 				</td>
		      	 				<td>
		      	 					<span style="cursor: pointer;" onmouseover="">少时诵诗书所</span>
		      	 				</td>
		      	 				<td>
		      	 					<span>2016年9月12日</span>
		      	 				</td>

		      	 			</tr> -->
			      	 	</tbody>
			      	 	<tfoot>
			      	 		<tr>
			      	 			<td colspan="4">
			      	 				<a href="#"> 1  </a>
			      	 				<a href="#"> 2  </a>
			      	 				<a href="#"> 3  </a>
			      	 			</td>
			      	 		
			      	 		</tr>
			      	 	</tfoot>
		      		 </table>
		      	 </div>
		   <div class="header-w37-buton">
		            <input type="button"  class="header-w36-buton-input" onclick="input_tuchu(this);"  value="删除"/>
		            <input type="button"  class="header-w36-buton-input" onclick="input_tuchu(this);"  value="彻底删除"/>
		            <input type="button"  class="header-w36-buton-input" onclick="input_tuchu(this);"  value="转发"/>
		            <input type="button"  class="header-w36-buton-input" onclick="input_tuchu(this);"  value="标记已读"/>
		            <input type="button"  class="header-w36-buton-input" onclick="input_tuchu(this);"  value="移动到"/>
		            <input type="button"  class="header-w36-buton-input" onclick="input_tuchu(this);"  value="选择已读"/>
		            <input type="button"  class="header-w36-buton-input" onclick="input_tuchu(this);"  value="选择未读"/>
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