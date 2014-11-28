package edu.scu.frugal.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.google.common.base.Strings;

public class QueryParams {

	String name;
	String desc;
	String startDateStr;
	String endDateStr;
	String user;
	boolean isTask;

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public boolean isTask() {
		return isTask;
	}

	public void setTask(boolean isTask) {
		this.isTask = isTask;
	}

	public Date getStartDate() {
		if (!Strings.isNullOrEmpty(startDateStr)) {
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			try {
				return formatter.parse(this.startDateStr);
			} catch (ParseException e) {
				System.out.printf("parsing error for startDate, %s", startDateStr);
				Calendar start = Calendar.getInstance();
				start.set(1970, 0, 1);
				return start.getTime();
			}
		}
		return null;
	}

	public Date getEndDate() {
		if (!Strings.isNullOrEmpty(endDateStr)) {
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			try {
				return formatter.parse(this.endDateStr);
			} catch (ParseException e) {
				System.out.printf("parsing error for endDate, %s", endDateStr);
				Calendar end = Calendar.getInstance();
				end.set(2099, 11, 31);
				return end.getTime();
			}
		}
		return null;
	}

	public String getStartDateStr() {
		return startDateStr;
	}

	public void setStartDateStr(String startDateStr) {
		this.startDateStr = startDateStr;
	}

	public String getEndDateStr() {
		return endDateStr;
	}

	public void setEndDateStr(String endDateStr) {
		this.endDateStr = endDateStr;
	}

}
