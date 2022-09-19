#Creación tabla Sede
create table Sede(
    id_Sede varchar(50) PRIMARY KEY not null,
    Nombre_Sede varchar(50) not null
);

#Creación tabla Documento
create table Documento(
    id_Documento varchar(50) PRIMARY KEY not null,
    Tipo_Documento varchar(50) not null
);

#Creación tabla Especie
create table Especie(
    id_Especie varchar(50) PRIMARY KEY not null,
    Nombre_Especie varchar(50) not null
);

#Creación tabla Paciente
create table Paciente(
    id_Paciente varchar(50) PRIMARY KEY not null,
    Nombre_Mascota varchar(50) not null,
    Nombre_Dueno varchar(50) not null,
    Numero_Documento varchar(50) not null,
    Telefono varchar(50) not null,
    Direccion_Residencia varchar(50) not null,
    Raza varchar(50) not null,
    Genero varchar(50) not null,
    Esteril varchar(50) not null,
    Edad int not null,
    id_Documento varchar(50) not null,
    id_Especie varchar(50) not null,
    FOREIGN KEY (id_Documento) REFERENCES Documento(id_Documento),
    FOREIGN KEY (id_Especie) REFERENCES Especie(id_Especie)
);

#Creación tabla Cita
create table Cita(
    fecha_Cita Date not null,
    id_Paciente varchar(50) not null,
    id_Sede varchar(50) not null,
    PRIMARY KEY (id_Paciente, id_Sede, fecha_Cita),
    FOREIGN KEY (id_Paciente) REFERENCES Paciente(id_Paciente),
    FOREIGN KEY (id_Sede) REFERENCES Sede(id_Sede)
);

#Creación tabla Médico
create table Medico(
    id_Medico varchar(50) PRIMARY KEY not null,
    Nombre varchar(50) not null,
    Especialidad varchar(50) not null,
    Telefono varchar(50) not null,
    Direccion_Residencia varchar(50) not null,
    id_Sede varchar(50) not null,
    FOREIGN KEY (id_Sede) REFERENCES Sede(id_Sede)
);

#Creación tabla Historia Clinica
create table Historia_Clinica(
    id_Historia_Clin varchar(50) PRIMARY KEY not null,
    Fecha_Cita Date not null,
    Motivo varchar(50) not null,
    Diagnostico varchar(50) not null,
    Tratamiento varchar(50) not null,
    id_Paciente varchar(50) not null,
    id_Medico varchar(50) not null,
    FOREIGN KEY (id_Paciente) REFERENCES Paciente(id_Paciente),
    FOREIGN KEY (id_Medico) REFERENCES Medico(id_Medico)
);

#Alteramos la tabla para agregar le campo Nacionalidad como se solicita en el punto 2 del ejercicio 2
Alter table Paciente add Nacionalidad varchar(50);

#Insertamos los datos dentro de las tablas documento y especie con los tipos de documento y las especies a usar
insert into documento(id_Documento, Tipo_Documento) values ("TI", "Tarjeta de Identidad");
insert into documento(id_Documento, Tipo_Documento) values ("CC", "Cedula de Ciudadania");
insert into documento(id_Documento, Tipo_Documento) values ("CE", "Cedula de Extranjeria");
insert into Especie(id_Especie, Nombre_Especie) values ("001", "Perro");
insert into Especie(id_Especie, Nombre_Especie) values ("002", "Gato");
insert into Especie(id_Especie, Nombre_Especie) values ("003", "Hamster");
insert into Especie(id_Especie, Nombre_Especie) values ("004", "Conejo");
insert into Especie(id_Especie, Nombre_Especie) values ("005", "Serpiente");
insert into Especie(id_Especie, Nombre_Especie) values ("006", "Tigre");
insert into Especie(id_Especie, Nombre_Especie) values ("007", "Leon");

