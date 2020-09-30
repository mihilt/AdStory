package common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MvcFileRenamePolicy implements FileRenamePolicy {
	/**
	 * abc.txt 파일 저장시
	 * yyyyMMdd_HHmmssSSS_123.txt
	 */
	@Override
	public File rename(File oldFile) {

		File newFile = null;
		do {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
			int rnd = (int)(Math.random()*1000);//0~999
			
			//확장자처리
			String oldName = oldFile.getName();
			String ext = "";
			int dot = oldName.lastIndexOf(".");
			if(dot > -1) {
				ext = oldName.substring(dot);
			}
			String newName = sdf.format(new Date())+"_"+rnd+ext;
			
			//이 경로에 이 이름으로 파일을 만들어주세요
			newFile = new File(oldFile.getParent(),newName);
			//후에 다시한번 겹치는지 createNewFile로 확인.
		}while(!createNewFile(newFile));
		return newFile;
	}
	private boolean createNewFile(File f) {
	    try {
	      return f.createNewFile();
	    }
	    catch (IOException ignored) {
	      return false;
	    }
	  }

}
