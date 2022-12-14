package com.ezdev.sfy.mypage;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {//페이징을 위한 도메인
	private Criteria Cri;
	private int totalCount; //총 게시물 수
    private int startPage; // 화면에 보이는 첫번째 번호
    private int endPage; // 화면에 보이는 마지막 번호
	private boolean prev; // 이전 버튼
	private boolean next; // 다음 버튼

    private int displayPageNum = 5; // 페이지 번호 총 개수
    
    
    public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public boolean isPrev() {
		return prev;
	}
   	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
    public Criteria getCri() {
		return Cri;
	}
    public void setCri(Criteria Cri) {
        this.Cri = Cri;
    }
    
    public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        calcData();
    }

    private void calcData() {

        endPage = (int) (Math.ceil(Cri.getPage() / (double) displayPageNum) * displayPageNum);
        //getpage => 현재 페이지
        //현재 페이지에서 보이는 페이지 수를 나눈 후 올림 그 후 보이는 페이지 수를 곱한다
        startPage = (endPage - displayPageNum) + 1;
       if(startPage <= 0) startPage = 1;

        //마지막 번호에서 총 개수를 뺌 그 후 +1 하지만 0 혹은 음수일 경우는 1로 지정
        
        int tempEndPage = (int) (Math.ceil(totalCount / (double) Cri.getPerPageNum()));
        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }
        //마지막 페이지번호
        //총 게시글 수 / 게시물 개수(10)
        //만약 화면에 보이는 페이지 숫자가 마지막 페이지 번호보다 크면 그 페이지를 마지막 페이지로 지정
        prev = startPage == 1 ? false : true;
        //1일 경우 이전 버튼을 만들지 않는다
        next = endPage * Cri.getPerPageNum() < totalCount ? true : false;
        //화면에 보이는 마지막 숫자 * 게시물 개수(10) < 총 게시물
        //마지막 페이지일경우 next 버튼을 만들지 않는다
    }   //queryParam으로 필드값과 변수값 설정
    public String makeSearch(int page) {
    	UriComponents uriComponents = 
    			UriComponentsBuilder.newInstance()
    			.queryParam("page", page)
    			.queryParam("perPageNum", Cri.getPerPageNum())
    			.queryParam("msearchType", ((SearchCriteria)Cri).getMsearchType())
    			.queryParam("mkeyword", encoding(((SearchCriteria)Cri).getMkeyword()))
    			.build();
    	return uriComponents.toUriString();
    }
    private String encoding(String mkeyword) {
    	if(mkeyword == null || mkeyword.trim().length() == 0) {
    		return "";
    	}
    	try {
    		return URLEncoder.encode(mkeyword, "UTF-8");
    	}catch(UnsupportedEncodingException e){
    		return "";
    	}
    }
}