#Agregamos la sede centro como primera sede
#Adicional agregamos al primer médico que observamos con los datos que tenemos disponibles en la descripción y los necesarios para cumplir con las necesidades
#Tambien agregamos la información correspondiente al paciente y a cada una de sus citas y la historia clínica que este genero
#a
insert into sede (id_Sede, Nombre_Sede) values ("S001", "Zona Centro");
insert into Medico (id_Medico, Nombre, Telefono, Direccion_Residencia, Especialidad, id_Sede) values ("M001", "Monica Fonseca", "", "", "", "S001");
insert into Paciente (id_Paciente, Nombre_Mascota, Nombre_Dueno, Numero_Documento, Telefono, Direccion_Residencia, Raza, Genero, Esteril, Edad, id_Documento, id_Especie) values ("P001", "Pepe", "Ignacio Peréz", "10203040", "3124567890", "Calle 70 #5-20", "Criollo", "Masculino", "No", 0, "CC", "001");
insert into cita (id_Sede, id_Paciente, fecha_Cita) values ("S001", "P001", "2014-06-13");
insert into Historia_Clinica (id_Historia_Clin, Motivo, Diagnostico, Tratamiento, Fecha_Cita, id_Medico, id_Paciente) values ("H001", "Moquillo", "Moquillo", "Neubolizaciones", "2014-06-13", "M001", "P001");
insert into cita (id_Sede, id_Paciente, fecha_Cita) values ("S001", "P001", "2015-12-12");
insert into Historia_Clinica (id_Historia_Clin, Motivo, Diagnostico, Tratamiento, Fecha_Cita, id_Medico, id_Paciente) values ("H002", "Control General", "NA", "NA", "2015-12-12", "M001", "P001");

#Se agrega la información del paciente y sus citas, en este caso no es necesario agregar un nuevo medico ya que es el mismo que a esta registrado en la bd
#b
insert into Paciente (id_Paciente, Nombre_Mascota, Nombre_Dueno, Numero_Documento, Telefono, Direccion_Residencia, Raza, Genero, Esteril, Edad, id_Documento, id_Especie) values ("P002", "Pirulita", "María Romero", "10203040", "3207890123", "Carrera 20 #15-90", "Calica", "Hembra", "No", 0, "CE", "002");
insert into cita (id_Sede, id_Paciente, fecha_Cita) values ("S001", "P002", "2018-08-26");
insert into Historia_Clinica (id_Historia_Clin, Motivo, Diagnostico, Tratamiento, Fecha_Cita, id_Medico, id_Paciente) values ("H003", "Conjuntivitis", "Conjuntivitis", "Gotas Oculares", "2018-08-26", "M001", "P002");
insert into cita (id_Sede, id_Paciente, fecha_Cita) values ("S001", "P002", "2020-09-27");
insert into Historia_Clinica (id_Historia_Clin, Motivo, Diagnostico, Tratamiento, Fecha_Cita, id_Medico, id_Paciente) values ("H004", "Parvovirus", "Parvovirus", "Gomitas de medicamento", "2020-09-27", "M001", "P002");

#Se agrega información de un nuevo médico y del paciente al igual que la información de sus citas e historias clínicas
#c
insert into Paciente (id_Paciente, Nombre_Mascota, Nombre_Dueno, Numero_Documento, Telefono, Direccion_Residencia, Raza, Genero, Esteril, Edad, id_Documento, id_Especie) values ("P003", "Luna", "Ignacio Peréz", "10203040", "3124567890", "Calle 70 #5-20", "French Poodle", "Hembra", "No", 0, "CC", "001");
insert into Medico (id_Medico, Nombre, Telefono, Direccion_Residencia, Especialidad, id_Sede) values ("M002", "Mauricio Torres", "", "", "", "S001");
insert into cita (id_Sede, id_Paciente, fecha_Cita) values ("S001", "P003", "2014-04-13");
insert into Historia_Clinica (id_Historia_Clin, Motivo, Diagnostico, Tratamiento, Fecha_Cita, id_Medico, id_Paciente) values ("H005", "Gastroenteritis", "Gastroenteritis", "Medicación intravenosa", "2014-04-13", "M002", "P003");
insert into cita (id_Sede, id_Paciente, fecha_Cita) values ("S001", "P003", "2015-12-12");
insert into Historia_Clinica (id_Historia_Clin, Motivo, Diagnostico, Tratamiento, Fecha_Cita, id_Medico, id_Paciente) values ("H006", "Control General", "NA", "NA", "2015-12-12", "M002", "P003");

