package org.lucene.utils;

import java.io.IOException;

import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.StaleReaderException;
import org.apache.lucene.store.LockObtainFailedException;

public class QueryUtils {

	/**
	 * 清空writer
	 * 
	 * @param writer
	 */
	public static void empty(IndexWriter writer) {
		try {
			writer.deleteAll();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 清空writer
	 */
	public static void empty() {
		try {
			IndexWriter writer = IndexUtil.getWriter();
			writer.deleteAll();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 恢复
	 */
	public static void rollback() {
		IndexReader reader = IndexUtil.getReader();
		try {
			reader.undeleteAll();
		} catch (StaleReaderException e) {
			e.printStackTrace();
		} catch (CorruptIndexException e) {
			e.printStackTrace();
		} catch (LockObtainFailedException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public static void print(IndexReader reader) {
		int maxDoc = reader.maxDoc();
		int numDocs = reader.numDocs();
		int deletedDocs = reader.numDeletedDocs();

		System.out.println("maxDoc:[" + maxDoc + "] numDocs:[" + numDocs
				+ "] deletedDocs:[" + deletedDocs + "]");
	}
}
