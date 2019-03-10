package controller.utils;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.zip.GZIPOutputStream;

public class ZipUtil {
	public static String compress(String string) throws IOException {
		if (string == null || string.length() == 0) {
			return string;
		}

		ByteArrayOutputStream out = new ByteArrayOutputStream();
		GZIPOutputStream gzip = new GZIPOutputStream(out);
		gzip.write(string.getBytes());
		gzip.close();
		return out.toString("UTF-8");
	}
	
	public static String extract(String bytes) throws IOException {
		
		return "";
	}
}