#Se agrega la información del paciente y sus citas
#d
insert into Paciente (id_Paciente, Nombre_Mascota, Nombre_Dueno, Numero_Documento, Telefono, Direccion_Residencia, Raza, Genero, Esteril, Edad, id_Documento, id_Especie) values ("P004", "Nala", "Carlos Peralta", "10506070", "3504563276", "Calle 100 #24-56", "Carey", "Hembra", "No", 0, "CC", "002");
insert into cita (id_Sede, id_Paciente, fecha_Cita) values ("S001", "P004", "2020-10-20");
insert into Historia_Clinica (id_Historia_Clin, Motivo, Diagnostico, Tratamiento, Fecha_Cita, id_Medico, id_Paciente) values ("H007", "Desviación en la columna vertebral", "Desviación en la columna vertebral", "Terapias de acupuntura", "2020-10-20", "M001", "P004");

#Se agrega la información del paciente, un medico y una nueva sede que no habia sido mencionada previamente, posterior se agrega la información de las citas e historia clínica del paciente.
#e
insert into Paciente (id_Paciente, Nombre_Mascota, Nombre_Dueno, Numero_Documento, Telefono, Direccion_Residencia, Raza, Genero, Esteril, Edad, id_Documento, id_Especie) values ("P005", "Hope", "Valentina Rivera", "10809020", "3509703579", "Carrera 50 #116-38", "Golden Retriever", "Hembra", "No", 0, "TI", "001");
insert into sede (id_Sede, Nombre_Sede) values ("S002", "Zona Norte");
insert into Medico (id_Medico, Nombre, Telefono, Direccion_Residencia, Especialidad, id_Sede) values ("M003", "Mauricio Vanegas", "", "", "", "S002");
insert into cita (id_Sede, id_Paciente, fecha_Cita) values ("S002", "P005", "2022-03-01");
insert into Historia_Clinica (id_Historia_Clin, Motivo, Diagnostico, Tratamiento, Fecha_Cita, id_Medico, id_Paciente) values ("H008", "Erlichia", "Erlichia", "Dipirona", "2022-03-01", "M003", "P005");
insert into cita (id_Sede, id_Paciente, fecha_Cita) values ("S002", "P005", "2022-09-02");
insert into Historia_Clinica (id_Historia_Clin, Motivo, Diagnostico, Tratamiento, Fecha_Cita, id_Medico, id_Paciente) values ("H009", "Gastroenteritis", "Gastroenteritis", "Medicación intravenosa", "2022-09-02", "M003", "P005");

#2
#Se consulta el numero de documento, tipo de documento por un left join a la tbala documentos, el nombre de la especie por un left join a la tabla especie, luego hacemos un conteo del id_paciente sin embargo le agregamos
#la palabra reservada distinct para que nos cuente unicos y evitar duplicidad y finalmente contamos las historias clinicas para saber cuantas veces ha asisitido cada paciente a la veterinaria
select 
	p.numero_documento
    ,d.Tipo_Documento
    ,e.Nombre_Especie
    ,COUNT(distinct p.id_Paciente)
    ,COUNT(hc.id_Historia_Clin)
from paciente as p
left join documento as d
on p.id_Documento = d.id_Documento
left join especie as e
on p.id_Especie = e.id_Especie
left join historia_clinica as hc
on p.id_Paciente = hc.id_Paciente
group by 
	p.numero_documento
    ,d.Tipo_Documento
    ,e.Nombre_Especie

#3
#Por medio de un case when se define el tipo de mascota que es, se usa la palabra reseravda IN para poder ingresar multiples resultados en una misma comparación
select 
case 
	when e.Nombre_Especie in ('Perro', 'Gato', 'Conejo') then 'Doméstico'
    when e.Nombre_Especie in ('Serpiente', 'Tirge', 'Leon') then 'Salvaje'
end as tipo_mascota
from paciente as p
left join especie as e
on p.id_Especie = e.id_Especie;

#4
#Seleccionamos los tipos de documentos unicos que han asisitido a la veterinaria
select 
distinct d.tipo_documento
from paciente as p
left join documento as d
on p.id_Documento = d.id_Documento;