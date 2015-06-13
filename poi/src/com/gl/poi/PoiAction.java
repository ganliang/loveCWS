package com.gl.poi;

import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gl.util.ExcelFileGenerator;

@WebServlet("/poi")
public class PoiAction extends HttpServlet implements Serializable {

	private static final long serialVersionUID = 7545438373796436035L;

	@Override
	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			ArrayList<String> fieldName = new ArrayList<String>();
			fieldName.add("用户名");
			fieldName.add("性别");
			fieldName.add("年龄");
			fieldName.add("性格");
			fieldName.add("爱好");
			fieldName.add("生日");
			ArrayList<ArrayList<String>> fieldData = new ArrayList<ArrayList<String>>();
			for (int i = 0; i < 50000; i++) {
				ArrayList<String> list = new ArrayList<String>();
				list.add("user" + i);
				list.add("sex" + i);
				list.add("age" + i);
				list.add("seq" + i);
				list.add("likes" + i);
				list.add("birthday" + i);
				fieldData.add(list);
			}

			ExcelFileGenerator excelFileGenerator = new ExcelFileGenerator(
					fieldName, fieldData);
			response.reset();
			OutputStream os = response.getOutputStream();

			// 文件下载（添加的配置）
			response.setContentType("application/vnd.ms-excel");
			String filename = "用户报表（"
					+ new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())
					+ "）";
			filename = new String(filename.getBytes("gbk"), "iso-8859-1");
			response.setHeader("Content-disposition", "attachment;filename="
					+ filename + ".xls");
			response.setBufferSize(1024);

			excelFileGenerator.expordExcel(os);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
