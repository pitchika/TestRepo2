

/*********************************************************************************************************************************************/
-- ITEM ID        DATE           NAME         DESCRIPTION 
-- ROL-49993     10/10/2018   	Manjeet          ROL-49993 - Deactivate UserName = 'clubSpace589k' 
/*********************************************************************************************************************************************/


BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

			UPDATE ROMASTER..AMSMERCHANTACCOUNTS SET 
			IsActive = 0 
			WHERE UserName = 'clubSpace589k';

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
