package org.lucene.test;

import org.junit.Test;
import org.lucene.index.GenerateIndex;
import org.lucene.utils.IndexUtil;
import org.lucene.utils.QueryUtils;

public class IndexTest {

	@Test
	public void index() {
		GenerateIndex index = new GenerateIndex();
		index.index(true);
	}

	@Test
	public void empty() {
		QueryUtils.empty();
	}

	@Test
	public void print() {
		QueryUtils.print(IndexUtil.getReader());
	}
}
