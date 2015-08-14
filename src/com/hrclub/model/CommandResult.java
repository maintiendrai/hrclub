package com.hrclub.model;

public class CommandResult {
  private String resultPage;
  private boolean isDirectly;
  private long usedtime=0;
  public CommandResult() {
  }

  public long getUsedtime() {
	return usedtime;
}

public void setUsedtime(long usedtime) {
	this.usedtime = usedtime;
}

public void setResultPage(String resultPage) {
    this.resultPage = resultPage;
  }

  public void setIsDirectly(boolean isDirectly) {
    this.isDirectly = isDirectly;
  }

  public String getResultPage() {
    return resultPage;
  }

  public boolean isIsDirectly() {
    return isDirectly;
  }
}
