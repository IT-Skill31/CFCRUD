//  Filename:     TenantCompanySVC.cfc
//  Location: 	  /models/TenantCompanySVC.cfc
//  Created by:   Philippe Sambor
//   Purpose:     Implements the TenantCompany object

component singleton displayname="Tenant" hint="I am the TenantCompany class." accessors="true" {

property name="TenantCompanyCD";
property name="TenantGlobalAccountID";
property name="TenantDefaultOrganizationID";
property name="TenantAdminContactName";
property name="TenantAdminContactPhone";
property name="TenantDefaultTimezoneKey";
property name="TenantDefaultLocaleCD";
property name="TenantWebURLaddress";
property name="TenantdbDateFormat";
property name="TenantdbDatetimeFormat";

public any function init( TenantCompanyCD = "CNTX", 
						  TenantGlobalAccountID = 2,
						  TenantDefaultOrganizationID = 7,
						  TenantAdminContactName = "Brett SINCLAIR",
						  TenantAdminContactPhone = "+65 12345678",
						  TenantDefaultTimezoneKey = "Asia/Singapore",
						  TenantDefaultLocaleCD = "en_SG",
						  TenantWebURLaddress = "www.connectrust.asia",
						  TenantdbDateFormat = "yyyy/mm/dd",
						  TenantdbDatetimeFormat = "yyyy/mm/dd HH:nn") { 
	
	variables.TenantCompanyCD = arguments.TenantCompanyCD;
	variables.TenantGlobalAccountID = arguments.TenantGlobalAccountID;
	variables.TenantDefaultOrganizationID = arguments.TenantDefaultOrganizationID;
	variables.TenantAdminContactName = arguments.TenantAdminContactName;
	variables.TenantAdminContactPhone = arguments.TenantAdminContactPhone;
	variables.TenantDefaultTimezoneKey = arguments.TenantDefaultTimezoneKey;
	variables.TenantDefaultLocaleCD = arguments.TenantDefaultLocaleCD;
	variables.TenantWebURLaddress = arguments.TenantWebURLaddress;
	variables.TenantdbDateFormat = arguments.TenantdbDateFormat;
	variables.TenantdbDatetimeFormat = arguments.TenantdbDatetimeFormat;

	// Validation

	this.constraints = {

	TenantCompanyCD = { required = true, type="string" },
	TenantGlobalAccountID = { required = true, type="numeric"},
	TenantDefaultOrganizationID = { required = true, type="numeric"},
	TenantAdminContactName = { required = true, type="string" },
	TenantAdminContactPhone = { required = true, type="string" },
	TenantDefaultTimezoneKey = { required = true, type="string" },
	TenantDefaultLocaleCD = { required = true, type="string" },
	TenantWebURLaddress = { required = true, type="string" },
	TenantdbDateFormat = { required = true, type="string" },
	TenantdbDatetimeFormat = { required = true, type="string" }

	};

	return this;

	}

}