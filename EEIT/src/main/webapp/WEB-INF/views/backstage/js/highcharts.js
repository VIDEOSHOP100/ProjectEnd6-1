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
					                		
					                	 
					                		 console.log(data.viewsArray);
					                		 console.log(data.accountArray);
//					                		 var ret = new Date(InputLiveStreamTimeBean.liveStart);
//					                            var formated = ret.getFullYear() + '/' +(ret.getMonth()+1) +'/' +ret.getDate() + ' ' +ret.getHours() + ':' +ret.getMinutes()
//					                		 console.log(formated);

					                            var tab = $('<div></div>').addClass('antai87');
												$('#content>h2').after(tab);
													var account = data.accountArray;
													var views = data.viewsArray;
													var arrayaccount = account.split(',');
													var arrayviews = views.split(',');
													 console.log(arrayaccount);
													 console.log(arrayviews);
//													 console.log(['bob','micky','snoopy']);
												$(".antai87")
														.highcharts(
																{
																	chart : {
																		type : "bar",
																		
																	},  xAxis: {
																        categories:arrayaccount,
																        title: {
																            text: null
																        }
																    },
																    
																	title : {
																		text : '直播觀看人數統計圖'
																	},
//																	tooltip : {
//																		pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
//																	},
//																	plotOptions : {
//																		pie : {
//																			allowPointSelect : true,
//																			cursor : 'pointer',
//																			depth : 35,
//																			dataLabels : {
//																				enabled : true,
//																				format : '{point.name}'
//																			}
//
//																		}
//																	},
																	 series: [{
																	        name: 'Year 1800',
																	        data: [views]
																	    }, {
																	        name: 'Year 1900',
																	        data: [133, 156, 947, 408, 6]
																	    }, {
																	        name: 'Year 2000',
																	        data: [814, 841, 3714, 727, 31]
																	    }, {
																	        name: 'Year 2016',
																	        data: [1216, 1001, 4436, 738, 40]
																	    }]
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