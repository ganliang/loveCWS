<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<table cellpadding="0" cellspacing="0" border="0" width="100%"
	bgcolor="#f5fafe">
	<TR>
		<TD align="center"
			background="${pageContext.request.contextPath }/images/cotNavGround.gif"
			width="25"><img
			src="${pageContext.request.contextPath }/images/yin.gif" width="15"></TD>
		<TD class="DropShadow"
			background="${pageContext.request.contextPath }/images/cotNavGround.gif"
			width="100">设备计划信息列表</TD>
		<td>&nbsp;&nbsp;<input type="button" height=20
			style="font-size: 12px; color: black;" name="chkall" value="全选"
			onClick="CheckAll(this.form)"> <input type="button" height=20
			style="font-size: 12px; color: black;" name="chkOthers" value="取消"
			onClick="CheckOthers(this.form)">


		</td>
		<td class="ta_01" align="right"><input name="BT_Search"
			type="button" style="font-size: 12px; color: black;" id="BT_Search"
			value="查询" onclick="searchplan()" /> <input name="BT_Add"
			type="button" style="font-size: 12px; color: black;" id="BT_Add"
			onClick="openWindow('equapment/elecDevPlanAction_add.do',800,450);"
			value="添加" /> <input style="font-size: 12px; color: black;"
			id="BT_Export" type="button" value="导出设置" name="BT_Export"
			onclick="openWindow('${pageContext.request.contextPath }/system/elecExportFieldsAction_setExportExcel.do?belongTo=1-3','700','400')">&nbsp;&nbsp;
			<input style="font-size: 12px; color: black;" id="BT_Export"
			type="button" value="导出" name="BT_Export" onclick="exportExcel()">&nbsp;&nbsp;
			<input name="BT_import" type="button"
			style="font-size: 12px; color: black;" id="BT_import"
			onClick="openWindow('equapment/elecDevPlanAction_importPage.do','600','450');"
			value="导入"> <input type="button" name="chkall" height=20
			style="font-size: 12px; color: black;" value="购置" onclick="jsDPToD()">
			<input type="button" name="chkall2" height=20
			style="font-size: 12px; color: black;" value="计划顺延"
			onclick="jsPlanNext()"> <input
			style="font-size: 12px; color: black;" id="BT_chart" type="button"
			value="图形" name="BT_chart"
			onclick="openWindow('${pageContext.request.contextPath }/equapment/elecDevPlanAction_report.do','600','400')"></td>
	</TR>
</table>

<table cellpadding="0" cellspacing="0" border="0" width="100%"
	bgcolor="#f5fafe">
	<tr>
		<td class="ta_01" align="center" bgcolor="#f5fafe">
			<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray"
				border="1" id="DataGrid1"
				style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
				<tr
					style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
					<td align="center" width="5%" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">序号</td>
					<td align="center" width="22%" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">名称</td>
					<td align="center" width="9%" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">数量</td>
					<td align="center" width="9%" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">金额</td>
					<td align="center" width="14%" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">规格型号</td>
					<td align="center" width="9%" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">用途</td>
					<td align="center" width="11%" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">使用单位</td>

					<td width="9%" align="center" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">是否购置</td>


					<td width="5%" align="center" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">编辑</td>
					<td width="5%" align="center" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">删除</td>

				</tr>

				<s:iterator value="#request.devPlanList" status="item">
					<tr onMouseOver="this.style.backgroundColor = 'white'"
						onMouseOut="this.style.backgroundColor = '#F5FAFE';">
						<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="5%"><s:property
								value="#item.count" /></td>
						<td align="center" width="22%"><a href="javascript:;"
							onClick="openWindow('equapment/elecDevPlanAction_view.do?devPlanID=<s:property value="devPlanID"/>',800,450,'设备详细信息');"
							class="cl_01"><s:property value="devName" /></a></td>
						<td align="center" width="9%"><s:property value="quality" /></td>
						<td align="center" width="9%"><s:property value="devExpense" /></td>
						<td align="center" width="14%"><s:property value="specType" /></td>
						<td align="center" width="9%"><s:property value="useness" /></td>
						<td align="center" width="11%" style="HEIGHT: 22px"><s:property
								value="useUnit" /></td>

						<td align="center"><input type="checkbox" id="devPlanId"
							name="devPlanID" value="<s:property value='devPlanID'/>" /></td>

						<td align="center"><a href="javascript:;"
							onClick="openWindow('equapment/elecDevPlanAction_edit.do?devPlanID=<s:property value='devPlanID'/>',800,450);">
								<IMG src="${pageContext.request.contextPath }/images/edit.gif"
								style="CURSOR: hand" border="0">
						</a></td>
						<td align="center"><a
							href="javascript:Pub.submitActionWithForm('Form1','equapment/elecDevPlanAction_delete.do?devPlanID=<s:property value='devPlanID'/>','F1')"
							onclick="returnMethod()"> <IMG
								src="${pageContext.request.contextPath }/images/delete.gif"
								style="CURSOR: hand" border="0"></a></td>
					</tr>
				</s:iterator>


			</table>
		</td>
	</tr>


	<tr>
		<td width="100%" height="1" colspan="2">
			<table border="0" width="100%" cellspacing="0" cellpadding="0">
				<s:if test="#request.page!=null">
					<tr>
						<td width="15%" align="left">总记录数：<s:property
								value="%{#request.page.totalResult}" />条
						</td>
						<td width="14%" align="right"></td>
						<s:if test="#request.page.firstPage">
							<td width="8%" align="center">首页&nbsp;&nbsp;|</td>
							<td width="10%" align="center">上一页&nbsp;&nbsp;&nbsp;|</td>
						</s:if>
						<s:else>
							<td width="8%" align="center"><u><a href="#"
									onclick="gotopage('equapment/elecDevPlanAction_home.do','start')">首页&nbsp;&nbsp;|</a></u></td>
							<td width="10%" align="center"><u><a href="#"
									onclick="gotopage('equapment/elecDevPlanAction_home.do','prev')">上一页&nbsp;&nbsp;&nbsp;|</a></u></td>
						</s:else>
						<s:if test="#request.page.lastPage">
							<td width="10%" align="center">下一页&nbsp;&nbsp;&nbsp;|</td>
							<td width="8%" align="center">末页</td>
						</s:if>
						<s:else>
							<td width="10%" align="center"><u><a href="#"
									onclick="gotopage('equapment/elecDevPlanAction_home.do','next')">下一页&nbsp;&nbsp;&nbsp;|</a></u></td>
							<td width="8%" align="center"><u><a href="#"
									onclick="gotopage('equapment/elecDevPlanAction_home.do','end')">末页</a></u></td>
						</s:else>
						<td width="6%" align="center">第<s:property
								value="%{#request.page.pageNo}" />页
						</td>
						<td width="6%" align="center">共<s:property
								value="%{#request.page.sumPage}" />页
						</td>
						<td width="21%" align="right">至第<input size="1" type="text"
							name="goPage">页 <u><a href="#"
								onclick="gotopage('equapment/elecDevPlanAction_home.do','go')">确定</a></u></td>

						<td><input type="hidden" name="pageNO"
							value="${page.pageNo }"></td>
						<td><input type="hidden" name="prevpageNO"
							value="${page.pageNo-1 }"></td>
						<td><input type="hidden" name="nextpageNO"
							value="${page.pageNo+1 }"></td>
						<td><input type="hidden" name="sumPage"
							value="${page.sumPage }"></td>
					</tr>
				</s:if>

			</table>
		</td>
	</tr>
</table>
