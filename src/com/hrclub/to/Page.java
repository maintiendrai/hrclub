package com.hrclub.to;

import java.util.*;

public class Page {
  private int pageNum;
  private int pageLength;
  private int pageCount;
  private List objects;
  private int recordNum;

  public Page() {
    pageLength = 15;
  }  

  public void setData(List objs) {
    this.objects = objs;
    if (objs == null) {
      this.setPageCount(0);
      this.setRecordNum(0);
    }

  }

  public List getData() {
    return this.objects;
  }

  public int getPageCount() {
    return pageCount;
  }

  private void setPageCount(int pageCount) {
    this.pageCount = pageCount;
  }

  public int getPageNum() {
    return pageNum;
  }

  public void setPageNum(int pageNum) {
    this.pageNum = pageNum;
  }

  public int getPageLength() {
    return pageLength;
  }

  public void setPageLength(int pageLength) {
    if (pageLength > 0) {
      this.pageLength = pageLength;
    }
  }

  public int getRecordNum() {
    return recordNum;
  }

  public void setRecordNum(int recordNum) {
    this.recordNum = recordNum;
    if (recordNum == 0) {
      this.setPageCount(0);
    }
    else if (recordNum % pageLength == 0) {
      this.setPageCount(recordNum / pageLength);
    }
    else {
      this.setPageCount(recordNum / pageLength + 1);
    }

  }

}
