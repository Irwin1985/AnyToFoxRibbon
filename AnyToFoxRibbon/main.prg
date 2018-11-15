PUBLIC gcPath, gcDirTemp, gcDirRep, gnHandle, gcDirDat, gcPort, gcDataBase, gcServer, gcUser, gcPwd, gcDirTab, gnNumTab
gnHandle 	= 0
gcPath 		= ADDBS(SYS(5)+SYS(2003))
gcDirDat 	= gcPath+'DATA\'
gcDirTemp 	= gcPath+'TEMP\'
gcDirRep 	= gcPath+'REP\'
gcDirTab 	= 0
gnNumTab 	= 0

SET DEFAULT 	TO &gcPath
SET PROCEDURE 	TO gcPath+'PRG\UTILIDADES.PRG' 	ADDITIVE
SET CLASSLIB 	TO Vcx\_THERM 					ADDITIVE

ON ERROR DO MANEJAERROR WITH PROGRAM(),LINENO(),ERROR(),MESSAGE()

CLOSE DATA
SET BRSTATUS OFF
SET FIELDS OFF
SET AUTOSAVE ON
SET CLOCK STATUS

SET MULTILOCKS ON
SET REPROCESS TO 1

SET SQLBUFFERING ON
SET ESCAPE OFF
SET HELP OFF
SET NOTIFY OFF

SET STATUS ON
SET STATUS BAR ON

SET TALK OFF

SET MESSAGE TO
SET MACKEY TO

SET CENTURY ON
SET CONFIRM ON
SET DELETE ON
SET EXACT ON

SET MESSAGE TO 0
SET MACKEY TO

SET DATE DMY
SET SEPARATOR TO ','
SET FIXED OFF
SET ENGINEBEHAVIOR 70
PUSH KEY CLEAR
ON KEY LABEL ESC
PUSH MENU _MSYSMENU
MENU=SET("SYSMENU")
SET MEMOWIDTH TO 256
SET SYSMENU OFF
DROPDEAD=.F.
TOBEDONE=""
* Inicialización de las Variables Publicas
STORE 0 TO NESTATUS,NERRORES
IF WEXIST('STANDARD')
	HIDE WINDOW STANDARD
ELSE &&WEXIST('STANDARD')
ENDIF &&WEXIST('STANDARD')
SET STATUS BAR ON
DO FORM FORMS\PRINCIPAL
READ EVENTS