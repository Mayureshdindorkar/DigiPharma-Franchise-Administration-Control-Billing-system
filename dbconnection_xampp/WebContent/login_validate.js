$(
				function() 
				{
					
					$("form[name='adminform']").validate
					({
						rules:
						{
							admin_uname:
							{ 
								required:true,
								maxlength:10
							},
							admin_pass:
							{ 
								required:true,
								maxlength:10
							},
							
						},
					
						messages:
						{
							admin_uname:{
									required:"Username is mandatory",
									maxlength:"Max username limit is 10 char"
								},
								admin_pass:{
									required:"Password is mandatory",
									maxlength:"Max password limit is 10 char"
								},
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					
					$("form[name='empform']").validate
					({
						rules:
						{
							empid:
							{ 
								required:true,
								maxlength:10,
							},
							branchid:
							{ 
								required:true,
								maxlength:10,
								integer:true
							},
							
						},
					
						messages:
						{
							empid:{
									required:"Username is mandatory",
									maxlength:"Max username limit is 10 char"
								},
								branchid:{
									required:"Password is mandatory",
									maxlength:"Max password limit is 10 char",
									integer:"Branch Id must be integer only"
								},
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					
					$("form[name='custform']").validate
					({
						rules:
						{
							cust_uname:
							{ 
								required:true,
								maxlength:10
							},
							cust_pass:
							{ 
								required:true,
								maxlength:10
							},
							
						},
					
						messages:
						{
							cust_uname:{
									required:"Username is mandatory",
									maxlength:"Max username limit is 10 char"
								},
								cust_pass:{
									required:"Password is mandatory",
									maxlength:"Max password limit is 10 char"
								},
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					$("form[name='add_new_medicine_form']").validate
					({
						rules:
						{
							bname:
							{ 
								required:true,
								maxlength:10,
								lettersonly:true
							},
							mid:
							{ 
								required:true,
								maxlength:10
							},
							mname:
							{ 
								required:true,
								maxlength:10,
								lettersonly: true
							},
							mcname:
							{ 
								required:true,
								maxlength:10,
								lettersonly: true
							},
							price:
							{ 
								required:true,
								maxlength:10,
								number:true
							},
							qtyrem:
							{ 
								required:true,
								maxlength:10,
								digits:true
							},
							
						},
					
						messages:
						{
							bname:{
									required:"Branch name is mandatory",
									maxlength:"Max username limit is 10 char",
									lettersonly:"Enter letters only"
								},
								mid:{
									required:"Medicine Name is mandatory",
									maxlength:"Max password limit is 10 char"
								},
								mname:{
									required:"Medicine Name is mandatory",
									maxlength:"Max password limit is 10 char",
									lettersonly:"Medicine name can be letters only"
								},
								mcname:{
									required:"Medicine company name is mandatory",
									maxlength:"Max password limit is 10 char",
									lettersonly:"Medicine company name can be letters only"
								},
								expdate:{
									required:"Expiry Date is mandatory",
									maxlength:"Max password limit is 10 char"
								},
								price:{
									required:"Price is mandatory",
									maxlength:"Max password limit is 10 char",
									number:"Price can be digit or floating point"
								},
								qtyrem:{
									required:"Qtyrem is mandatory",
									maxlength:"Max password limit is 10 char",
									digits:"Qty can be digit only"
								},
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					
					$("form[name='add_new_medicine_form1111	']").validate
					({
						rules:
						{
							bname:
							{ 
								required:true,
								maxlength:10,
								lettersonly:true
							},
							mname:
							{ 
								
								maxlength:10,
								lettersonly:true
							},
									
						},
					
						messages:
						{
							bname:
							{
									required:"BranchName is mandatory",
									maxlength:"Max username limit is 10 char",
									lettersonly:"Enter letters only"
							},
							mname:
							{
									
									maxlength:"Max password limit is 10 char",
									lettersonly:"Enter letters only"
							},
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					
					$("form[name='add_remove_branch_form1']").validate
					({
						rules:
						{
							bname:
							{ 
								
								maxlength:10,
								lettersonly:true
							},
							bid:
							{ 
								
								maxlength:10,
								number:true
							},
									
						},
					
						messages:
						{
							bname:
							{
									
									maxlength:"Max username limit is 10 char",
									lettersonly:"Enter letters only"
							},
							mname:
							{
									
									maxlength:"Max password limit is 10 char",
									number:"Numbers only"
							},
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					
					$("form[name='apply_remove_offers_form']").validate
					({
						rules:
						{
							oid:
							{ 
								required:true,
								maxlength:10,
								number:true
							},
									
						},
					
						messages:
						{
							oid:
							{
									required:"OrderId is mandatory",
									maxlength:"Max username limit is 10 char",
									number:"Enter number only"
							},
							
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					
					$("form[name='cust_search_medicine_form']").validate
					({
						rules:
						{
							med_name_search:
							{ 
								required:true,
								maxlength:10,
								lettersonly:true
							},
									
						},
					
						messages:
						{
							med_name_search:
							{
									required:"Medicine Name is mandatory",
									maxlength:"Max username limit is 10 char",
									lettersonly:"Enter letters only"
							},
							
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					$("form[name='customer_register_form']").validate
					({
						rules:
						{
							name:
							{ 
								required:true,
								maxlength:10,
								lettersonly:true
							},
							email:
							{ 
								required:true,
								maxlength:30,
							},
							mobile:
							{ 
								required:true,
								maxlength:10,
								number:true
							},
							username:
							{ 
								required:true,
								maxlength:10,
							},
							password:
							{ 
								required:true,
								maxlength:10,
							},
							cpassword:
							{ 
								required:true,
								maxlength:10,
							},
									
						},
					
						messages:
						{
							name:
							{
									required:"Customer Name is mandatory",
									maxlength:"Max username limit is 10 char",
									lettersonly:"Enter letters only"
							},
							email:
							{
									required:"Email is mandatory",
									maxlength:"Max username limit is 10 char",
							},
							mobile:
							{
									required:"Mobile is mandatory",
									maxlength:"Max username limit is 10 char",
									number:"Enter numbers only"
							},
							username:
							{
									required:"Username is mandatory",
									maxlength:"Max username limit is 10 char",
							},
							password:
							{
									required:"Password is mandatory",
									maxlength:"Max username limit is 10 char",
							},
							cpassword:
							{
									required:"Confirm Password is mandatory",
									maxlength:"Max username limit is 10 char",
							},
							
							
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					$("form[name='delete_medicine_form1']").validate
					({
						rules:
						{
							bname:
							{ 
								maxlength:10,
								lettersonly:true
							},
							med_name_search:
							{ 
								maxlength:10,
								lettersonly:true
							},
							
									
						},
					
						messages:
						{
							bname:
							{
									
									maxlength:"Max username limit is 10 char",
									lettersonly:"Enter letters only"
							},
							med_name_search:
							{
									
									maxlength:"Max username limit is 10 char",
									lettersonly:"Enter letters only"
							},
							
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					$("form[name='emp_place_order_form']").validate
					({
						rules:
						{
							cname:
							{ 
								required:true,
								maxlength:10,
								lettersonly:true
							},
							docname:
							{ 
								required:true,
								maxlength:30,
								lettersonly:true
							},
							cmob:
							{ 
								required:true,
								maxlength:30,
								number:true
							},
							
									
						},
					
						messages:
						{
							cname:
							{
									required:"Customer Name is mandatory",
									maxlength:"Max username limit is 10 char",
									lettersonly:"Enter letters only"
							},
							docname:
							{
									required:"Email is mandatory",
									maxlength:"Max username limit is 10 char",
									lettersonly:"Enter letters only"
							},
							cmob:
							{
									required:"Email is mandatory",
									maxlength:"Max username limit is 10 char",
									number:"Enter numbers only"
							},
							
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					
					$("form[name='emp_place_order_form2']").validate
					({
						rules:
						{
							mid:
							{ 
								required:true,
								maxlength:10,
							},
							qty:
							{ 
								required:true,
								maxlength:30,
								number:true
							},
									
						},
					
						messages:
						{
							mid:
							{
									required:"Customer Name is mandatory",
									maxlength:"Max username limit is 10 char",
							},
							qty:
							{
									required:"Email is mandatory",
									maxlength:"Max username limit is 10 char",
									number:"Enter number only"
							},
							
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					$("form[name='emp_place_order_form3']").validate
					({
						rules:
						{
							mid:
							{ 
								required:true,
								maxlength:10,
								
							},
							
						},
					
						messages:
						{
							mid:
							{
									required:"Customer Name is mandatory",
									maxlength:"Max username limit is 10 char",
							},
						
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					$("form[name='emp_registration_form']").validate
					({
						rules:
						{
							ebname:
							{ 
								required:true,
								maxlength:10,
								lettersonly:true
							},
							
						},
					
						messages:
						{
							ebname:
							{
									required:"Customer Name is mandatory",
									maxlength:"Max username limit is 10 char",
									lettersonly:"Enter letters only"
							},
						
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					$("form[name='emp_registration_form_2']").validate
					({
						rules:
						{
							ename:
							{ 
								required:true,
								maxlength:10,
								lettersonly:true
							},
							esalary:
							{ 
								required:true,
								maxlength:10,
								number:true
							},
							eaddress:
							{ 
								required:true,
								maxlength:150,
								
							},
							ebname:
							{ 
								required:true,
								maxlength:10,
								lettersonly:true
							},
							
						},
					
						messages:
						{
							ename:
							{
									required:"Employee Name is mandatory",
									maxlength:"Max username limit is 10 char",
									lettersonly:"Enter letters only"
							},
							esalary:
							{
									required:"Employee salary is mandatory",
									maxlength:"Max username limit is 10 char",
									number:"Enter number only"
							},
							eaddress:
							{
									required:"Eaddress is mandatory",
									maxlength:"Max username limit is 150 char",
									
							},
							ebname:
							{
									required:"Employee BranchName is mandatory",
									maxlength:"Max username limit is 10 char",
									lettersonly:"Enter letters only"
							},
						
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					$("form[name='remove_emp_form1']").validate
					({
						rules:
						{
							ebname:
							{ 
								required:true,
								maxlength:10,
								lettersonly:true
							},
							eid:
							{ 
								
								maxlength:10,
							}	
						},
					
						messages:
						{
							ebname:
							{
									required:"Employee Branch Name is mandatory",
									maxlength:"Max username limit is 10 char",
									lettersonly:"Enter letters only"
							},
							eid:
							{ 
								
								maxlength:"Max username limit is 10 char",
							}
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					$("form[name='send_stock_refill_notifications_form']").validate
					({
						rules:
						{
							mname:
							{ 
								required:true,
								maxlength:10,
								lettersonly:true
							},
							qty:
							{ 
								required:true,
								maxlength:10,
								number:true
							}	
						},
					
						messages:
						{
							mname:
							{
									required:"Employee Branch Name is mandatory",
									maxlength:"Max username limit is 10 char",
									lettersonly:"Enter letters only"
							},
							qty:
							{ 
								required:"Employee Branch Name is mandatory",
								maxlength:"Max username limit is 10 char",
								number:"Qty can be positive integer only"
							}
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					$("form[name='view_previous_purchases_form']").validate
					({
						rules:
						{
							cust_mobile:
							{ 
								required:true,
								maxlength:10,
								number:true
							},
							
						},
					
						messages:
						{
							cust_mobile:
							{
									required:"Employee Branch Name is mandatory",
									maxlength:"Max username limit is 10 char",
									number:"Enter numbers only"
							},
						
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					$("form[name='view_stock_refill_notifications_form']").validate
					({
						rules:
						{
							nsr:
							{ 
								required:true,
								maxlength:10,
								number:true
							},
							
						},
					
						messages:
						{
							nsr:
							{
									required:"Employee Branch Name is mandatory",
									maxlength:"Max username limit is 10 char",
									number:"Enter numbers only"
							},
						
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
					$("form[name='sales_history_form']").validate
					({
						rules:
						{
							bname:
							{ 
								required:true,
								maxlength:10,
								lettersonly:true
							},
							
						},
					
						messages:
						{
							bname:
							{
									required:"Employee Branch Name is mandatory",
									maxlength:"Max username limit is 10 char",
									lettersonly:"Enter lettersonly only"
							},
						
						},
					
						submitHandler:function(form)
						{
							form.submit();
						}
						
					});
				}
);