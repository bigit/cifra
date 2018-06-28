-- begin CIFRA_CHECK_LIST_ITEMS
alter table CIFRA_CHECK_LIST_ITEMS add constraint FK_CIFRA_CHECK_LIST_ITEMS_DOC_TYPE foreign key (DOC_TYPE_ID) references CIFRA_DOC_TYPE(ID)^
create index IDX_CIFRA_CHECK_LIST_ITEMS_DOC_TYPE on CIFRA_CHECK_LIST_ITEMS (DOC_TYPE_ID)^
-- end CIFRA_CHECK_LIST_ITEMS
-- begin CIFRA_DOC_TYPE
create unique index IDX_CIFRA_DOC_TYPE_UK_NAME on CIFRA_DOC_TYPE (NAME) where DELETE_TS is null ^
-- end CIFRA_DOC_TYPE
-- begin CIFRA_DOCUMENT
alter table CIFRA_DOCUMENT add constraint FK_CIFRA_DOCUMENT_ON_WAREHOUSE foreign key (WAREHOUSE_ID) references CIFRA_WAREHOUSE(ID)^
alter table CIFRA_DOCUMENT add constraint FK_CIFRA_DOCUMENT_ON_CONTRAGENT foreign key (CONTRAGENT_ID) references CIFRA_CONTRAGENT(ID)^
alter table CIFRA_DOCUMENT add constraint FK_CIFRA_DOCUMENT_ON_COMPANY foreign key (COMPANY_ID) references CIFRA_COMPANY(ID)^
alter table CIFRA_DOCUMENT add constraint FK_CIFRA_DOCUMENT_ON_DIVISION foreign key (DIVISION_ID) references CIFRA_DIVISION(ID)^
alter table CIFRA_DOCUMENT add constraint FK_CIFRA_DOCUMENT_ON_DOC_TYPE foreign key (DOC_TYPE_ID) references CIFRA_DOC_TYPE(ID)^
alter table CIFRA_DOCUMENT add constraint FK_CIFRA_DOCUMENT_ON_FILE foreign key (FILE_ID) references SYS_FILE(ID)^
alter table CIFRA_DOCUMENT add constraint FK_CIFRA_DOCUMENT_ON_DOC_CAUSE foreign key (DOC_CAUSE_ID) references CIFRA_DOCUMENT(ID)^
create index IDX_CIFRA_DOCUMENT_ON_WAREHOUSE on CIFRA_DOCUMENT (WAREHOUSE_ID)^
create index IDX_CIFRA_DOCUMENT_ON_CONTRAGENT on CIFRA_DOCUMENT (CONTRAGENT_ID)^
create index IDX_CIFRA_DOCUMENT_ON_COMPANY on CIFRA_DOCUMENT (COMPANY_ID)^
create index IDX_CIFRA_DOCUMENT_ON_DIVISION on CIFRA_DOCUMENT (DIVISION_ID)^
create index IDX_CIFRA_DOCUMENT_ON_DOC_TYPE on CIFRA_DOCUMENT (DOC_TYPE_ID)^
create index IDX_CIFRA_DOCUMENT_ON_FILE on CIFRA_DOCUMENT (FILE_ID)^
create index IDX_CIFRA_DOCUMENT_ON_DOC_CAUSE on CIFRA_DOCUMENT (DOC_CAUSE_ID)^
-- end CIFRA_DOCUMENT
-- begin CIFRA_EMPLOYEE
alter table CIFRA_EMPLOYEE add constraint FK_CIFRA_EMPLOYEE_USER foreign key (USER_ID) references SEC_USER(ID)^
create unique index IDX_CIFRA_EMPLOYEE_UK_USER_ID on CIFRA_EMPLOYEE (USER_ID) where DELETE_TS is null ^
create index IDX_CIFRA_EMPLOYEE_USER on CIFRA_EMPLOYEE (USER_ID)^
-- end CIFRA_EMPLOYEE
-- begin CIFRA_COMPANY
create unique index IDX_CIFRA_COMPANY_UK_NAME on CIFRA_COMPANY (NAME) where DELETE_TS is null ^
create unique index IDX_CIFRA_COMPANY_UNQ on CIFRA_COMPANY (EXTERNAL_ID) where DELETE_TS is null ^
-- end CIFRA_COMPANY
-- begin CIFRA_DIVISION
alter table CIFRA_DIVISION add constraint FK_CIFRA_DIVISION_COMPANY foreign key (COMPANY_ID) references CIFRA_COMPANY(ID)^
create index IDX_CIFRA_DIVISION_COMPANY on CIFRA_DIVISION (COMPANY_ID)^
-- end CIFRA_DIVISION
-- begin CIFRA_CHECK_LIST
alter table CIFRA_CHECK_LIST add constraint FK_CIFRA_CHECK_LIST_ON_DOCUMENT foreign key (DOCUMENT_ID) references CIFRA_DOCUMENT(ID)^
alter table CIFRA_CHECK_LIST add constraint FK_CIFRA_CHECK_LIST_ON_ITEM foreign key (ITEM_ID) references CIFRA_CHECK_LIST_ITEMS(ID)^
create index IDX_CIFRA_CHECK_LIST_ON_DOCUMENT on CIFRA_CHECK_LIST (DOCUMENT_ID)^
create index IDX_CIFRA_CHECK_LIST_ON_ITEM on CIFRA_CHECK_LIST (ITEM_ID)^
-- end CIFRA_CHECK_LIST
-- begin CIFRA_JOURNAL
alter table CIFRA_JOURNAL add constraint FK_CIFRA_JOURNAL_ON_RESPONSIBLE foreign key (RESPONSIBLE_ID) references CIFRA_EMPLOYEE(ID)^
alter table CIFRA_JOURNAL add constraint FK_CIFRA_JOURNAL_ON_WAREHOUSE foreign key (WAREHOUSE_ID) references CIFRA_WAREHOUSE(ID)^
alter table CIFRA_JOURNAL add constraint FK_CIFRA_JOURNAL_ON_HOLDER foreign key (HOLDER_ID) references CIFRA_EMPLOYEE(ID)^
create index IDX_CIFRA_JOURNAL_ON_RESPONSIBLE on CIFRA_JOURNAL (RESPONSIBLE_ID)^
create index IDX_CIFRA_JOURNAL_ON_WAREHOUSE on CIFRA_JOURNAL (WAREHOUSE_ID)^
create index IDX_CIFRA_JOURNAL_ON_HOLDER on CIFRA_JOURNAL (HOLDER_ID)^
-- end CIFRA_JOURNAL
-- begin CIFRA_TAG
create unique index IDX_CIFRA_TAG_UK_NAME on CIFRA_TAG (NAME) where DELETE_TS is null ^
-- end CIFRA_TAG
-- begin CIFRA_DOCUMENT_TAG_LINK
alter table CIFRA_DOCUMENT_TAG_LINK add constraint FK_DOCTAG_ON_TAG foreign key (TAG_ID) references CIFRA_TAG(ID)^
alter table CIFRA_DOCUMENT_TAG_LINK add constraint FK_DOCTAG_ON_DOCUMENT foreign key (DOCUMENT_ID) references CIFRA_DOCUMENT(ID)^
-- end CIFRA_DOCUMENT_TAG_LINK
-- begin CIFRA_JOURNAL_DOCUMENT_LINK
alter table CIFRA_JOURNAL_DOCUMENT_LINK add constraint FK_JOUDOC_JOURNAL foreign key (JOURNAL_ID) references CIFRA_JOURNAL(ID)^
alter table CIFRA_JOURNAL_DOCUMENT_LINK add constraint FK_JOUDOC_DOCUMENT foreign key (DOCUMENT_ID) references CIFRA_DOCUMENT(ID)^
-- end CIFRA_JOURNAL_DOCUMENT_LINK
-- begin CIFRA_CHECK_LIST
alter table CIFRA_CHECK_LIST add constraint FK_CIFRA_CHECK_LIST_ITEM foreign key (ITEM_ID) references CIFRA_CHECK_LIST_ITEMS(ID)^
alter table CIFRA_CHECK_LIST add constraint FK_CIFRA_CHECK_LIST_DOCUMENT foreign key (DOCUMENT_ID) references CIFRA_DOCUMENT(ID)^
create index IDX_CIFRA_CHECK_LIST_ITEM on CIFRA_CHECK_LIST (ITEM_ID)^
create index IDX_CIFRA_CHECK_LIST_DOCUMENT on CIFRA_CHECK_LIST (DOCUMENT_ID)^
-- end CIFRA_CHECK_LIST
