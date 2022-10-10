var $primary = "#00b5b8",
	$secondary = "#2c3648",
	$success = "#0f8e67",
	$info = "#179bad",
	$warning = "#ffb997",
	$danger = "#ff8f9e";

$(document).ready(function(){

	// 변수
	var tasklistTitle = [];
	var endTaskCnt = [];
	var missDeadlineCnt = [];
	var deadlineTaskCnt = [];
	var notDeadlineTaskCnt = [];
	var x  = ["완료됨", "마감일지남", "계획됨", "마감일없음"];
	var x1  = [];
	var y  = ["완료됨", "마감일지남", "계획됨", "마감일없음"];
	var y1 = [];
	var y2 = [];
	var colors = [$primary, $warning, $success, $danger];
	
	// 업무리스트 개요
	$.ajax({
		async : false,
		url : '/member/taskListAnalyticsByProjectNo',
		type : 'POST',
		success : function(json){
			$(json).each(function(index, item){
				tasklistTitle.push(item.tasklistTitle);
				endTaskCnt.push(item.endTaskCnt);
				missDeadlineCnt.push(item.missDeadlineCnt);
				deadlineTaskCnt.push(item.deadlineTaskCnt);
				notDeadlineTaskCnt.push(item.notDeadlineTaskCnt);
			});
		}
	}); 
	
	new Chart("bar-stacked1", {
    	    
    	  type: 'horizontalBar',
		  data: {
	        labels: tasklistTitle,
	        datasets: [{
	            label: "완료됨",
	            data: endTaskCnt,
	            backgroundColor: $primary
	        }, {
	            label: "마감일지남",
	            data: missDeadlineCnt,
	            backgroundColor: $warning
	        },
	        {
	            label: "계획됨",
	            data: deadlineTaskCnt,
	            backgroundColor: $success
	        },
	        {
	            label: "마감일없음",
	            data: notDeadlineTaskCnt,
	            backgroundColor: $danger
	        }]
		  },
		  options: {
			    title:{
		            display:false,
		            text:"업무리스트 개요"
		        },
		        tooltips: {
		            mode: 'label'
		        },
		        responsive: true,
		        maintainAspectRatio: false,
		        responsiveAnimationDuration:500,
		        scales: {
		            xAxes: [{
		                stacked: true,
		                display: true,
		                gridLines: {
		                    color: "#f3f3f3",
		                    drawTicks: false,
		                },
		                scaleLabel: {
		                    display: true,
		                }
		            }],
		            yAxes: [{
		                stacked: true,
		                display: true,
		                gridLines: {
		                    color: "#f3f3f3",
		                    drawTicks: false,
		                },
		                scaleLabel: {
		                    display: true,
		                }
		            }]
		        }
		  }
	});
	
 	// 프로젝트 개요
	$.ajax({
		url : '/member/allTaskAnalyticsByProjectNo',
		type : 'POST',
		success : function(json){
		    new Chart("bar-stacked", {
		    	    
		    	  type: 'horizontalBar',
				  data: {
			        labels: ["프로젝트 개요"],
			        datasets: [{
			            label: "완료됨",
			            data: [json.endTaskCnt],
			            backgroundColor: $primary
			        }, {
			            label: "마감일지남",
			            data: [json.missDeadlineCnt],
			            backgroundColor: $warning
			        },
			        {
			            label: "계획됨",
			            data: [json.deadlineTaskCnt],
			            backgroundColor: $success
			        },
			        {
			            label: "마감일없음",
			            data: [json.notDeadlineTaskCnt],
			            backgroundColor: $danger
			        }]
				  },
				  options: {
					    title:{
				            display:false,
				            text:"프로젝트 개요"
				        },
				        tooltips: {
				            mode: 'label'
				        },
				        responsive: true,
				        maintainAspectRatio: false,
				        responsiveAnimationDuration:500,
				        scales: {
				            xAxes: [{
				                stacked: true,
				                display: true,
				                gridLines: {
				                    color: "#f3f3f3",
				                    drawTicks: false,
				                },
				                scaleLabel: {
				                    display: true,
				                }
				            }],
				            yAxes: [{
				                stacked: true,
				                display: true,
				                gridLines: {
				                    color: "#f3f3f3",
				                    drawTicks: false,
				                },
				                scaleLabel: {
				                    display: true,
				                }
				            }]
				        }
				  }
			});
		}
	}); 
    
	// 나에게 배정된 업무 - 도넛
	$.ajax({
		url : '/member/taskAnalyticsByTaskMemberIsMe',
		type : 'POST',
		success : function(json){
				y1.push(json.endTaskCnt);
				y1.push(json.missDeadlineCnt);
				y1.push(json.deadlineTaskCnt);
				y1.push(json.notDeadlineTaskCnt);
			
		    new Chart("simple-doughnut-chart1", {
		    	    
		    	  type: 'doughnut',
				  data: {
					  labels: x,
					  datasets: [
					    {
					      data: y1,
					      backgroundColor: colors,
					    }
					  ]
				  },
				  options: {
				      title: {
				        display: true,
				        text: '나에게 배정된 업무'
				      }
				  }
			});
		}
	}); 
	
	// 내가 작성한 업무 - 도넛
	$.ajax({
		url : '/member/taskAnalyticsByTaskWriterIsMe',
		type : 'POST',
		success : function(json){
				y2.push(json.endTaskCnt);
				y2.push(json.missDeadlineCnt);
				y2.push(json.deadlineTaskCnt);
				y2.push(json.notDeadlineTaskCnt);
			
		    new Chart("simple-doughnut-chart2", {
		    	    
		    	  type: 'doughnut',
				  data: {
					  labels: x,
					  datasets: [
					    {
					      data: y2,
					      backgroundColor: colors,
					    }
					  ]
				  },
				  options: {
				      title: {
				        display: true,
				        text: '내가 작성한 업무'
				      }
				  }
			});
		}
	}); 
	
}); 