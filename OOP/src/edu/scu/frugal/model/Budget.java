package edu.scu.frugal.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.google.common.base.Objects;

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
	@Column
	int actualAmount;

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
		return projectedAmount;
	}

	public void setProjectedAmount(int projectedAmount) {
		this.projectedAmount = projectedAmount;
	}

	public String getProjectedAmountStr() {
		return "" + projectedAmount;
	}

	public void setProjectedAmountStr(String projectedAmountStr) {
		try {
			this.projectedAmount = Integer.parseInt(projectedAmountStr);
		} catch (Exception e) {
			System.err.println("invalid projected amount " + projectedAmountStr);
		}
	}

	public int getActualAmount() {
		return actualAmount;
	}

	public void setActualAmount(int actualAmount) {
		this.actualAmount = actualAmount;
	}

	public String getActualAmountStr() {
		return "" + actualAmount;
	}

	public void setActualAmountStr(String actualAmountStr) {
		try {
			this.actualAmount = Integer.parseInt(actualAmountStr);
		} catch (Exception e) {
			System.err.println("invalid actual amount " + actualAmountStr);
		}
	}

	@Override
	public String toString() {
		return Objects.toStringHelper(this).add("id", id).add("projectId", this.idProject)
				.add("projected", this.projectedAmount).add("actual", this.actualAmount).toString();
	}

}
