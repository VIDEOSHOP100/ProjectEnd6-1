$(document)
		.ready(
				function() {
					$('.list-group-item').click(selectCategory);

					function selectCategory() {

						$('.list-group-item').removeClass('bg-primary')
								.removeClass('text-white').addClass(
										'text-primary');
						$(this).removeClass('text-primary').addClass(
								'bg-primary').addClass('text-white');
						$('#content').empty();

						var title = $(this).text();

						$('#content').prepend($('<h2></h2>').text(title));
						$('#content> p').remove();

						if (title == '報表') {

							 $.ajax({
					                type: "GET",
					                url: "/EEIT/backstageroll",
					                dataType: "json",
					                timeout: 600000,
//					                data: AAA,
					                success: function (data) {
					                	var aa = data.AAA;
					                	  $.each(aa, function (idx,InputLiveStreamTimeBean) {
					                		 console.log(InputLiveStreamTimeBean.liveStreamSeqNo);
					                		 console.log(InputLiveStreamTimeBean.account);
					                		 var ret = new Date(InputLiveStreamTimeBean.liveStart);
					                            var formated = ret.getFullYear() + '/' +(ret.getMonth()+1) +'/' +ret.getDate() + ' ' +ret.getHours() + ':' +ret.getMinutes()
					                		 console.log(formated);
					                       
					                	  
					                	  
					                	  
					                            var tab = $('<div></div>').addClass('antai87');
												$('#content>h2').after(tab);

												$(".antai87")
														.highcharts(
																{
																	chart : {
																		type : "pie",
																		options3d : {
																			enabled : true,
																			alpha : 45,
																			beta : 0
																		}
																	},
																	title : {
																		text : '直播觀看人數統計圖'
																	},
																	tooltip : {
//																		pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
																	},
																	plotOptions : {
																		pie : {
																			allowPointSelect : true,
																			cursor : 'pointer',
																			depth : 35,
																			dataLabels : {
																				enabled : true,
																				format : '{point.name}'
																			}

																		}
																	},
																	series : [ {
																		type : 'pie',

																		name : "直播觀看人數統計圖",
																		   data: [
																	            [InputLiveStreamTimeBean.account, InputLiveStreamTimeBean.allLiveStreamView],
																	            ['IE', 26.8],
																	            {
																	                name: 'Chrome',
																	                y: 12.8,
																	                sliced: true,
																	                selected: true
																	            },
																	            ['Safari', 8.5],
																	            ['Opera', 6.2],
																	            ['Others', 0.7]
																	        ]
																	} ]
																})
					                	  
					                	  
					                	  
					                	  })
					            
							
							
							
//											$('.highcharts-credits').remove();
					                },error:function(){
					                	alert("安泰北七")
					                }
							 })
							// $(".antai87").highcharts(data);

						}

					}

				})