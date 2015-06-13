<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
	function deleteAll() {
		var selectuser = document.getElementsByName("userID");
		var flag = false;
		for (var i = 0; i < selectuser.length; i++) {
			if (selectuser[i].checked) {
				flag = true;
			}
		}
		if (!flag) {
			alert("没有选择执行操作的用户！不能执行该操作");
			return false;
		} else {
			var confirmflag = window.confirm("你确定执行批量删除吗？");
			if (!confirmflag) {
				return false;
			} else {
				document.Form2.action = "${pageContext.request.contextPath }/system/elecUserAction_delete.do";
				document.Form2.submit();
				return true;
			}
		}
	}
	//用户:全部选中/全部不选中
	function checkAllUser(user) {
		var selectuser = document.getElementsByName("userID");
		for (var i = 0; i < selectuser.length; i++) {
			selectuser[i].checked = user.checked;
		}
	}
	function exportExcel() {
		//姓名
		var userName = document.getElementById("userName").value;
		userName = encodeURI(userName, "UTF-8");
		userName = encodeURI(userName, "UTF-8");
		//所属单位
		var jctID = document.getElementById("jctID").value;
		//入职开始时间
		var onDutyDateBegin = document.getElementById("onDutyDateBegin").value;
		//入职结束时间
		var onDutyDateEnd = document.getElementById("onDutyDateEnd").value;
		openWindow(
				'${pageContext.request.contextPath }/system/elecUserAction_exportExcel.do?userName='
						+ userName
						+ '&jctID='
						+ jctID
						+ '&onDutyDateBegin='
						+ onDutyDateBegin + '&onDutyDateEnd' + onDutyDateEnd,
				'700', '400')
	}
</script>

<HTML>
<HEAD>
<title>用户管理</title>
<LINK href="${pageContext.request.contextPath }/css/Style.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/function.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/pub.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/validate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/page.js"></script>
</HEAD>

