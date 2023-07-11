CREATE TABLE `Tab_usuarios` (
	`id_usu` INT NOT NULL AUTO_INCREMENT,
	`nom_usu` varchar(30) NOT NULL,
	`pass` INT(10) NOT NULL,
	`tipo_usu` varchar(20) NOT NULL,
	`curp` INT(13) NOT NULL,
	`num_tel` INT(10) NOT NULL,
	`email_usu` varchar(30) NOT NULL,
	`dir_usu` varchar(50) NOT NULL,
	`turno` varchar(15) NOT NULL,
	`id_sucu` INT NOT NULL,
	PRIMARY KEY (`id_usu`)
);

CREATE TABLE `Tab_productos` (
	`id_prod` INT NOT NULL AUTO_INCREMENT,
	`codigo` INT(50) NOT NULL,
	`nom_prod` varchar(50) NOT NULL,
	`descripcion` varchar(50) NOT NULL,
	`marca` varchar(30) NOT NULL,
	`area` varchar(30) NOT NULL,
	`precio_com` BOOLEAN NOT NULL,
	`precio_vent` BOOLEAN NOT NULL,
	`piezas` INT(20) NOT NULL,
	PRIMARY KEY (`id_prod`)
);

CREATE TABLE `Tab_venta` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`fecha` DATETIME NOT NULL,
	`nom_cli` varchar(50) NOT NULL,
	`tel_cli` INT(10) NOT NULL,
	`codigo` INT(50) NOT NULL,
	`nom_prod` varchar(50) NOT NULL,
	`descripcion` varchar(50) NOT NULL,
	`marca` varchar(30) NOT NULL,
	`precio_venta` BOOLEAN NOT NULL,
	`sub_total` BOOLEAN NOT NULL,
	`total` BOOLEAN NOT NULL,
	`id_usu` varchar(30) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Tab_proveedor` (
	`id_prov` INT NOT NULL AUTO_INCREMENT,
	`empresa` varchar(30) NOT NULL,
	`nom_prov` varchar(30) NOT NULL,
	`tel_prov` INT(10) NOT NULL,
	`email_prov` varchar(30) NOT NULL,
	`dir_prov` varchar(50) NOT NULL,
	PRIMARY KEY (`id_prov`)
);

CREATE TABLE `Tab_sucursal` (
	`id_suc` INT NOT NULL AUTO_INCREMENT,
	`nom_sucu` varchar(30) NOT NULL,
	`dir_sucu` varchar(50) NOT NULL,
	`tel_sucu` INT(10) NOT NULL,
	PRIMARY KEY (`id_suc`)
);

CREATE TABLE `Tab_compra` (
	`id_comp` INT NOT NULL AUTO_INCREMENT,
	`fecha_comp` DATETIME NOT NULL,
	`piezas_comp` INT(20) NOT NULL,
	`total` BOOLEAN NOT NULL,
	`id_usu` INT NOT NULL,
	`id_prov` INT NOT NULL,
	PRIMARY KEY (`id_comp`)
);

ALTER TABLE `Tab_usuarios` ADD CONSTRAINT `Tab_usuarios_fk0` FOREIGN KEY (`id_sucu`) REFERENCES `Tab_sucursal`(`id_suc`);

ALTER TABLE `Tab_venta` ADD CONSTRAINT `Tab_venta_fk0` FOREIGN KEY (`codigo`) REFERENCES `Tab_productos`(`codigo`);

ALTER TABLE `Tab_venta` ADD CONSTRAINT `Tab_venta_fk1` FOREIGN KEY (`nom_prod`) REFERENCES `Tab_productos`(`nom_prod`);

ALTER TABLE `Tab_venta` ADD CONSTRAINT `Tab_venta_fk2` FOREIGN KEY (`descripcion`) REFERENCES `Tab_productos`(`descripcion`);

ALTER TABLE `Tab_venta` ADD CONSTRAINT `Tab_venta_fk3` FOREIGN KEY (`marca`) REFERENCES `Tab_productos`(`marca`);

ALTER TABLE `Tab_venta` ADD CONSTRAINT `Tab_venta_fk4` FOREIGN KEY (`precio_venta`) REFERENCES `Tab_productos`(`precio_vent`);

ALTER TABLE `Tab_venta` ADD CONSTRAINT `Tab_venta_fk5` FOREIGN KEY (`id_usu`) REFERENCES `Tab_usuarios`(`id_usu`);

ALTER TABLE `Tab_compra` ADD CONSTRAINT `Tab_compra_fk0` FOREIGN KEY (`id_usu`) REFERENCES `Tab_usuarios`(`id_usu`);

ALTER TABLE `Tab_compra` ADD CONSTRAINT `Tab_compra_fk1` FOREIGN KEY (`id_prov`) REFERENCES `Tab_proveedor`(`id_prov`);







