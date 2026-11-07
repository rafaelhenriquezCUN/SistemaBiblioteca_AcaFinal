CREATE DATABASE BibliotecaAca;
GO
USE BibliotecaAca;
GO

CREATE TABLE Autores (
    IdAutor INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Apellido NVARCHAR(50) NOT NULL
);

CREATE TABLE Editoriales (
    IdEditorial INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL
);

CREATE TABLE Usuarios (
    IdUsuario INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Apellido NVARCHAR(50) NOT NULL,
    Documento NVARCHAR(20) UNIQUE NOT NULL,
    Telefono NVARCHAR(20),
    Correo NVARCHAR(100)
);

CREATE TABLE Libros (
    IdLibro INT IDENTITY(1,1) PRIMARY KEY,
    Codigo NVARCHAR(20) UNIQUE NOT NULL,
    Titulo NVARCHAR(100) NOT NULL,
    IdAutor INT FOREIGN KEY REFERENCES Autores(IdAutor),
    IdEditorial INT FOREIGN KEY REFERENCES Editoriales(IdEditorial)
);

CREATE TABLE Prestamos (
    IdPrestamo INT IDENTITY(1,1) PRIMARY KEY,
    IdUsuario INT FOREIGN KEY REFERENCES Usuarios(IdUsuario),
    IdLibro INT FOREIGN KEY REFERENCES Libros(IdLibro),
    FechaPrestamo DATE NOT NULL,
    FechaDevolucion DATE,
    Estado NVARCHAR(20) DEFAULT 'Prestado'
);