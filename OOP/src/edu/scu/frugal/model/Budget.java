package edu.scu.frugal.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity(name = "Budget")
public class Budget implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "IdBudget")
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	int id;
	@Column
	String description;
	@Column
	int idProject;
	@Column
	int projectedAmount;
	@Transient
	String projectedAmountStr;
	@Column
	int actualAmount;
	@Transient
	String actualAmountStr;

	public Budget() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getIdProject() {
		return idProject;
	}

	public void setIdProject(int idProject) {
		this.idProject = idProject;
	}

	public int getProjectedAmount() {
		this.projectedAmountStr = "" + projectedAmount;
		return projectedAmount;
	}

	public void setProjectedAmount(int projectedAmount) {
		this.projectedAmount = projectedAmount;
	}

	public String getProjectedAmountStr() {
		return projectedAmountStr;
	}

	public void setProjectedAmountStr(String projectedAmountStr) {
		this.projectedAmountStr = projectedAmountStr;
		try {
			this.projectedAmount = Integer.parseInt(projectedAmountStr);
		} catch (Exception e) {
			System.err.println("invalid projected amount " + projectedAmountStr);
		}
	}

	public int getActualAmount() {
		this.actualAmountStr = "" + this.actualAmount;
		return actualAmount;
	}

	public void setActualAmount(int actualAmount) {
		this.actualAmount = actualAmount;
	}

	public String getActualAmountStr() {
		return actualAmountStr;
	}

	public void setActualAmountStr(String actualAmountStr) {
		this.actualAmountStr = actualAmountStr;
		try {
			this.actualAmount = Integer.parseInt(actualAmountStr);
		} catch (Exception e) {
			System.err.println("invalid actual amount " + actualAmountStr);
		}
	}
}
