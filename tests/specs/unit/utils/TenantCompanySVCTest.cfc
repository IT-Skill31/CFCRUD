/**
* The base model test case will use the 'model' annotation as the instantiation path
* and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
* responsibility to update the model annotation instantiation path and init your model.
*/
component extends="coldbox.system.testing.BaseTestCase" appMapping="/" {
	
	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();

		// Get an instance of the component for testing

		tenantCompany = getInstance( "TenantCompanySVC" );

	}

	function afterAll(){
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/
	
	function run(){

		describe( "Tenant company unit test Suite", function(){	

		it("can read the tenant company record", function(){	
        		
        		// Create an instance of the target bean to hold the data to test
			     
				var dataBean = createObject('component', 'models.TenantCompanySVC').init();
				
				
				// Read the component and verify its contents
				
				expect( databean.getTenantCompanyCD() ).toBe( "CNTX" );
				expect( databean.getTenantGlobalAccountID() ).toBe(2);
				expect( databean.getTenantDefaultOrganizationID() ).toBe(7);
				expect( databean.getTenantAdminContactName() ).toBe( "Brett SINCLAIR" );
				expect( databean.getTenantAdminContactPhone() ).toBe( "+65 12345678" );
				expect( databean.getTenantDefaultTimezoneKey() ).toBe("Asia/Singapore"); // From Coldbox cbi18n TZ list
				expect( databean.getTenantDefaultLocaleCD() ).toBe("en_SG");
				expect( databean.getTenantWebURLaddress() ).toBe("www.connectrust.asia");
				expect( databean.getTenantdbDateFormat() ).toBe("yyyy/mm/dd");
				expect( databean.getTenantdbDatetimeFormat() ).toBe("yyyy/mm/dd HH:nn");

				});	
			

		});

	}

}
