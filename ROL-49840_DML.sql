/*********************************************************************************************************************************************/
-- ITEM ID											DATE			NAME				DESCRIPTION 
-- ROL-49949 Add new AMS SGD Account in RegOnline	27/09/2019		Murali Pitchika		DML for AMS Merchants
 /*********************************************************************************************************************************************/
  IF NOT EXISTS (select 1 from dbo.paymentechdivisionids where DivisionId = '383945')
  BEGIN
	INSERT dbo.paymentechdivisionids (DivisionId, CurrencyCode, IsTrustDivision, IsEnabled, IsROL,
	      AcceptsVisa, AcceptsAmex, AcceptsDiscover, AcceptsDiners, AcceptsSwitch, IsMCC)
	    VALUES ('383945', 'AUD', 1, 1, 1,  1, 1, 0, 0, 0, 0)

  END

IF NOT EXISTS (select 1 from dbo.AMSMerchantAccounts where PaymentechDivisionID = '383945')
  BEGIN
	  INSERT AMSMerchantAccounts (ProcessorID, Username, Password, CurrencyCode, IsActive, PaymentechDivisionID, AcceptsAmex, AcceptsDiners, AcceptsDiscover, AcceptsMastercard, AcceptsSwitch, AcceptsVisa, IsBillingAccount)
	    VALUES (1, 'RegOnCventAud', 'Nd$73!pj', 'AUD', 1, '359285', 1, 0, 0, 1, 0, 1, 1)
  END  

	