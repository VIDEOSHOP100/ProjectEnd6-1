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
//-------------------------------直播圖表-------------------------------
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
													var removeviews =  arrayviews.map(Number);
													
													 console.log(arrayaccount);
													 console.log(removeviews);
//													 console.log(['bob','micky','snoopy']);
												$(".antai87")
														.highcharts(
																{
																	chart : {
																		type : "bar",
																		
																	},  xAxis: {
																        categories:arrayaccount,
																        title: {
																            text: '直播主帳號'
																        }
																    }, 
																    
																	title : {
																		text : '直播觀看人數統計圖'
																	},yAxis: {
																        min: 0,
																        title: {
																            text: '觀看人數 (人)',
																            align: 'high'
																        }
																        },
																	tooltip : {
																		valueSuffix: ' 人'
																	},
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
																	        name: '觀看人數',
																	        data: removeviews
																	    }]
																})

//											$('.highcharts-credits').remove();
					                },error:function(){
					                	alert("安泰北七")
					                }
							 })
							// $(".antai87").highcharts(data);

				//--------------------叫價圖表---------------------------	 
						$.ajax({
					                type: "GET",
					                url: "/EEIT/bidbackstageroll",
					                dataType: "json",
					                timeout: 600000,
//					                data: AAA,
					                success: function (data) {
					                		
					                	 
					                		 console.log(data.dayArray);
					                		 console.log(data.maxPriceArray);
//					                		 var ret = new Date(InputLiveStreamTimeBean.liveStart);
//					                            var formated = ret.getFullYear() + '/' +(ret.getMonth()+1) +'/' +ret.getDate() + ' ' +ret.getHours() + ':' +ret.getMinutes()
//					                		 console.log(formated);

					                            var tab2 = $('<div></div>').addClass('antai877');
												$('#content>h2').after(tab2);
													var maxPrice = data.maxPriceArray;
													var day = data.dayArray;
													var arraymaxPrice = maxPrice.split(',').map(Number);
													var arrayday = day.split(',');
													var removedays =  arrayday.map(Number);
													
													 console.log(arraymaxPrice);
													 console.log(removedays);
//													 console.log(['bob','micky','snoopy']);
												$(".antai877")
														.highcharts(
																{
																	chart : {
																		type : "line",
																		
																	},  xAxis: {
																        categories:removedays,
																        title: {
																            text: '日期'
																        }
																    }, 
																    
																	title : {
																		text : '每日最高價統計圖'
																	},yAxis: {
																        min: 0,
																        title: {
																            text: '價錢(NT)',
																            align: 'high'
																        }
																        },
																	tooltip : {
																		valueSuffix: ' NT'
																	},
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
																	        name: '得標價格',
																	        data: arraymaxPrice
																	    }]
																})

//											$('.highcharts-credits').remove();
					                },error:function(){
					                	alert("安泰北七")
					                }
							 })	 
							 
							 
							 
							//--------------------伯恩數量圖表---------------------------	 
								$.ajax({
							                type: "GET",
							                url: "/EEIT/orderbackstageroll",
							                dataType: "json",
							                timeout: 600000,
//							                data: AAA,
							                success: function (data) {
							                		
							                	 
							                		 console.log(data.OrderdayArray);
							                		 console.log(data.orderQuantityArray);
//							                		 var ret = new Date(InputLiveStreamTimeBean.liveStart);
//							                            var formated = ret.getFullYear() + '/' +(ret.getMonth()+1) +'/' +ret.getDate() + ' ' +ret.getHours() + ':' +ret.getMinutes()
//							                		 console.log(formated);

							                            var tab3 = $('<div></div>').addClass('antai8777');
														$('#content>h2').after(tab3);
															var orderQuantityArray = data.orderQuantityArray;
															var day = data.OrderdayArray;
															var arrayorderQuantity = orderQuantityArray.split(',').map(Number);
															
															
															
															var arrayday = day.split(',');
															var removedays =  arrayday.map(Number);
															
															 console.log(arrayorderQuantity);
															 console.log(removedays);
//															 console.log(['bob','micky','snoopy']);
														$(".antai8777")
																.highcharts(
																		{
																			chart : {
																				type : "column", 
																				options3d: {
																		            enabled: true,
																		            alpha: 10,
																		            beta: 5,
																		            depth: 70
																		        }
																				
																			},  xAxis: {
																		        categories:removedays,
																		        title: {
																		            text: '日期'
																		        }
																		    }, 
																		    
																			title : {
																				text : '每日訂單數量統計圖'
																			},yAxis: {
																		        min: 0,
																		        title: {
																		            text: '訂單數量(筆)',
																		            align: 'high'
																		        }
																		        },
																			tooltip : {
																				valueSuffix: ' 筆'
																			},
//																			plotOptions : {
//																				pie : {
//																					allowPointSelect : true,
//																					cursor : 'pointer',
//																					depth : 35,
//																					dataLabels : {
//																						enabled : true,
//																						format : '{point.name}'
//																					}
		//
//																				}
//																			},
																			 series: [{
																			        name: '訂單數量',
																			        data: arrayorderQuantity
																			    }]
																		})

//													$('.highcharts-credits').remove();
							                },error:function(){
							                	alert("安泰北七")
							                }
									 })	 
							 
							 
									//--------------------伯恩數量圖表---------------------------	 
										$.ajax({
									                type: "GET",
									                url: "/EEIT/bidtimebackstageroll",
									                dataType: "json",
									                timeout: 600000,
//									                data: AAA,
									                success: function (data) {
									                		
									                	 
//									                		 console.log(data.OrderdayArray);
									                		 console.log(data.BidTimeArray);
//									                		 var ret = new Date(InputLiveStreamTimeBean.liveStart);
//									                            var formated = ret.getFullYear() + '/' +(ret.getMonth()+1) +'/' +ret.getDate() + ' ' +ret.getHours() + ':' +ret.getMinutes()
//									                		 console.log(formated);

									                            var tab4 = $('<div></div>').addClass('antai87777');
																$('#content>h2').after(tab4);
																	var BidTimeArray = data.BidTimeArray;
//																	var day = data.OrderdayArray;
																	var arrayorderQuantity = BidTimeArray.split(',').map(String);
																	
																	
																	
//																	var arrayday = day.split(',');
//																	var removedays =  arrayday.map(Number);
																	
																	 console.log("new1"+arrayorderQuantity);
//																	 console.log(removedays);
//																	 console.log(['bob','micky','snoopy']);
																$(".antai87777")
																		.highcharts('container',
																				{
																			 chart: {
																	                zoomType: 'x'
																	            },
																						
																					 xAxis: {
																						 type: 'datetime'
																				    }, 
																				    
																					title : {
																						text : '每日訂單數量統計圖'
																					},yAxis: {
																				        min: 0,
																				        title: {
																				            text: '訂單數量(筆)',
																				            align: 'high'
																				        }
																				        },
																					tooltip : {
																						valueSuffix: ' 筆'
																					},
//																					plotOptions : {
//																						pie : {
//																							allowPointSelect : true,
//																							cursor : 'pointer',
//																							depth : 35,
//																							dataLabels : {
//																								enabled : true,
//																								format : '{point.name}'
//																							}
				//
//																						}
//																					},
																					 series: [{
																						   type: 'area',
																					        name: '訂單數量',
																					        data: [arrayorderQuantity]
																					    }]
																				})

//															$('.highcharts-credits').remove();
									                },error:function(){
									                	alert("安泰北七")
									                }
											 })	 
							 
							 
							 
						}

					}

				})