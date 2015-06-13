package org.lucene.index;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.NumericField;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexWriter;
import org.lucene.utils.IndexUtil;
import org.lucene.utils.QueryUtils;

public class GenerateIndex {

	public static String path = "d:/";

	public void index(boolean isEmpty) {
		IndexWriter writer = IndexUtil.getWriter();
		File filepath = new File(path);
		if (!filepath.exists()) {
			filepath.mkdirs();
		}
		if (isEmpty) {
			QueryUtils.empty(writer);
		}
		iterator(writer, filepath);
		try {
			writer.close();
		} catch (CorruptIndexException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void iterator(IndexWriter writer, File filepath) {
		if (filepath.isDirectory()) {
			File[] files = filepath.listFiles();
			for (File file : files) {
				if (!file.isDirectory()) {
					generate(writer, file);
				} else {
					iterator(writer, file);
				}
			}
		}
	}

	private void generate(IndexWriter writer, File file) {
		try {
			Document document = new Document();
			// 文件的内容
			document.add(new Field("content", new FileReader(file)));
			// 文件名称
			String name = file.getName();
			document.add(new Field("filename", name.indexOf(".") != -1 ? name
					.substring(0, name.lastIndexOf(".")) : "文件",
					Field.Store.YES, Field.Index.ANALYZED));
			// 文件的类型
			String type = name.substring(name.lastIndexOf(".") + 1);
			document.add(new Field("type", type, Field.Store.YES,
					Field.Index.ANALYZED));
			// 文件的大小
			document.add(new NumericField("size", Field.Store.YES, true)
					.setLongValue(file.length()));
			// 文件的最后修改日期
			document.add(new NumericField("createdate", Field.Store.YES, true)
					.setLongValue(file.lastModified()));
			// 文件的路径
			document.add(new Field("path", file.getAbsolutePath(),
					Field.Store.YES, Field.Index.ANALYZED));
			// 文档的属性
			StringBuilder attribute = new StringBuilder();
			if (file.canRead()) {
				attribute.append("r");
			}
			if (file.canWrite()) {
				attribute.append("w");
			}
			if (file.canExecute()) {
				attribute.append("x");
			}
			document.add(new Field("attribute", attribute.toString(),
					Field.Store.YES, Field.Index.ANALYZED));
			writer.addDocument(document);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (CorruptIndexException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
