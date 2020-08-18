package common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;


import org.jsoup.Jsoup;

public class ScrapingTaxTypeFromNts { 
	
	public ScrapingTaxTypeFromNts() { } 
	
	public List<Map<String, String>> selectTaxTypeFromNts(List<String> listBusinessRegNo) { 
		List<Map<String, String>> list = new ArrayList<>();
			for (String businessRegNo : listBusinessRegNo) { 
				list.add(getTaxTypeFromNts(businessRegNo)); } return list; 
				} 
	
	
	public Map<String, String> getTaxTypeFromNts(String businessRegNo) { 

			String txprDscmNo = businessRegNo.replace("-", ""); 

			String dongCode = txprDscmNo.substring(3, 5);
			String url = "https://teht.hometax.go.kr/wqAction.do?actionId=ATTABZAA001R08&screenId=UTEABAAA13&popupYn=false&realScreenId=";
			Map<String, String> headers = new HashMap<>(); 
			headers.put("Accept", "application/xml; charset=UTF-8"); 
			headers.put("Accept-Encoding", "gzip, deflate, br");
			headers.put("Accept-Language", "ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7");
			headers.put("Connection", "keep-alive"); 
			headers.put("Content-Length", "257"); 
			headers.put("Content-Type", "application/xml; charset=UTF-8"); 
			headers.put("Host", "teht.hometax.go.kr"); 
			headers.put("Origin", "https://teht.hometax.go.kr"); 
			headers.put("Referer", "https://teht.hometax.go.kr/websquare/websquare.html?w2xPath=/ui/ab/a/a/UTEABAAA13.xml"); 
			headers.put("Sec-Fetch-Mode", "cors"); 
			headers.put("Sec-Fetch-Site", "same-origin"); 
			headers.put("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36");
			
			final String CRLF = "\n"; 
			
			StringBuffer sb = new StringBuffer(); 
			sb.append("<map id=\"ATTABZAA001R08\">" + CRLF); 
			sb.append(" <pubcUserNo/>" + CRLF); 
			sb.append(" <mobYn>N</mobYn>" + CRLF); 
			sb.append(" <inqrTrgtClCd>1</inqrTrgtClCd>" + CRLF); 
			sb.append(" <txprDscmNo>" + txprDscmNo + "</txprDscmNo>" + CRLF); 
			sb.append(" <dongCode>" + dongCode + "</dongCode>" + CRLF); 
			sb.append(" <psbSearch>Y</psbSearch>" + CRLF); 
			sb.append(" <map id=\"userReqInfoVO\"/>" + CRLF); 
			sb.append("</map>" + CRLF); String body = sb.toString(); 
			
			Map<String, String> map = new HashMap<>();
			
			try { 
				Response res = Jsoup.connect(url) .headers(headers) 
						.requestBody(body) .timeout(3000) .method(Method.POST) .execute(); 
				System.out.println(res.body());
				
			org.dom4j.Document document = DocumentHelper.parseText(res.body()); 
			//System.out.println( document.valueOf("//map/trtCntn"));
			String trtCntn = document.valueOf("//map/trtCntn") + ""; 
				//if (logger.isDebugEnabled()) { 
					System.out.println("trtCntn[" + trtCntn + "]"); 
					//} 
				map.put(businessRegNo, trtCntn); 
			} catch (IOException e) { 
				System.out.println("Jsoup 오류 : "+ e); 
			} catch (DocumentException e) { 
				System.out.println("Document parse 오류 : " + e);
				} 
			return map;
			} 
	}