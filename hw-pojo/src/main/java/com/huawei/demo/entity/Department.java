package com.huawei.demo.entity;

import java.io.Serializable;

public class Department implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column department.departmentId
     *
     * @mbg.generated Mon Dec 25 14:25:05 CST 2017
     */
    private Integer departmentid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column department.parentId
     *
     * @mbg.generated Mon Dec 25 14:25:05 CST 2017
     */
    private Integer parentid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column department.name
     *
     * @mbg.generated Mon Dec 25 14:25:05 CST 2017
     */
    private String name;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column department.count
     *
     * @mbg.generated Mon Dec 25 14:25:05 CST 2017
     */
    private Integer count;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column department.status
     *
     * @mbg.generated Mon Dec 25 14:25:05 CST 2017
     */
    private String status;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column department.departmentId
     *
     * @return the value of department.departmentId
     *
     * @mbg.generated Mon Dec 25 14:25:05 CST 2017
     */
    public Integer getDepartmentid() {
        return departmentid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column department.departmentId
     *
     * @param departmentid the value for department.departmentId
     *
     * @mbg.generated Mon Dec 25 14:25:05 CST 2017
     */
    public void setDepartmentid(Integer departmentid) {
        this.departmentid = departmentid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column department.parentId
     *
     * @return the value of department.parentId
     *
     * @mbg.generated Mon Dec 25 14:25:05 CST 2017
     */
    public Integer getParentid() {
        return parentid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column department.parentId
     *
     * @param parentid the value for department.parentId
     *
     * @mbg.generated Mon Dec 25 14:25:05 CST 2017
     */
    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column department.name
     *
     * @return the value of department.name
     *
     * @mbg.generated Mon Dec 25 14:25:05 CST 2017
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column department.name
     *
     * @param name the value for department.name
     *
     * @mbg.generated Mon Dec 25 14:25:05 CST 2017
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column department.count
     *
     * @return the value of department.count
     *
     * @mbg.generated Mon Dec 25 14:25:05 CST 2017
     */
    public Integer getCount() {
        return count;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column department.count
     *
     * @param count the value for department.count
     *
     * @mbg.generated Mon Dec 25 14:25:05 CST 2017
     */
    public void setCount(Integer count) {
        this.count = count;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column department.status
     *
     * @return the value of department.status
     *
     * @mbg.generated Mon Dec 25 14:25:05 CST 2017
     */
    public String getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column department.status
     *
     * @param status the value for department.status
     *
     * @mbg.generated Mon Dec 25 14:25:05 CST 2017
     */
    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}