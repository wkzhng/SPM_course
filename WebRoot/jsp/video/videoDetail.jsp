<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>"教育部-IBM精品课程建设项目"软件项目管理课程</title>
		<link href="${ctx}/css/spm.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/thirdParty/videoJs/video-js.css" rel="stylesheet" type="text/css" />		
<script type="text/javascript" src="${ctx}/js/jquery-1.3.2.min1.js"></script>
<script type="text/javascript" src="${ctx}/js/script.js"></script>
<script type="text/javascript" src="${ctx}/js/cufon-yui.js"></script>
<script type="text/javascript" src="${ctx}/js/arial.js"></script>
<script type="text/javascript" src="${ctx}/js/cuf_run.js"></script>
<script type="text/javascript" src="${ctx}/js/float.js"></script>
<script type="text/javascript" src="${ctx}/thirdParty/videoJs/video.js"></script>

<script>
   $(function(){

    function tanchuceng(width,height,tit,url,type,num){
    var winWinth = $(window).width(),winHeight = $(document).height();
    $("body").append("<div class='winbj'></div>");
    $("body").append("<div class='tanChu'><div class='tanChutit'><span class='tanchuTxt'>"+tit+"</span><span class='tanchuClose'>关闭</span></div><div class='vdiv'><video id='example_video_"+num+"' class='video-js vjs-default-skin' controls preload='none' width='750' height='350'><source src='"+url+"' type='"+type+"' /></video></div><div class='quceshi' style='display:none'><a href='javascript:'>已看完</a></div></div>");
    $(".winbj").css({width:winWinth,height:winHeight,background:"#000",position:"absolute",left:"0",top:"0"});
    $(".winbj").fadeTo(0, 0.5);
    var tanchuLeft = $(window).width()/2 - width/2;
    var tanchuTop = $(window).height()/2 - height/2 + $(window).scrollTop();
    $(".tanChu").css({width:width,height:height,border:"3px #ccc solid",left:tanchuLeft,top:tanchuTop,background:"#fff",position:"absolute"});
    $(".tanChutit").css({width:width,height:"25px","border-bottom":"1px #ccc solid",background:"#eee","line-height":"25px"});
    $(".tanchuTxt").css({"text-indent":"5px","float":"left","font-size":"14px"});
    $(".tanchuClose").css({"width":"40px","float":"right","font-size":"12px","color":"#666","cursor":"pointer"});
    var winIframeHeight = height - 26;
    $(".winIframe").css({width:width,height:winIframeHeight,"border-bottom":"1px #ccc solid",background:"#ffffff"});
    $(".tanchuClose").hover(
     function(){
      $(this).css("color","#333");
     },function(){
      $(this).css("color","#666");
     }
    );
    $(".tanchuClose").click(function(){
     $(".winbj").remove();
     $(".tanChu").remove();
    });
   }


   function shijiantanchuceng(width,height,tit,url){
    var winWinth = $(window).width(),winHeight = $(document).height();
    $("body").append("<div class='winbj'></div>");
    $("body").append("<div class='tanChu'><div class='tanChutit'><span class='tanchuTxt'>"+tit+"</span><span class='tanchuClose'>关闭</span></div><div class='vdiv'><form id='scsjform' method='post' enctype='multipart/form-data' action='"+url+"'>上传文件：<input  name='upfile' type='file'/><input id='chapterId' name='chapterId' type='hidden' value='1'><div class='quceshi' ><input type='submit' value='提交'></div></form></div></div>");
    $(".winbj").css({width:winWinth,height:winHeight,background:"#000",position:"absolute",left:"0",top:"0"});
    $(".winbj").fadeTo(0, 0.5);
    var tanchuLeft = $(window).width()/2 - width/2;
    var tanchuTop = $(window).height()/2 - height/2 + $(window).scrollTop();
    $(".tanChu").css({width:width,height:height,border:"3px #ccc solid",left:tanchuLeft,top:tanchuTop,background:"#fff",position:"absolute"});
    $(".tanChutit").css({width:width,height:"25px","border-bottom":"1px #ccc solid",background:"#eee","line-height":"25px"});
    $(".tanchuTxt").css({"text-indent":"5px","float":"left","font-size":"14px"});
    $(".tanchuClose").css({"width":"40px","float":"right","font-size":"12px","color":"#666","cursor":"pointer"});
    var winIframeHeight = height - 26;
    $(".winIframe").css({width:width,height:winIframeHeight,"border-bottom":"1px #ccc solid",background:"#ffffff"});
    $(".tanchuClose").hover(
     function(){
      $(this).css("color","#333");
     },function(){
      $(this).css("color","#666");
     }
    );
    $(".tanchuClose").click(function(){
     $(".winbj").remove();
     $(".tanChu").remove();
    });
    $("#scsja").click(function(){
     $("#scsjform").submit();
    });
   }

    $(".datino .vd").click(function(){
        return false;
    });

    $(".dati .sc").click(function(){
        if($(this).hasClass("scend")){
          return false;
        }
        shijiantanchuceng(400,150,"上传实践",$(this).attr("post-url"));
//        shijiantanchuceng(400,150,"上传实践",window.location.href);
        return false;
    });

    var vdnum = 0;
    var bofangTime=0;
    $(".detlist li a").click(function(){
      /*if( !$(this).parents("li").hasClass("on") ){
        return false;
      }*/
      vdnum++;
      var pvnum = $(this).parents("li").attr("data-num");
      var tantit = $(".dettit em").text() + "--" + $(this).next().find("em").text();
      tanchuceng(800,470,tantit,$(this).parents("li").attr("data-url"),$(this).parents("li").attr("data-type"),vdnum);
      
      var player = videojs('example_video_'+vdnum, { /* Options */ }, function() {
    	  this.play();
        
        this.on('timeupdate', function () {  
        	  bofangTime++;       	        	  
        	
        	});
        
        this.on('pause',function() {
          $(".tanChu .quceshi").show();
          bofangTime+="."+pvnum;
            $.get("${ctx}/pauseSchedule.do?bofangP="+bofangTime,function(ret){
              /*if(ret.retCode == "0000"){
                  window.location.href = window.location.href;
              }*/
                //location.reload();
              bofangTime=0;
            });
           
        });
          this.on('ended', function() {
          $(".tanChu .quceshi").show();
            $.get("${ctx}/pauseSchedule.do?bofangE="+bofangTime,function(ret){
              /*if(ret.retCode == "0000"){
                  window.location.href = window.location.href;
              }*/
                location.reload();
            });
        });
      
      });
      return false;
    });
   })
