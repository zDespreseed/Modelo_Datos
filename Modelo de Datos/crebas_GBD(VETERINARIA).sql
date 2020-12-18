/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     18/12/2020 7:43:15                           */
/*==============================================================*/


drop index CLIENTE_PK;

drop table CLIENTE;

drop index CLIENTE_PRODUCTO_FK;

drop index CLIENTE_PRODUCTO2_FK;

drop index CLIENTE_PRODUCTO_PK;

drop table CLIENTE_PRODUCTO;

drop index CLIENTE_MASCOTA_FK;

drop index MASCOTAS_PK;

drop table MASCOTAS;

drop index PRODUCTO_PROVEEDOR_FK;

drop index PRODUCTOS_PK;

drop table PRODUCTOS;

drop index PROVEEDOR_PK;

drop table PROVEEDOR;

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   CI_CLIENTE           INT4                 not null,
   NOMBRES_C            VARCHAR(30)          not null,
   APELLIDOS_C          VARCHAR(40)          not null,
   GENERO_MASC          VARCHAR(15)          not null,
   DIRECCION_C          VARCHAR(70)          not null,
   TELEFONO_C           INT4                 not null,
   FECHA_REGISTRO       DATE                 not null,
   ANTIGUEDAD           VARCHAR(10)          not null,
   FECHA_ULTI_VISI      DATE                 not null,
   NUM_MASCOTA_LL       INT2                 not null,
   constraint PK_CLIENTE primary key (CI_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
CI_CLIENTE
);

/*==============================================================*/
/* Table: CLIENTE_PRODUCTO                                      */
/*==============================================================*/
create table CLIENTE_PRODUCTO (
   COD_PRODUCTOS        INT4                 not null,
   CI_CLIENTE           INT4                 not null,
   constraint PK_CLIENTE_PRODUCTO primary key (COD_PRODUCTOS, CI_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PRODUCTO_PK                                   */
/*==============================================================*/
create unique index CLIENTE_PRODUCTO_PK on CLIENTE_PRODUCTO (
COD_PRODUCTOS,
CI_CLIENTE
);

/*==============================================================*/
/* Index: CLIENTE_PRODUCTO2_FK                                  */
/*==============================================================*/
create  index CLIENTE_PRODUCTO2_FK on CLIENTE_PRODUCTO (
CI_CLIENTE
);

/*==============================================================*/
/* Index: CLIENTE_PRODUCTO_FK                                   */
/*==============================================================*/
create  index CLIENTE_PRODUCTO_FK on CLIENTE_PRODUCTO (
COD_PRODUCTOS
);

/*==============================================================*/
/* Table: MASCOTAS                                              */
/*==============================================================*/
create table MASCOTAS (
   ID_MASCOTAS          INT4                 not null,
   CI_CLIENTE           INT4                 not null,
   NOMBRE               VARCHAR(20)          not null,
   FECHA_NAC            DATE                 not null,
   GENERO_MASC          VARCHAR(15)          not null,
   COLOR                VARCHAR(15)          not null,
   ESTERILIZADO         BOOL                 not null,
   FECHA_VAC            DATE                 not null,
   DOSIS_VAC            VARCHAR(10)          not null,
   VETERINARIO_VAC      VARCHAR(60)          not null,
   constraint PK_MASCOTAS primary key (ID_MASCOTAS)
);

/*==============================================================*/
/* Index: MASCOTAS_PK                                           */
/*==============================================================*/
create unique index MASCOTAS_PK on MASCOTAS (
ID_MASCOTAS
);

/*==============================================================*/
/* Index: CLIENTE_MASCOTA_FK                                    */
/*==============================================================*/
create  index CLIENTE_MASCOTA_FK on MASCOTAS (
CI_CLIENTE
);

/*==============================================================*/
/* Table: PRODUCTOS                                             */
/*==============================================================*/
create table PRODUCTOS (
   COD_PRODUCTOS        INT4                 not null,
   COD_PROVEEDOR        INT4                 not null,
   PROVEEDORES          VARCHAR(40)          not null,
   constraint PK_PRODUCTOS primary key (COD_PRODUCTOS)
);

/*==============================================================*/
/* Index: PRODUCTOS_PK                                          */
/*==============================================================*/
create unique index PRODUCTOS_PK on PRODUCTOS (
COD_PRODUCTOS
);

/*==============================================================*/
/* Index: PRODUCTO_PROVEEDOR_FK                                 */
/*==============================================================*/
create  index PRODUCTO_PROVEEDOR_FK on PRODUCTOS (
COD_PROVEEDOR
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR (
   COD_PROVEEDOR        INT4                 not null,
   NOMBRE_P             CHAR(20)             not null,
   constraint PK_PROVEEDOR primary key (COD_PROVEEDOR)
);

/*==============================================================*/
/* Index: PROVEEDOR_PK                                          */
/*==============================================================*/
create unique index PROVEEDOR_PK on PROVEEDOR (
COD_PROVEEDOR
);

alter table CLIENTE_PRODUCTO
   add constraint FK_CLIENTE__CLIENTE_P_PRODUCTO foreign key (COD_PRODUCTOS)
      references PRODUCTOS (COD_PRODUCTOS)
      on delete restrict on update restrict;

alter table CLIENTE_PRODUCTO
   add constraint FK_CLIENTE__CLIENTE_P_CLIENTE foreign key (CI_CLIENTE)
      references CLIENTE (CI_CLIENTE)
      on delete restrict on update restrict;

alter table MASCOTAS
   add constraint FK_MASCOTAS_CLIENTE_M_CLIENTE foreign key (CI_CLIENTE)
      references CLIENTE (CI_CLIENTE)
      on delete restrict on update restrict;

alter table PRODUCTOS
   add constraint FK_PRODUCTO_PRODUCTO__PROVEEDO foreign key (COD_PROVEEDOR)
      references PROVEEDOR (COD_PROVEEDOR)
      on delete restrict on update restrict;

