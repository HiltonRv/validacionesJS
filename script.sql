		create database aprotic_test;
        use aprotic_test;
        
			create table cliente(
			id int not null auto_increment,
			nombre varchar(100) not null,
			apellido_p varchar(100) not null,
			apellido_m varchar(100) not null,
			fechaNacimiento date not null,
			correoPersonal varchar(100) not null,
			celular varchar(100) not null,
			sexo enum('Masculino','Femenino') not null,
			imagen varchar(200),
			estatus enum('Activa','Inactiva') not null,
			password varchar(255)null,
			idRol int default null,
            idAct_actual int not null,
			primary key(id)			
		);
		
        ALTER TABLE cliente AUTO_INCREMENT=1;

		create table rol(
		id int not null auto_increment,
		nombre varchar(255) not null,
		primary key(id)
		);

		ALTER TABLE rol AUTO_INCREMENT=1;
        
		insert into rol (nombre) values('ADMIN');
		insert into rol (nombre) values('USER');

		create table act_actual(
        id int not null auto_increment,
        nombre varchar(255) not null,
        primary key(id)
        );

   		ALTER TABLE act_actual AUTO_INCREMENT=1;
        
     		insert into act_actual (nombre) values('Analista de sistemas');   
			insert into act_actual (nombre) values('Big Data');
            insert into act_actual (nombre) values('Diseñador UI');
            insert into act_actual (nombre) values('Diseñador UX');
            insert into act_actual (nombre) values('Diseñador UI/UX');
            insert into act_actual (nombre) values('Diseñador Gráfico');
            insert into act_actual (nombre) values('Diseñador Web');
            insert into act_actual (nombre) values('Marketing Digital');
            insert into act_actual (nombre) values('Estudiante');
            insert into act_actual (nombre) values('Programador');
            insert into act_actual (nombre) values('Redes');
            insert into act_actual (nombre) values('Seguridad Informática');
            insert into act_actual (nombre) values('Tecnología y Afines');
                 		  
		alter table cliente
		add foreign key(idRol)
		references rol(id);
			
		alter table cliente
		add foreign key(idAct_actual)
		references act_actual(id);
        
    select * from act_actual;
    
        insert into cliente (nombre,apellido_p,apellido_m,fechaNacimiento,correoPersonal,celular,sexo,imagen,estatus,password,idRol,idAct_actual)
values ('AproTIC','AproTIC','AproTIC','1996-11-15','admin@aprotic.com','87878787878','Femenino','C:\\imgAprotic\\aprotic.png','Activa','admin',1,1);

create procedure sp_validate_login(IN correoPersonal varchar(100), IN password varchar(255))
SELECT * FROM cliente c where c.correoPersonal=correoPersonal and c.password = password;

