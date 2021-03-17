package com.gls.winter.file;

import java.io.File;

// 파일명이 중복이 될 경우 중복이 안되도록 하기 위한 메서드 담고 있는 클래스
public class FileUtil {
	
	// 파일이 존재하는지 알아내는 메서드
	// filename = realpath + fileName
	public static boolean isThere(String fileName) {
		// String을 File 객체로 변환 후 존재 유무 확인
		return convertFile(fileName).exists();
	}
	
	// String을 File로 변환해 주는 메서드
	private static File convertFile(String fileName) {
		
		return new File(fileName);
	}
	
	// 중복된 파일명인 경우 파일명 뒤에 cnt를 붙여 처리하는 메서드
	// filename = realpath + fileName
	// 리턴되는 String은 중복이 아닌 파일명이 된다 
	public static String duplicateProcess(String fileName) {
		// 중복 처리를 위한 카운트 선언
		int cnt = 1;
		String changeFileName = null;
		// 삽입해야 할 위치를 미리 구한다
		// realPath + fileName.ext
		int insertPoint = fileName.lastIndexOf(".");
		// 중복이 되지 않는 파일이름이 나올 때까지 무한 반복
		while(true) {
			// 새로운 파일명 만들기
			// 문자열 처리를 쉽게 해주는 객체로 생성
			StringBuilder sb = new StringBuilder(fileName);
			changeFileName = sb.insert(insertPoint, cnt++).toString();
			// 중복이 되지 않은 파일명이 나오면 리턴한다
			if(!isThere(changeFileName)) {
				return changeFileName;
			}
		}
	}
	
	// Controller 에서 처음 호출되는 부분
	public static String checkDuplicate(String fileName) {
		System.out.println("DEBUG: in checkDuplicate()");
		
		// 만약에 저장하려는 파일명이 폴더에 존재하지 않으면 파일을 그대로 리턴한다
		if(!isThere(fileName)) return fileName;
		// 중복이 되지 않은 파일명이 나오면 리턴한다 
		return duplicateProcess(fileName);
	}
	
	

}
