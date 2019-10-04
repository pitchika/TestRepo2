/*********************************************************************************************************************************************/
-- ITEM ID        DATE           NAME               DESCRIPTION 
-- ROL-49993     10/04/2019   	Manjeet Kumar       ROL-49993 - Update AUD AMS Account  - RollBack
/*********************************************************************************************************************************************/

BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

		      ALTER TABLE ROMASTER..AMSMERCHANTACCOUNTS 
			  DROP CONSTRAINT FK_AMSMerchantAccounts_PaymentechDivisionID;

			  UPDATE ROMASTER..AMSMERCHANTACCOUNTS SET 
			  PaymentechDivisionId = '005785'
			  WHERE UserName = 'duBr9pHa';


			  ALTER TABLE ROMASTER..AMSMERCHANTACCOUNTS 
			  ADD CONSTRAINT FK_AMSMerchantAccounts_PaymentechDivisionID
			  FOREIGN KEY (PaymentechDivisionID) REFERENCES ROMASTER..paymentechdivisionids(DivisionId);

		COMMIT
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage NVARCHAR(4000);
		DECLARE @ErrorSeverity INT;
		DECLARE @ErrorState INT;
		DECLARE @ROWCOUNT INT;
		SELECT
			@ErrorMessage = ERROR_MESSAGE(),
			@ErrorSeverity = ERROR_SEVERITY(),
			@ErrorState = ERROR_STATE();
    
		-- Use RAISERROR inside the CATCH block to return error
		-- information about the original error that caused
		-- execution to jump to the CATCH block.
		RAISERROR (@ErrorMessage, -- Message text.
					@ErrorSeverity, -- Severity.
					@ErrorState -- State.
					)  WITH NOWAIT;

		--On the off chance something fails, it sets to 0 to avoid an infinite loop.
		SET @ROWCOUNT = 0

		ROLLBACK
	END CATCH
END
