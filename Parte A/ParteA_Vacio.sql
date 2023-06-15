CREATE table Fundadores (
	IDFundadores INT PRIMARY KEY,
	NombreFundador	 VARCHAR(50)
);

CREATE TABLE Medios_Prensa(
	IDMedioPrensa INT PRIMARY KEY,
	NombrePrensa VARCHAR(50),
	Fundacion DATE,
	SitioWeb VARCHAR(200),
	CiudadPrensa VARCHAR(100),
	PaisPrensa VARCHAR(50),
	RegionPrensa VARCHAR(50),
	ContinentePrensa VARCHAR(50)
);	

CREATE table Noticias (
	IDNoticia INT PRIMARY KEY,
	URL_Noticia VARCHAR(200),
	XPATH_Fecha VARCHAR(200),
	XPATH_Titulo VARCHAR(200),
	XPATH_Contenido VARCHAR(200),
	IDMedioPrensaN INT,
	FOREIGN KEY (IDMedioPrensaN) REFERENCES Medios_Prensa(IDMedioPrensa)
);

CREATE TABLE Categorias(
	IDCategoria INT PRIMARY KEY,
	NombreCategoria VARCHAR(50),
	URLCategoria VARCHAR(200),
	XPATH_Url VARCHAR(200),
	IDMedioPrensaCa INT,
	FOREIGN KEY (IDMedioPrensaCa) REFERENCES Medios_Prensa(IDMedioPrensa)
);


CREATE TABLE CuentaRedSocial(
	IDCuenta INT PRIMARY KEY,
	RedSocial VARCHAR(50),
	NombreCuenta VARCHAR(50),
	NumeroSeguidores INT,
	FechaActualizo DATE,
	IDMedioPrensaC INT,
	FOREIGN KEY (IDMedioPrensaC) REFERENCES Medios_Prensa(IDMedioPrensa)
);

CREATE TABLE LoRealiza(
	IDMedioPrensa INT,
	IDFundadores INT,
	PRIMARY KEY(IDMedioPrensa,IDFundadores),
	FOREIGN KEY(IDMedioPrensa) REFERENCES Medios_Prensa(IDMedioPrensa),
	FOREIGN KEY(IDFundadores) REFERENCES Fundadores(IDFundadores)
);
