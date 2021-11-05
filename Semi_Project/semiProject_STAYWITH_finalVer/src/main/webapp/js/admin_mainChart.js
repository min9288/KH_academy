/**
 * 
 */

$(function()
{
	$.ajax
	({
		url 	: 	"/admin_TodayProgress", 	//서블릿을 요청할지 매핑값 			
		type	: 	"get",				// method 설정
		success	: function(data)		// 성공시와 에러시, 그리고 완료시
		{	
			var options_00 = 
			{
			  cutoutPercentage: 75,
			  rotation: 0,
			  animation: 
			  {
			    animateScale: true,
			    onComplete: function() 
			    {
			      var width = this.chart.width;
			      var height = this.chart.height;
			      var fontSize = (height / 114).toFixed(2);
			      
			      fontSize = 0.9;
			      
			      this.chart.ctx.font = fontSize + "em Verdana";
			      this.chart.ctx.textBaseline = "middle";
			      var text = "82%",
			        textX = Math.round((width - this.chart.ctx.measureText(text).width) / 2),
			        //textY = height / 2;
			        textY = height/ 1.9;
			        
			      this.chart.ctx.fillText(doughnutData_0.datasets[0].data[1] + "%", textX, textY);
			    }
			  },
			  legend: 
			  {
			    display: false,
			  },
			  tooltips: 
			  {
			    enabled: true,
			  },
			};
			
			var doughnutData_0 = 
			{	
			  labels: 
			  [
				  "예약 미진행",
				  "예약 진행"
			  ],
			  datasets: 
			  [
				  { data: [data,100-data], backgroundColor: ["#565C54","#8F996A"],
					  hoverBackgroundColor:  ["#565C54"]
				  }
			  ]
			};
			
			$('#adminSubChart_00Loading').hide("fast");
			var ctx = $("#adminSubChart_00").get(0).getContext("2d");
			var riskFactorChart = new Chart(ctx, 
			{
			  type: 'doughnut',
			  data: doughnutData_0,
			  options: options_00
			});			
		},
		error	: function()
		{
			console.log("Question_Content Fail __ 001");
		}
	});
	//========================================= <option 00>
	
	$.ajax
	({
		url 	: 	"/admin_TodayCancel", 	//서블릿을 요청할지 매핑값 			
		type	: 	"get",				// method 설정
		success	: function(data)		// 성공시와 에러시, 그리고 완료시
		{	
			var options_01 = 
			{
			  cutoutPercentage: 75,
			  rotation: 0,
			  animation: 
			  {
			    animateScale: true,
			    onComplete: function() 
			    {
			      var width = this.chart.width;
			      var height = this.chart.height;
			      var fontSize = (height / 114).toFixed(2);
			      
			      fontSize = 0.9;
			      
			      this.chart.ctx.font = fontSize + "em Verdana";
			      this.chart.ctx.textBaseline = "middle";
			      var text = "82%",
			        textX = Math.round((width - this.chart.ctx.measureText(text).width) / 2),
			        //textY = height / 2;
			        textY = height/ 1.9;
			        
			      this.chart.ctx.fillText(doughnutData_1.datasets[0].data[1] + "%", textX, textY);
			    }
			  },
			  legend: 
			  {
			    display: false,
			  },
			  tooltips: 
			  {
			    enabled: true,
			  },
			};
			
			var doughnutData_1 = 
			{
			  labels: 
			  [
				  "예약 진행","예약 취소"
			  ],
			  datasets: 
			  [
				  { data: [100-data,data], backgroundColor: ["#565C54","#8F996A"],
					  hoverBackgroundColor:  ["#565C54"]
				  }
			  ]
			};
			
			$('#adminSubChart_01Loading').hide("fast");
			var ctx = $("#adminSubChart_01").get(0).getContext("2d");
			var riskFactorChart = new Chart(ctx, 
			{
			  type: 'doughnut',
			  data: doughnutData_1,
			  options: options_01
			});
			
		},
		error	: function()
		{
			console.log("Question_Content Fail __ 001");
		}
	});
	//========================================= <option 01>
	$.ajax
	({
		url 	: 	"/admin_TodayVacancyRate", 	//서블릿을 요청할지 매핑값 			
		type	: 	"get",				// method 설정
		success	: function(data)		// 성공시와 에러시, 그리고 완료시
		{	
			var options_02 = 
			{
			  cutoutPercentage: 75,
			  rotation: 0,
			  animation: 
			  {
			    animateScale: true,
			    onComplete: function() 
			    {
			      var width = this.chart.width;
			      var height = this.chart.height;
			      var fontSize = (height / 114).toFixed(2);
			      
			      fontSize = 0.9;
			      
			      this.chart.ctx.font = fontSize + "em Verdana";
			      this.chart.ctx.textBaseline = "middle";
			      var text = "82%",
			        textX = Math.round((width - this.chart.ctx.measureText(text).width) / 2),
			        //textY = height / 2;
			        textY = height/ 1.9;
			        
			      this.chart.ctx.fillText(doughnutData_2.datasets[0].data[1] + "%", textX, textY);
			    }
			  },
			  legend: 
			  {
			    display: false,
			  },
			  tooltips: 
			  {
			    enabled: true,
			  },
			};
			
			var doughnutData_2 = 
			{
			  labels: 
			  [
				  "이용","비이용"
			  ],
			  datasets: 
			  [
				  { data: [100-data,data], backgroundColor: ["#565C54","#8F996A"],
					  hoverBackgroundColor:  ["#565C54"]
				  }
			  ]
			};
			
			$('#adminSubChart_02Loading').hide("fast");
			var ctx = $("#adminSubChart_02").get(0).getContext("2d");
			var riskFactorChart = new Chart(ctx, 
			{
			  type: 'doughnut',
			  data: doughnutData_2,
			  options: options_02
			});			
		},
		error	: function()
		{
			console.log("Question_Content Fail __ 001");
		}
	});
	//========================================= <option 02>
	$.ajax
	({
		url 	: 	"/admin_NowdayVacancyRate", 	
		type	: 	"get",				
		success	: function(data)		
		{	
			var options_03 = 
			{
			  cutoutPercentage: 75,
			  rotation: 0,
			  animation: 
			  {
			    animateScale: true,
			    onComplete: function() 
			    {
			      var width = this.chart.width;
			      var height = this.chart.height;
			      var fontSize = (height / 114).toFixed(2);
			      
			      fontSize = 0.9;
			      
			      this.chart.ctx.font = fontSize + "em Verdana";
			      this.chart.ctx.textBaseline = "middle";
			      var text = "82%",
			        textX = Math.round((width - this.chart.ctx.measureText(text).width) / 2),
			        //textY = height / 2;
			        textY = height/ 1.9;
			        
			      this.chart.ctx.fillText(doughnutData_3.datasets[0].data[1] + "%", textX, textY);
			    }
			  },
			  legend: 
			  {
			    display: false,
			  },
			  tooltips: 
			  {
			    enabled: true,
			  },
			};
			
			var doughnutData_3 = 
			{
			  labels: 
			  [
				  "이용 불가능 객실","이용가능 객실"
			  ],
			  datasets: 
			  [
				  { data: [100-data,data], backgroundColor: ["#565C54","#8F996A"],
					  hoverBackgroundColor:  ["#565C54"]
				  }
			  ]
			};
			
			$('#adminSubChart_03Loading').hide("fast");
			var ctx = $("#adminSubChart_03").get(0).getContext("2d");
			var riskFactorChart = new Chart(ctx, 
			{
			  type: 'doughnut',
			  data: doughnutData_3,
			  options: options_03
			});				
		},
		error	: function()
		{
			console.log("Question_Content Fail __ 001");
		}
	});
});