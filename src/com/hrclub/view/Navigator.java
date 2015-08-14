package com.hrclub.view;

public class Navigator {
	private String name;
	private String url;
	private Navigator next;
	private boolean hasNext;
	public boolean isHasNext() {
		return hasNext;
	}
	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Navigator getNext() {
		return next;
	}
	public void setNext(Navigator next) {
		this.next = next;
		setHasNext(true);
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