</script>

		
		
	</head>
	<body>
<div class="main">
  <div class="main_resize">      
 
    <div class="content">
      <div class="content_bg">
        <div class="mainbar">
          <div class="article">
			<table width="700"  cellspacing="0" cellpadding="0" border="0">
     	<tbody>
     	  <tr>
     	    <td width="100%" >

			 <table  width="100%"  align="right" cellpadding="1" border="0">
		      <tbody>
                    <tr>
						<td>
              <div class="dettit" ><em>${spChapterName}</em>--共${videoSize}集</div>
              
 				<s:iterator value="spChapterVideoList" status="status"  var="spChapterVideo">             
							<ul class="detlist">
                                <li class="on" data-url="${ctx}/video/${spChapterVideo.video_path}" data-type="video/ogg" data-num="${spChapterVideo.video_step_order}">
                                    <a class="vd" >
                                        <img  src="./images/chapter/${spChapterVideo.video_pic}">
                                    </a>
                                    <div>
       
                                        <em>${ spChapterVideo.video_name_number} &nbsp;&nbsp;${ spChapterVideo.video_name}</em>
                                    </div>
                                    <div>时长：${ spChapterVideo.video_time}分钟</div>
                                    <p>视频介绍：${ spChapterVideo.video_desc}</p>
                                    <p>本节进度：${scheduleList[status.index].percent}%</p>
                                </li>
							</ul>
				</s:iterator>			
							
							
						</td>
					</tr>
             </tbody>
             </table>
        
          </td></tr></tbody></table>
            <div class="clr"></div>
          </div>
        </div>

      </div>
    </div>

</div>
</div>


	
	</body>
</html>






