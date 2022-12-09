package com.ezdev.sfy.mypage;

public class SearchCriteria extends Criteria {
   private String msearchType = "";
   private String mkeyword= "";

   
   public String getMsearchType() {
	return msearchType;
}
public void setMsearchType(String msearchType) {
	this.msearchType = msearchType;
}
public String getMkeyword() {
	return mkeyword;
}
public void setMkeyword(String mkeyword) {
	this.mkeyword = mkeyword;
}
   
   
}
