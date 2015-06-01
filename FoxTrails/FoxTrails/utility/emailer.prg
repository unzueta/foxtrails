PARAMETERS lcFrom, lcTo, lcSubject, lcBody, lcServer
*-- this implements a simple text email
*-- to send a more elaborate email, or set alternate smtp server, etc
*-- instantiate the emailer object directly and update it's properties
*-- accordingly.

mailer = NEWOBJECT("emailer","emailer.prg")
mailer.from = lcFrom
mailer.to = lcTo
mailer.subject = lcSubject
mailer.textBody = lcBody
IF !EMPTY(lcServer)
	mailer.smtpServer = lcServer
ENDIF
llReturn = mailer.sendEmail()
mailer = null
RETURN llReturn

DEFINE CLASS emailer AS Relation
	#if .f.
		LOCAL this AS emailer OF emailer.prg
	#endif
	smtpServer = "localhost"
	smtpPort = 25
	smtpTimeout = 10
	smtpUser = ""
	smtpPass = ""

	from = ""
	to = ""
	subject = ""
	textBody = ""
	htmlBody = ""
	DIMENSION attachments[1]
	attachmentCount = 0
	
	errorMessage = ""

	PROCEDURE addAttachment
		this.attachmentCount = this.attachmentCount + 1
		DIMENSION this.attachments[this.attachmentCount]
		this.attachments[this.attachmentCount]
	ENDPROC

    PROCEDURE clearAttachments
    	DIMENSION this.attachments[1]
    	this.attachmentCount = 0
    ENDPROC
    
	PROCEDURE sendEmail
		PARAMETERS tlUrgent
		LOCAL loConfig AS CDO.Configuration, loFlds AS Object, loMsg AS CDO.Message, llReturn
	    TRY
			llReturn = .f.
			loMsg = CREATEOBJECT("CDO.Message")
			IF !EMPTY(this.smtpServer)
				loConfig = CREATEOBJECT("CDO.Configuration")
				loFlds	= loConfig.Fields
				WITH loFlds
	 				lcSchema = "http://schemas.microsoft.com/cdo/configuration/"
	 			  *- Set the CDOSYS configuration fields to use port 25 on the SMTP server.
				  .Item(lcSchema+"smtpserverport") = this.smtpPort
				  .Item(lcSchema+"sendusing") = 2

				  *- Enter name or IP address of remote SMTP server.
				  .Item(lcSchema+"smtpserver") = this.smtpServer

				  *- Assign timeout in seconds
				  .Item(lcSchema+"smtpconnectiontimeout") = this.smtpTimeout

				  *- Authenticate if needed
				  IF !EMPTY(this.smtpUser)
					  .ITEM(lcSchema + "smtpauthenticate") = .t.
		 			  .ITEM(lcSchema + "sendusername") = this.smtpUser
					  .ITEM(lcSchema + "sendpassword") = this.smtpPass
				  ENDIF
				  
				  *- Commit changes to the object
				  .Update()
				ENDWITH
				loMsg.Configuration = loConfig
			ENDIF
			*- Create and send the message.
			WITH loMsg

			  .To	 = this.To
			  .From	 = this.From
			  .Subject	 = this.Subject
			  IF !EMPTY(this.HtmlBody)
				  .HTMLBody	 = this.HtmlBody
			  ENDIF
			  IF !EMPTY(this.TextBody)
				  .TextBody	 = this.TextBody
			  ENDIF

			  *- Set priority to HIGH if needed
			  IF tlUrgent
			     .Fields("Priority").Value = 1 && -1=Low, 0=Normal, 1=High
			     .Fields.Update()
			  ENDIF
	      	  FOR lnCount = 1 TO this.ATTACHMENTCOUNT
   				= .AddAttachment(attachments[lnCount])
    	  	  ENDFOR

			  .Send()
			  llReturn = .t.
			ENDWITH
		CATCH TO loExcept
			this.errorMessage = loExcept.Message
		ENDTRY
		loConfig = null
		loFlds = null
		loMsg = null
		RETURN llReturn
	ENDPROC
ENDDEFINE