package org.lucene.utils;

import java.io.File;
import java.io.IOException;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.store.LockObtainFailedException;
import org.apache.lucene.util.Version;

public class IndexUtil {

	private static IndexReader reader = null;
	private static IndexWriter writer = null;
	private static Directory directory = null;
	private static String path = "c:/lucene/index";

	/**
	 * 设置directory
	 * 
	 * @param path
	 *            directory路径
	 */
	public static void setDirectoryPath(String path) {
		IndexUtil.path = path;
	}

	/**
	 * 获取directory
	 * 
	 * @return
	 */
	public static Directory getDirectory() {
		try {
			File file = new File(path);
			if (!file.exists()) {
				file.mkdirs();
			}
			directory = FSDirectory.open(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return directory;
	}

	/**
	 * 获取reader
	 * 
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static IndexReader getReader() {
		try {
			if (reader == null) {
				reader = IndexReader.open(getDirectory(), false);
			} else {
				IndexReader indexReader = IndexReader.openIfChanged(reader,
						false);
				if (indexReader != null) {
					reader.close();
					reader = indexReader;
				}
			}
		} catch (CorruptIndexException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return reader;
	}

	/**
	 * 获取 indexwriter
	 * 
	 * @return
	 */
	public static IndexWriter getWriter() {
		try {
			if (writer == null) {
				IndexWriterConfig config = new IndexWriterConfig(
						Version.LUCENE_35, new StandardAnalyzer(
								Version.LUCENE_35));
				return new IndexWriter(getDirectory(), config);
			}
		} catch (CorruptIndexException e) {
			e.printStackTrace();
		} catch (LockObtainFailedException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return writer;
	}

	/**
	 * 获取indexSearch
	 * 
	 * @return
	 */
	public static IndexSearcher getIndexSearch() {
		return new IndexSearcher(getReader());
	}
}