call sp_validate_login("admin@aprotic.com","admin");

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_email_prueba3`(IN correoPersonal varchar(100), OUT status_out boolean)
BEGIN
                declare counter integer;
    set counter = 0;
    set status_out = TRUE;
    
    select count(*) into counter from cliente c where c.correoPersonal = correoPersonal;
    
    if counter > 0 then
                               set status_out = FALSE;
                end if;                   
END
;




		CREATE TABLE Noticias (
		  id int not null auto_increment,
		  titulo varchar(200) not null,
		  fecha date not null,
		  detalle text not null,
		  estatus enum('Activa','Inactiva') not null,
		  primary key (id)
		);

		ALTER TABLE Noticias AUTO_INCREMENT=1;

        
        create table estudio(
			 id int not null auto_increment,
			idCliente int default null,
             idInstitucion int default null,
             idCarrera int default null,
			 fecha_inicio date not null,
			 fecha_fin date,
			 primary key (id)
			);
            
			ALTER TABLE estudio AUTO_INCREMENT=1;
            
			create table institucion
			(
			id int not null auto_increment,
			nombre varchar(255) not null,
			primary key(id)
			);
            
			ALTER TABLE institucion AUTO_INCREMENT=1;
           
           insert into institucion (nombre) values('Instituto');
           insert into institucion (nombre) values('Universidad');
           insert into institucion (nombre) values('Colegio');
           
            create table carrera
			(
			id int not null auto_increment,
			nombre varchar(255) not null,
			primary key(id)
			);

			ALTER TABLE carrera AUTO_INCREMENT=1;
            
            insert into carrera (nombre) values('Telemática');
            insert into carrera (nombre) values('Ing Sistemas');
            insert into carrera (nombre) values('Redes Informáticas');
            
            alter table estudio
			add foreign key(idCliente)
			references cliente(id);
			
            alter table estudio
			add foreign key(idInstitucion)
			references institucion(id);
            
             alter table estudio
			add foreign key(idCarrera)
			references carrera(id);
            
    insert into estudio(idCliente,idInstitucion, idCarrera, fecha_inicio,fecha_fin)values(1,1,1,'2015-05-11','2018-12-21');
        
           
        create table especialidad
			(
			id int not null auto_increment,
			idCliente int default null,
            idEsp_combo int default null,
            idNivel int default null,
			primary key(id)
			);
            
			ALTER TABLE especialidad AUTO_INCREMENT=1;

		    create table esp_combo
			(
			id int not null auto_increment,
			nombre varchar(255) not null,
			primary key(id)
			);
		 
			ALTER TABLE esp_combo AUTO_INCREMENT=1;

			insert into esp_combo (nombre) values ('Maestría en Informática y Telecomunicaciones');
			insert into esp_combo (nombre) values ('Especialización en Desarrollo de Software');
			insert into esp_combo (nombre) values ('Especialización en Computación para la Docencia');
			insert into esp_combo (nombre) values ('Especialización en Auditoría de Sistemas');
			insert into esp_combo (nombre) values ('Especialización en Seguridad Informática');
			insert into esp_combo (nombre) values ('Especialización en Informática Educativa');

			 create table nivel
			(
			id int not null auto_increment,
			nombre varchar(255) not null,
			primary key(id)
			);
		 
			ALTER TABLE nivel AUTO_INCREMENT=1;
            
            insert into nivel (nombre) values ('Junior');
            insert into nivel (nombre) values ('Semi Senior');
            insert into nivel (nombre) values ('Senior');
            
			alter table especialidad
			add foreign key(idCliente)
			references cliente(id);
            
            alter table especialidad
			add foreign key(idEsp_combo)
			references esp_combo(id);
            
             alter table especialidad
			add foreign key(idNivel)
			references nivel(id);


insert into especialidad (idCliente,idEsp_combo,idNivel) values (1,1,1);

			create table lenguaje
			(
			id int not null auto_increment,
			nombre varchar(255) not null,
			idCliente int default null,
            idNivel int default null,
			primary key(id)
			);
			
			ALTER TABLE lenguaje AUTO_INCREMENT=1;

			alter table lenguaje
			add foreign key(idCliente)
			references cliente(id);

             alter table lenguaje
			add foreign key(idNivel)
			references nivel(id);

			insert into lenguaje(nombre,idCliente,idNivel) values('Java',1,1);
            
			create table aplicacion
			(
			id int not null auto_increment,
			aplicacion varchar(255) not null,
			lenguaje varchar(255) not null,
			bdatabase varchar(255) not null,
			idCliente int default null,
            idInterfaz int default null,
			primary key(id)
			);
            
			 ALTER TABLE aplicacion AUTO_INCREMENT=1;
            
			create table interfaz
			(
			id int not null auto_increment,
			nombre varchar(255) not null,
			primary key(id)
			);
			
            
		   ALTER TABLE interfaz AUTO_INCREMENT=1;
    
     insert into interfaz (nombre) values ('interfaz web');
     insert into interfaz (nombre) values ('interfaz movil');
     
			alter table aplicacion
			add foreign key(idCliente)
			references cliente(id);
            
			alter table aplicacion
			add foreign key(idInterfaz)
			references interfaz(id);
		  
         insert into aplicacion (aplicacion,lenguaje,bdatabase,idCliente,idInterfaz) values ('shop web','Java','Oracle',1,1);
         
		  
		  
			create table bdatabase
			(
			id int not null auto_increment,
			idCliente int default null,
            nombre varchar(100)not null,
            idNivel int default null,
			primary key(id)
			);
            
			 ALTER TABLE bdatabase AUTO_INCREMENT=1; 
			 
			alter table bdatabase
			add foreign key(idCliente)
			references cliente(id);  
				
                
			alter table bdatabase
			add foreign key(idNivel)
			references nivel(id);
         
        
        