-- Base de datos para una barbería
--clientes: tiene el nombre, teléfono y correo.
--barberos: tiene el nombre, especialidad y teléfono del trabajador.
--servicios: tiene el nombre del servicio (por ejemplo: Corte de cabello) y su precio.
--citas: guarda cuándo viene el cliente, qué barbero lo atiende y qué servicio se hace.
--ventas: registra cuánto pagó el cliente y con qué método--
-- Crear la base de datos de la barbería
CREATE DATABASE barberia_db;
USE barberia_db;

-- Tabla de CLIENTES (personas que van a la barbería)
CREATE TABLE clientes (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único que se incrementa automáticamente
  nombre VARCHAR(100) NOT NULL,               -- Nombre del cliente (campo obligatorio)
  telefono VARCHAR(20),                       -- Número de teléfono (puede quedar vacío)
  email VARCHAR(100)                          -- Correo electrónico (puede quedar vacío)
);

-- Tabla de BARBEROS (empleados de la barbería)
CREATE TABLE barberos (
  id_barbero INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único para cada barbero
  nombre VARCHAR(100) NOT NULL,               -- Nombre del barbero
  especialidad VARCHAR(100),                  -- Tipo de cortes o servicios en los que se especializa
  telefono VARCHAR(20)                        -- Teléfono del barbero
);

-- Tabla de SERVICIOS (lista de servicios que ofrece la barbería)
CREATE TABLE servicios (
  id_servicio INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único del servicio
  nombre_servicio VARCHAR(100) NOT NULL,      -- Nombre del servicio (ej: corte, barba, cejas, etc.)
  precio DECIMAL(10,2) NOT NULL               -- Precio del servicio con dos decimales
);

-- Tabla de CITAS (agenda de las reservas de los clientes)
CREATE TABLE citas (
  id_cita INT AUTO_INCREMENT PRIMARY KEY,     -- Identificador único de la cita
  id_cliente INT,                             -- Relación con el cliente (quién pidió la cita)
  id_barbero INT,                             -- Relación con el barbero (quién atenderá)
  id_servicio INT,                            -- Relación con el servicio (qué se hará)
  fecha_cita DATE,                            -- Día de la cita
  hora_cita TIME,                             -- Hora de la cita
  estado ENUM('pendiente','completada','cancelada') DEFAULT 'pendiente',  -- Estado actual de la cita
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),   -- Conecta con la tabla clientes
  FOREIGN KEY (id_barbero) REFERENCES barberos(id_barbero),   -- Conecta con la tabla barberos
  FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio) -- Conecta con la tabla servicios
);

-- Tabla de VENTAS (registro de los pagos realizados)
CREATE TABLE ventas (
  id_venta INT AUTO_INCREMENT PRIMARY KEY,     -- Identificador único de la venta
  id_cita INT,                                 -- Relación con la cita (de qué servicio proviene el pago)
  metodo_pago ENUM('efectivo','tarjeta','transferencia'),  -- Forma de pago utilizada
  total DECIMAL(10,2),                         -- Monto total pagado
  fecha_pago DATE,                             -- Fecha del pago
  FOREIGN KEY (id_cita) REFERENCES citas(id_cita)  -- Conecta con la tabla citas
);
