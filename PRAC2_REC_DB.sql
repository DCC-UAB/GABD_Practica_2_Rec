--------------------------------------------------------
--  File created - divendres-de setembre-20-2019   
--------------------------------------------------------
DROP TABLE "DATASET" cascade constraints;
DROP TABLE "MOSTRES" cascade constraints;
--------------------------------------------------------
--  DDL for Table DATASET
--------------------------------------------------------

  CREATE TABLE "DATASET" 
   (	"NAME" VARCHAR2(20), 
	"FEAT_SIZE" NUMBER,
	"NUMCLASSES" NUMBER,
	"INFO" JSON
   ) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ;

--------------------------------------------------------
--  DDL for Table FEATUREVECTOR
--------------------------------------------------------

  CREATE TABLE "MOSTRES"
   (	"NAMEDATASET" VARCHAR2(20), 
	"ID" NUMBER, 
	"CARACTERISTIQUES" BLOB,
	"LABEL" VARCHAR2(16)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("CARACTERISTIQUES") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

--------------------------------------------------------
--  DDL for Index DATASET_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DATASET_PK" ON "DATASET" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SAMPLES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOSTRES_PK" ON "MOSTRES" ("ID", "NAMEDATASET")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

--------------------------------------------------------
--  Constraints for Table DATASET
--------------------------------------------------------

  ALTER TABLE "DATASET" ADD CONSTRAINT "DATASET_PK" PRIMARY KEY ("NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "DATASET" MODIFY ("NAME" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table MOSTRES
--------------------------------------------------------

  ALTER TABLE "MOSTRES" ADD CONSTRAINT "MOSTRES_PK" PRIMARY KEY ("ID", "NAMEDATASET")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "MOSTRES" MODIFY ("NAMEDATASET" NOT NULL ENABLE);
 
  ALTER TABLE "MOSTRES" MODIFY ("ID" NOT NULL ENABLE);


--------------------------------------------------------
--  Ref Constraints for Table MOSTRES
--------------------------------------------------------

  ALTER TABLE "MOSTRES" ADD CONSTRAINT "MOSTRES_FK" FOREIGN KEY ("NAMEDATASET")
	  REFERENCES "DATASET" ("NAME") ON DELETE CASCADE ENABLE;


