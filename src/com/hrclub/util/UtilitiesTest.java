package com.hrclub.util;

import static org.junit.Assert.*;

import org.junit.Test;

public class UtilitiesTest {

	
	public void testEncodePassword() {
		String end=Utilities.encodePassword("jamy", "MD5");
		System.out.println(end);
	}

}
