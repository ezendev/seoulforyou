package com.ezdev.sfy.mypage;

public class Criteria {
    private int page; //페이지 번호
    private int perPageNum; //게시물 개수
    private int rowStart;
    private int rowEnd;
    
    public Criteria() {
   	 this.page = 1;
   	 this.perPageNum = 5;
    }
    public int getPageStart() {
    	return (this.page-1) * perPageNum;
    }

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <= 0 ) {
		
		this.page = 1;
	}else {
		this.page = page;
	  }
   }
	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int PageCount) {
		int count = this.perPageNum;
		if(PageCount != count) {
			this.perPageNum = count;
		}else {
			this.perPageNum = PageCount;
		}
	}

	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}   
}
