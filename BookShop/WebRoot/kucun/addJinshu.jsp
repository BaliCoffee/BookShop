<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath}/css/sys.css"
	type="text/css" rel="stylesheet" />
	
	
	<script type="text/javascript">
	
			function autoWriteInfoByBookId(obj){
				
				
				var tiaoma = obj.value;
				var url = "${pageContext.request.contextPath}/book/BookAction_getAjaxBookinfo?tiaoma="+tiaoma;
				
				var xmlHttp = getXmlHttpRequest();
				xmlHttp.onreadystatechange = function(){
				if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
				
					var text = xmlHttp.responseText;
					
					
					
					var data = eval("("+text+")");
					
					if(data != null){
					
						
						
						document.getElementById("bookName").value = data.name;
						document.getElementById("bookAuthor").value = data.author;
						document.getElementById("bookPublishing").value = data.publishing;
						document.getElementById("bookNum").value = data.num;
						document.getElementById("bookBookid").value = data.bookid;
						document.getElementById("bookImg").value = data.img;
						
					}
					
				
				} 
				
			
			};
			
			xmlHttp.open("GET",url);
			xmlHttp.send(null);
			
			
			}
			
			function getXmlHttpRequest(){
			var xmlHttp;
			// 新浏览器都支持(谷歌、火狐、新IE等)
			if (typeof XMLHttpRequest != "undefined") {
			    xmlHttp = new XMLHttpRequest();
			} else if (window.ActiveXObject) {
				// IE兼容问题
			    var aVersions = ["Msxml2.XMLHttp.5.0", "Msxml2.XMLHttp.4.0", "Msxml2.XMLHttp.3.0", "Msxml2.XMLHttp", "Microsoft.XMLHttp"];
			    for (var i = 0; i < aVersions.length; i++) {
			        try {
			            xmlHttp = new ActiveXObject(aVersions[i]);
			            break;
			        } catch (e) {
			        	
			        };
			    };
			}
			return xmlHttp;
		}
			
	
	
	</script>

</head>

<body class="emp_body">
	<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr>
			<td class="topg"></td>
		</tr>
	</table>

	<table border="0" cellspacing="0" cellpadding="0" class="wukuang"
		width="100%">
		<tr>
			<td width="1%"><img
				src="${pageContext.request.contextPath}/images/tleft.gif" /></td>
			<td width="44%" align="left">[生成  进书单]</td>

		<!--  	<td width="52%" align="right"><a href="javascript:void(0)" onclick="document.forms[0].submit()"><img
					src="${pageContext.request.contextPath}/images/button/save.gif" /></a>
				<a href="#"><img
					src="${pageContext.request.contextPath}/images/button/tuihui.gif" /></a>

			</td> -->
			<td width="3%" align="right"><img
				src="${pageContext.request.contextPath}/images/tright.gif" /></td>
		</tr>
	</table>

	<s:form namespace="/book" action="BookAction_saveJinshudan" enctype="multipart/form-data" method="post">	
		
			<s:hidden name="bookid" value="%{bookid}" id="bookBookid"></s:hidden>
			<s:hidden name="img" value="%{img}" id="bookImg"></s:hidden>
		
		<table width="88%" border="0" class="emp_table" style="width:80%;">
			<tr>
				<td width="10%">书籍条形码：</td>
				<td width="20%"><s:textfield name="tiaoma" onblur="autoWriteInfoByBookId(this)" readonly="true"></s:textfield></td>
				<td width="8%">书籍名称：</td>
				<td width="62%"><s:textfield name="name" id="bookName" readonly="true"></s:textfield></td>
			</tr>
			<tr>
				<td>作者：</td>
				<td><s:textfield name="author" id="bookAuthor" readonly="true"></s:textfield></td>
				<td>出版社：</td>
				<td><s:textfield name="publishing" id="bookPublishing" readonly="true"></s:textfield></td>
			</tr>
			<tr>
				<td>库存量：</td>
				<td><s:textfield name="num" id="bookNum" readonly="true"></s:textfield></td>
				<td></td>
				<td></td>
			</tr>
			
			<tr>
				<td>进价:</td>
				<td><s:textfield name="jinPrice" id="jinPrice"></s:textfield></td>
				<td>采购量:</td>
				<td><s:textfield name="caiGouNum" id="caiGouNum"></s:textfield></td>
				
			</tr>
			
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2">
					<a href="javascript:void(0)" onclick="document.forms[0].submit()">
					<img src="${pageContext.request.contextPath}/images/button/add_jinshu.gif" class="img" />
					</a>
				</td>
				
			</tr>
			
		</table>
	</s:form>
	
	<div class="imgdiv">
		<img id="tupian" src="../bookImgs/<s:property value='img'></s:property>" width="140px" height="200px"/>
	</div>
</body>
</html>