<body>
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath }/system/elecUserAction_home.do"
		method="post" style="margin: 0px;">
		<!-- 当前第几页 -->
		<s:hidden name="pageNO"></s:hidden>
		<!-- 表示：如果initPage==null：跳转到userIndex.jsp,如果initPage==1：表示跳转到userList.jsp -->
		<s:hidden name="initPage" value="1"></s:hidden>
		<table cellspacing="1" cellpadding="0" width="90%" align="center"
			bgcolor="#f5fafe" border="0">
			<TR height=10>
				<td></td>
			</TR>
			<tr>
				<td class="ta_01" colspan="4" align="center"
					background="../images/b-info.gif"><font face="宋体" size="2"><strong>用户信息管理</strong></font>
				</td>

			</tr>
			<tr>
				<td class="ta_01" align="center" bgcolor="#f5fafe" height="22">
					姓名：</td>
				<td class="ta_01"><s:textfield name="userName" size="21"
						id="userName"></s:textfield></td>
				<td class="ta_01" align="center" bgcolor="#f5fafe" height="22">
					所属单位：</td>
				<td class="ta_01"><s:select list="#request.jctlist"
						listKey="ddlCode" listValue="ddlName" headerKey=""
						headerValue="请选择" name="jctID" id="jctID" cssstyle="width:155px"></s:select>
				</td>
			</tr>
			<tr>
				<td class="ta_01" align="center" bgcolor="#f5fafe" height="22">
					入职时间：</td>
				<td class="ta_01" colspan="3"><s:date name="onDutyDateBegin"
						format="yyyy-MM-dd" var="begin" /> <s:date name="onDutyDateEnd"
						format="yyyy-MM-dd" var="end" /> <s:textfield value="%{begin}"
						name="onDutyDateBegin" id="onDutyDateBegin" maxlength="50"
						size="20" onclick="WdatePicker()"></s:textfield> ~ <s:textfield
						value="%{end}" name="onDutyDateEnd" id="onDutyDateEnd"
						maxlength="50" size="20" onclick="WdatePicker()"></s:textfield></td>
			</tr>

		</table>
	</form>

	<form id="Form2" name="Form2" action="/system/userAction_main.do"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="90%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<TR height=10>
					<td></td>
				</TR>
				<tr>
					<td>
						<TABLE style="WIDTH: 105px; HEIGHT: 20px" border="0">
							<TR>
								<TD align="center"
									background="${pageContext.request.contextPath }/images/cotNavGround.gif"><img
									src="${pageContext.request.contextPath }/images/yin.gif"
									width="15"></TD>
								<TD class="DropShadow"
									background="${pageContext.request.contextPath }/images/cotNavGround.gif">用户列表</TD>
							</TR>
						</TABLE>
					</td>
					<td class="ta_01" align="right"><input
						style="font-size: 12px; color: black;" id="BT_Add" type="button"
						value="查询" name="BT_find"
						onclick="gotoquery('${pageContext.request.contextPath }/system/elecUserAction_home.do')">&nbsp;&nbsp;
						<input style="font-size: 12px; color: black;" id="BT_Add"
						type="button" value="添加用户" name="BT_Add"
						onclick="openWindow('${pageContext.request.contextPath }/system/elecUserAction_add.do','700','500')">&nbsp;&nbsp;
						<input style="font-size: 12px; color: black;" id="BT_Delete"
						type="button" value="批量删除" name="BT_Delete"
						onclick="return deleteAll()">&nbsp;&nbsp; <input
						style="font-size: 12px; color: black;" id="BT_Export"
						type="button" value="导出设置" name="BT_Export"
						onclick="openWindow('${pageContext.request.contextPath }/system/elecExportFieldsAction_setExportExcel.do?belongTo=5-1','700','400')">&nbsp;&nbsp;
						<input style="font-size: 12px; color: black;" id="BT_Export"
						type="button" value="导出" name="BT_Export" onclick="exportExcel()">&nbsp;&nbsp;







					
					<td class="ta_01" align="right"><input
						style="font-size: 12px; color: black;" id="BT_Import"
						type="button" value="导入" name="BT_Import"
						onclick="openWindow('${pageContext.request.contextPath }/system/elecUserAction_importPage.do','600','400')">
					<td class="ta_01" align="right"><input
						style="font-size: 12px; color: black;" id="BT_chart" type="button"
						value="图形" name="BT_chart"
						onclick="openWindow('${pageContext.request.contextPath }/system/elecUserAction_report.do','600','400')">
					</td>
					</td>

					</td>
				</tr>

				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe" colspan="2">


						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

								<td align="center" width="5%" height=22
									background="${pageContext.request.contextPath }/images/tablehead.jpg"><input
									type="checkbox" name="selectUserAll"
									onclick="checkAllUser(this)"></td>
								<td align="center" width="15%" height=22
									background="${pageContext.request.contextPath }/images/tablehead.jpg">登录名</td>
								<td align="center" width="15%" height=22
									background="${pageContext.request.contextPath }/images/tablehead.jpg">用户姓名</td>
								<td align="center" width="7%" height=22
									background="${pageContext.request.contextPath }/images/tablehead.jpg">性别</td>
								<td align="center" width="15%" height=22
									background="${pageContext.request.contextPath }/images/tablehead.jpg">联系电话</td>
								<td align="center" width="15%" height=22
									background="${pageContext.request.contextPath }/images/tablehead.jpg">入职时间</td>
								<td align="center" width="8%" height=22
									background="${pageContext.request.contextPath }/images/tablehead.jpg">职位</td>
								<td width="10%" align="center" height=22
									background="${pageContext.request.contextPath }/images/tablehead.jpg">编辑</td>
								<td width="10%" align="center" height=22
									background="${pageContext.request.contextPath }/images/tablehead.jpg">查看</td>
							</tr>

							<s:if test="#request.userlist!=null&&#request.userlist.size()>0">
								<s:iterator value="#request.userlist">
									<tr onmouseover="this.style.backgroundColor = 'white'"
										onmouseout="this.style.backgroundColor = '#F5FAFE';">
										<td style="HEIGHT: 22px" align="center" width="5%"><input
											type="checkbox" name="userID" id="userID"
											value="<s:property value="userID"/>"></td>
										<td style="HEIGHT: 22px" align="center" width="15%"><s:property
												value="logonName" /></td>
										<td style="HEIGHT: 22px" align="center" width="15%"><s:property
												value="userName" /></td>
										<td style="HEIGHT: 22px" align="center" width="7%"><s:property
												value="sexID" /></td>
										<td style="HEIGHT: 22px" align="center" width="15%"><s:property
												value="mobile" /></td>
										<td style="HEIGHT: 22px" align="center" width="15%"><s:date
												name="onDutyDate" format="yyyy-MM-dd" /></td>
										<td style="HEIGHT: 22px" align="center" width="8%"><s:property
												value="postID" /></td>

										<td align="center" style="HEIGHT: 22px" align="center"
											width="10%"><a href="#"
											onclick="openWindow('${pageContext.request.contextPath }/system/elecUserAction_edit.do?userID=<s:property value="userID"/>','700','400');">
												<img
												src="${pageContext.request.contextPath }/images/edit.gif"
												border="0" style="CURSOR: hand">
										</a></td>

										<td align="center" style="HEIGHT: 22px" align="center"
											width="10%"><a href="#"
											onclick="openWindow('${pageContext.request.contextPath }/system/elecUserAction_edit.do?userID=<s:property value="userID"/>&viewflag=1','700','400');">
												<img
												src="${pageContext.request.contextPath }/images/button_view.gif"
												width="20" height="18" border="0" style="CURSOR: hand">
										</a></td>
									</tr>
								</s:iterator>
							</s:if>

						</table> <%@include file="/pageUI.jsp"%>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>




</body>
</HTML>
