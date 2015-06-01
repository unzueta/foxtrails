*-- this class is used to verify the operation of the dispatcher.
*-- it does this by creating a reference to itself that can be
*-- tested after the DispatchRequest method has nullified the 
*-- oDispatchContext.instance property. See testdispatcher.prg for
*-- the assertions used on the lastinstance property.
DEFINE CLASS controller AS base OF Controllers\base.prg
PROCEDURE method
PARAMETERS p1,p2
RETURN p1+p2
ENDPROC
PROCEDURE last
oDispatchContext.AddProperty("lastinstance",this)
ENDPROC
ENDDEFINE
