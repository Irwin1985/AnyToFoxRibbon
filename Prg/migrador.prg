LOCAL lcDirTab, lnNumTab, llSeguir, lnPos
lnPos = 0
llSeguir = .T.
gcPath = "c:\desarrollo\irdc-erp\pantalla\"
DO WHILE llSeguir
	lcDirTab = GETDIR(gcPath, 'Seleccione el directorio de los archivos', 'Directorio SCX')
	IF EMPTY(lcDirTab)
		IF (MESSAGEBOX('El directorio no puede estar Vac�o',5+48,'Directorio Vac�o') = 4)
			llSeguir = .T.
		ELSE &&(MESSAGEBOX('El directorio no puede estar Vac�o',5+48,'Directorio Vac�o') = 4)
			llSeguir = .F.
		ENDIF &&(MESSAGEBOX('El directorio no puede estar Vac�o',5+48,'Directorio Vac�o') = 4)
	ELSE &&EMPTY(lcDirTab)
		SET DEFAULT TO &lcDirTab
		lnNumTab = ADIR(aTablas,'*.SCX')
		SET DEFAULT TO &gcPath
		llSeguir = .F.
	ENDIF &&EMPTY(lcDirTab)
ENDDO &&WHILE llSeguir

IF !EMPTY(lnNumTab)
	FOR lnPos = 1 TO lnNumTab STEP 1
		USE (lcDirTab + aTablas[lnPos,1]) ALIAS FORMULARIO EXCLUSIVE IN 0
		UPDATE FORMULARIO SET CLASSLOC = "c:\desarrollo\irdc-erp\vcx\foxribbon.vcx" WHERE AT("FOXRIBBON.VCX",UPPER(ALLTRIM(classloc))) > 0
		UPDATE FORMULARIO SET CLASSLOC = "c:\desarrollo\irdc-erp\vcx\seinca.vcx" WHERE AT("SEINCA.VCX",UPPER(ALLTRIM(classloc))) > 0
		UPDATE FORMULARIO SET CLASSLOC = "c:\desarrollo\irdc-erp\vcx\vfpskin.vcx" WHERE AT("VFPSKIN.VCX",UPPER(ALLTRIM(classloc))) > 0
		UPDATE FORMULARIO SET CLASSLOC = "c:\desarrollo\irdc-erp\vcx\vfpskintools.vcx" WHERE AT("VFPSKINTOOLS.VCX",UPPER(ALLTRIM(classloc))) > 0
		IF USED('FORMULARIO')
			SELECT FORMULARIO
			USE
		ELSE &&USED('FORMULARIO')
		ENDIF &&USED('FORMULARIO')
	ENDFOR
	MESSAGEBOX("Proceso terminado")
ELSE &&!EMPTY(lnNumTab)
	MESSAGEBOX("El directorio: "+lcDirTab+" est� vac�o",0+64,"Directorio vac�o")
ENDIF &&!EMPTY(lnNumTab)