package com.login;

import java.util.Map;

import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class URLRedirection extends ActionSupport implements SessionAware{

	SessionMap<String, Object>session;
	
	private String url;
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String execute() {
		if(url.equals("logout")){
			session.invalidate();
		}
		return url;
	}

	@Override
	public void setSession(Map<String, Object> sess) {
		this.session=(SessionMap<String, Object>) sess;
	}
	
}
