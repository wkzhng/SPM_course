package com.buptsse.spm.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONObject;
import com.buptsse.spm.domain.Code;
import com.buptsse.spm.domain.Course;
import com.buptsse.spm.domain.Schedule;
import com.buptsse.spm.domain.User;
import com.buptsse.spm.service.ICodeService;
import com.buptsse.spm.service.IScheduleService;
import com.buptsse.spm.service.ISelectCourseService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


/**
 * @author BUPT-TC
 * @date 2015年11月17日 下午4:17
 * @description 有关课程处理的action
 * @modify BUPT-TC
 * @modifyDate 
 */
public class CourseAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private static Logger LOG = LoggerFactory.getLogger(CourseAction.class);
	private User user;
	private Course course;
	protected String stdId="";
	protected String classId="";
	protected String name="";
	protected String status="";
	protected String syear="";
	
	private String operateType;	

	@Resource
	private ISelectCourseService selectCourseService;
	
	@Resource
	private ICodeService codeService;
	
	@Resource
	private IScheduleService scheduleService;
	
	 /** 
	  * 分页查询所有课程列表
	 * @return
	 */
	public String listCourse(){
		
		
		int page=Integer.parseInt(ServletActionContext.getRequest().getParameter("page"));
		int rows=Integer.parseInt(ServletActionContext.getRequest().getParameter("rows"));
			
		Map paramMap = new HashMap();
		paramMap.put("studentId", stdId);
		paramMap.put("classId", classId);
		paramMap.put("name", name);
		paramMap.put("status", status);
		paramMap.put("syear", syear);
		
		List<Course> list = selectCourseService.findPage(paramMap,page, rows);
		
		for(Course course:list){
			Code code =  codeService.findCodeName("status", course.getStatus());
			String codeName =code.getCodeName();
			course.setStatus(codeName);
		}

		//查询总条数
		Long total = selectCourseService.count(paramMap);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", total);
		String str=JSONObject.toJSONString(map);
		try {
			ServletActionContext.getResponse().getWriter().write(str);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	 /** 
	  * 分页查询所有课程进度
	 * @return
	 */
	public String listSchedule(){
		
		
		int page=Integer.parseInt(ServletActionContext.getRequest().getParameter("page"));
		int rows=Integer.parseInt(ServletActionContext.getRequest().getParameter("rows"));
			
		Map paramMap = new HashMap();
		paramMap.put("studentId", stdId);
		paramMap.put("classId", classId);
		paramMap.put("name", name);
		paramMap.put("status", "2");
		paramMap.put("syear", syear);
		
		List<Course> list = selectCourseService.findPage(paramMap,page, rows);

		//查询总条数
		Long total = selectCourseService.count(paramMap);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("rows", list);
		map.put("total", total);
		String str=JSONObject.toJSONString(map);
		try {
			ServletActionContext.getResponse().getWriter().write(str);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	
	
	/**
	 * 更新课程信息，可批量更新
	 * @return
	 */
	public String updateCourse(){
		boolean result = false;
		String str = "";
		String[] studentIds  = ServletActionContext.getRequest().getParameterValues("studentIds[]");  
		for (int i = 0; i < studentIds.length; i++) { 
			if("U".equals(operateType)){
				//将未确认的确认
				result = selectCourseService.changeStatus(studentIds[i], 2);
				
				//章节初始化写死
				for(int j = 1; j <= 103; j++){
					Schedule schedule = new Schedule();
				    schedule.setPercent(0);
				    schedule.setUserid(studentIds[i]);
				    schedule.setVideo_step_order(j);
				    int chapterId = 0;
				    if(j >= 1 && j <= 6)
				    	chapterId = 1;
				    else if(j >= 7 && j <= 11)
				    	chapterId = 2;
				    else if(j >= 12 && j <= 21)
				    	chapterId = 3;
				    else if(j >= 22 && j <= 29)
				    	chapterId = 4;
				    else if(j >= 30 && j <= 34)
				    	chapterId = 5;
				    else if(j >= 35 && j <= 46)
				    	chapterId = 6;
				    else if(j >= 47 && j <= 61)
				    	chapterId = 7;
				    else if(j >= 62 && j <= 66)
				    	chapterId = 8;
				    else if(j >= 67 && j <= 71)
				    	chapterId = 9;
				    else if(j >= 72 && j <= 76)
				    	chapterId = 10;
				    else if(j >= 77 && j <= 82)
				    	chapterId = 11;
				    else if(j >= 83 && j <= 84)
				    	chapterId = 12;
				    else if(j >= 85 && j <= 85)
				    	chapterId = 13;
				    else if(j >= 86 && j <= 86)
				    	chapterId = 14;
				    else if(j >= 87 && j <= 93)
				    	chapterId = 15;
				    else if(j >= 94 && j <= 100)
				    	chapterId = 16;
				    else if(j >= 101 && j <= 103)
				    	chapterId = 17;
				    schedule.setChapter_id(chapterId);			      
				    scheduleService.saveOrUpdate(schedule);
				}
				
				if(result){
					str = "确认成功！";
				}else{
					str = "确认失败，请联系管理员！";
				}
			}
			if("C".equals(operateType)){
				//将未确认或者已确认的取消
				result = selectCourseService.changeStatus(studentIds[i], 3);
				if(result){
					str = "取消成功！";
				}else{
					str = "取消失败，请联系管理员！";
				}
			}			
			
			if("D".equals(operateType)){
				//将已确认的删除
				result = selectCourseService.changeStatus(studentIds[i], 4);
				if(result){
					str = "删除成功！";
				}else{
					str = "删除失败，请联系管理员！";
				}
			}
			
		}

		String message = JSONObject.toJSONString(str);
		try {
			ServletActionContext.getResponse().getWriter().write(message);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	
		return null;
	}	
	
	

	
	/**
	 * 增加选课信息
	 * @return
	 */
	public String insertCourse(){
		Map<String, Object> map=new HashMap<String, Object>();
		Course courseExit = selectCourseService.findCourse(course.getStudentId());
		if(courseExit!=null){
			map.put("code", "2");
			map.put("message", "学号为"+course.getStudentId()+"的学生已选课成功，请勿重复选课！");			
		}else{
			//初始化状态
			course.setStatus("1");
			boolean flag=false;
			try{
				course.setSchedule("0");
				flag = selectCourseService.insertCourse(course);
			}catch(Exception e){
				e.printStackTrace();
				flag=false;
			}

			if(flag){
				map.put("code", "1");
				map.put("message", "选课成功！");
			}else{
				map.put("code", "2");
				map.put("message", "选课失败，请联系管理员！");
			}			
		}

		String str=JSONObject.toJSONString(map);
		System.out.println("str"+str);
		
		try {
			ServletActionContext.getResponse().getWriter().write(str);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return null;
	}	
	
	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public String getStdId() {
		return stdId;
	}

	public void setStdId(String stdId) {
		this.stdId = stdId;
	}

	
	public String getOperateType() {
		return operateType;
	}

	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getSyear() {
		return syear;
	}


	public void setSyear(String syear) {
		this.syear = syear;
	}

	public ICodeService getCodeService() {
		return codeService;
	}

	public void setCodeService(ICodeService codeService) {
		this.codeService = codeService;
	}
	
	public IScheduleService getScheduleService() {
		return scheduleService;
	}
	
	public void setScheduleService(IScheduleService scheduleService) {
		this.scheduleService = scheduleService;
	}
}
