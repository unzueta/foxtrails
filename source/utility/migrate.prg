PARAMETERS targetVersion, plClobber
*-- Added SQLMigration
*-- To use a sql migration, add a prg-based class to the migrate directory.
*-- See 000SampleMigration.prg
SET SAFETY OFF
SET EXCLUSIVE ON

DO CASE
CASE PCOUNT() = 1
	IF TYPE("targetVersion") = "L"
	  plClobber = targetVersion
	  targetVersion = 999
	ENDIF
CASE PCOUNT() = 0
	targetVersion = 999
	plClobber = .f.
ENDCASE
IF plClobber OR MESSAGEBOX("Migration requires exclusive table access. "+;
			  "Make sure you stop the web server first!"+CHR(13)+CHR(13)+;
			  "Do you want to update all data tables from "+;
			  "the Migration directory?",36) = 6
	TRY
		DO migration WITH "Db\","Migrate\", targetVersion, plClobber
	CATCH TO loExcept
		MESSAGEBOX("The migration failed. Restore from backup"+CHR(13)+loExcept.Message(1))
	ENDTRY
ENDIF

FUNCTION migration
	PARAMETERS lcTargetDir, lcMigrationDir, targetVersion, plClobber
	*-- migrate configuration tables
	IF NOT DIRECTORY(lcTargetDir)
		RETURN
	ENDIF
	IF FILE(lcTargetDir+"db_version.txt") AND !plClobber
		dbVersion = VAL(FILETOSTR(lcTargetDir+"db_version.txt"))
	ELSE
		dbVersion = 0
	ENDIF
	IF plClobber AND dbVersion > 0
		*-- rollback to version 0
		DO SqlMigrate WITH lcTargetDir, lcMigrationDir, dbVersion, 0, plClobber
		*-- force all migrations to be reapplied
		dbVersion = 0
	ENDIF
	DO SqlMigrate WITH lcTargetDir, lcMigrationDir, dbVersion, targetVersion, plClobber
	WAIT CLEAR
	CLOSE DATABASES ALL
ENDFUNC

FUNCTION SqlMigrate
	PARAMETERS lcTargetDir, lcMigrationDir, dbVersion, targetVersion, plClobber
	
	DO CASE
	CASE targetVersion = dbVersion
		RETURN
	CASE targetVersion > dbVersion
		lnStep = 1
		lnStart = dbVersion + 1
		lnEnd = targetVersion
	CASE targetVersion < dbVersion
		lnStep = -1
		lnStart = dbVersion
		*-- we don't want to downgrade the target version
		lnEnd = targetVersion + 1
	ENDCASE
	
	FOR lnMigrate = lnStart TO lnEnd STEP lnStep
		lcMask = TRANSFORM(lnMigrate,"@L 999")
		lnCount = ADIR(laMigrate,lcMigrationDir+lcMask+"*.prg")
		FOR lnI = 1 TO lnCount
		    lcMigrate = lcMigrationDir+laMigrate[lnI,1]
			loMigrate = NEWOBJECT("migrate",lcmigrate)
			loMigrate.targetDir = lcTargetDir
			DO CASE
			CASE lnStep = 1
			    WAIT WINDOW "Upgrading "+lcTargetDir+" to version "+lcMask NOWAIT
				loMigrate.Up()
				STRTOFILE(TRANSFORM(lnMigrate,"@L 999"),lcTargetDir+"db_version.txt",0)
			CASE lnStep = -1
			    WAIT WINDOW "Downgrading "+lcTargetDir+" to version "+TRANSFORM(lnMigrate-1,"@L 999") NOWAIT
				loMigrate.Down()
				STRTOFILE(TRANSFORM(lnMigrate-1,"@L 999"),lcTargetDir+"db_version.txt",0)
			ENDCASE
			loMigrate = null
			RELEASE loMigrate
		NEXT
	NEXT
ENDFUNC