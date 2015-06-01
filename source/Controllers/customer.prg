DEFINE CLASS customer AS base OF controllers\base.prg
	criteria = ""
	
	PROCEDURE search
	ENDPROC

	PROCEDURE list
		USE DB\Customers SHARED IN 0
		SELECT * FROM DB\Customers WHERE UPPER(Companynam) LIKE '%'+UPPER(this.criteria)+'%' INTO Cursor curCustomers
		USE IN Customers
	ENDPROC

	PROCEDURE add
		USE DB\Customers ORDER TAG customerid SHARED IN 0
		SELECT customers
		SEEK "~NEWID~" && force to end of file
		oDispatchContext.renderAction = "edit"
	ENDPROC
	PROCEDURE edit
		PARAMETERS lcid
		USE DB\Customers ORDER TAG customerid SHARED IN 0
		IF !SEEK(lcid)
			oDispatchContext.renderAction = "edit"
			THROW "Record not found"
		ENDIF			
	ENDPROC

	PROCEDURE save
	SET STEP ON 
		USE DB\Customers order tag customerid SHARED IN 0
		IF SEEK(this.customerid)
			GATHER NAME this
		ELSE
			INSERT INTO customers FROM NAME this
		ENDIF
		this.search()
		oDispatchContext.renderAction = "search"
	ENDPROC

	PROCEDURE delete
		USE DB\Customers order tag customerid SHARED IN 0
		IF SEEK(this.customerid)
			DELETE
		ENDIF
		oDispatchContext.renderAction = "search"
	ENDPROC
ENDDEFINE
