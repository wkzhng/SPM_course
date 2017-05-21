package com.buptsse.spm.service;


import java.util.List;
import java.util.Map;

import com.buptsse.spm.domain.Course;


/**
 * @author BUPT-TC 
 * @date 2015骞�11鏈�01鏃� 涓嬪崍3:47
 * @description 閫夎鐨剆ervice灞傛帴鍙ｅ畾涔� 
 * @modify BUPT-TC 
 * @modifyDate 
 */
public interface ISelectCourseService {
		public Course findCourse(String studentId);
		public boolean insertCourse(Course course);
		public boolean savaCourse(Course course);
		public boolean deleteCourse(String studentId);
		public boolean updateCourse(Course course);
		public List<Course> findAllCourse();
		public List findPage(Map param,Integer page,Integer rows);
		public boolean changeStatus(String studnetId,int newStatus);
		public boolean changeSchedule(String studentId, int newSchedule);
		public Long count(Map param );
		public boolean saveOrUpdate(Course course);
}
