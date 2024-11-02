DROP PROCEDURE IF EXISTS `add_employee`;
DROP PROCEDURE IF EXISTS `add_customer`;
DROP PROCEDURE IF EXISTS `add_type`;
DROP PROCEDURE IF EXISTS `add_item`;
DROP PROCEDURE IF EXISTS `add_image_item`;
DROP PROCEDURE IF EXISTS `add_other_item_info`;
DROP PROCEDURE IF EXISTS `add_invoice`;
DROP PROCEDURE IF EXISTS `add_ordered_invoice_item`;

DELIMITER //

CREATE PROCEDURE `add_employee` (
	IN fullname varchar(255),
    IN email varchar(255),
    IN password varchar(255),
    IN address varchar(255),
    IN phoneNumber varchar(255),
    IN gender bit,
    IN `position` varchar(255)
    )
BEGIN
	DECLARE new_id VARCHAR(255);
	IF `position` = 'Manager' THEN
		SELECT CONCAT('M', LPAD(COALESCE(MAX(CAST(SUBSTRING(id, 2) AS UNSIGNED)), 0) + 1, 3, '0'))
		INTO new_id
		FROM tblUser082;
	ELSEIF `position` = 'Seller' THEN
		SELECT CONCAT('S', LPAD(COALESCE(MAX(CAST(SUBSTRING(id, 2) AS UNSIGNED)), 0) + 1, 3, '0'))
		INTO new_id
		FROM tblUser082;
	ELSEIF `position` = 'Shipper' THEN
		SELECT CONCAT('Sh', LPAD(COALESCE(MAX(CAST(SUBSTRING(id, 3) AS UNSIGNED)), 0) + 1, 3, '0'))
		INTO new_id
		FROM tblUser082;
	END IF;

	insert into tblUser082 (id, fullname, email, password, address, phoneNumber, gender)
    values (new_id, fullname, email, password, address, phoneNumber, gender);
    insert into tblEmployee082 (position, idUser)
    values (position, new_id);
END //

CREATE PROCEDURE `add_customer` (
	IN fullname varchar(255),
    IN email varchar(255),
    IN password varchar(255),
    IN address varchar(255),
    IN phoneNumber varchar(255),
    IN gender bit
    )
BEGIN
	DECLARE new_id VARCHAR(255);
    SELECT CONCAT('C', LPAD(COALESCE(MAX(CAST(SUBSTRING(id, 2) AS UNSIGNED)), 0) + 1, 3, '0'))
	INTO new_id
	FROM tblUser082;

	insert into tblUser082 (id, fullname, email, password, address, phoneNumber, gender)
    values (new_id, fullname, email, password, address, phoneNumber, gender);
    insert into tblCustomer082 (isMember, idUser)
    values (0, new_id);
END //

CREATE PROCEDURE `add_type` (
	IN name varchar(255),
    IN idParentType varchar(255)
    )
BEGIN
	DECLARE new_id VARCHAR(255);
    SELECT CONCAT('T', LPAD(COALESCE(MAX(CAST(SUBSTRING(id, 2) AS UNSIGNED)), 0) + 1, 3, '0'))
	INTO new_id
	FROM tblType082;

	insert into tblType082 (id, name, idParentType)
    values (new_id, name, idParentType);
END //

CREATE PROCEDURE `add_item` (
	IN nameItem varchar(255),
    IN brand varchar(255),
    IN idType varchar(255),
    IN unit varchar(255),
    IN exportedPrice float,
    OUT idItem varchar(255)
    )
BEGIN
	DECLARE new_id VARCHAR(255);
    SELECT CONCAT('I', LPAD(COALESCE(MAX(CAST(SUBSTRING(id, 2) AS UNSIGNED)), 0) + 1, 3, '0'))
	INTO new_id
	FROM tblItem082;

	insert into tblItem082 (id, nameItem, brand, idType, unit, exportedPrice)
    values (new_id, nameItem, brand, idType, unit, exportedPrice);
    SET idItem = new_id;
END //

CREATE PROCEDURE `add_image_item` (
	IN idItem varchar(255),
    IN link varchar(255)
    )
BEGIN
	DECLARE new_id VARCHAR(255);
    SELECT CONCAT('IT', LPAD(COALESCE(MAX(CAST(SUBSTRING(id, 3) AS UNSIGNED)), 0) + 1, 3, '0'))
	INTO new_id
	FROM tblImageItem082;

	insert into tblImageItem082 (id, idItem, link)
    values (new_id, idItem, link);
END //

CREATE PROCEDURE `add_other_item_info` (
	IN idItem varchar(255),
    IN nameInfo varchar(255),
    IN detailInfo varchar(255)
    )
BEGIN
	DECLARE new_id VARCHAR(255);
    SELECT CONCAT('OIInfo', LPAD(COALESCE(MAX(CAST(SUBSTRING(id, 7) AS UNSIGNED)), 0) + 1, 3, '0'))
	INTO new_id
	FROM tblOtherItemInfo082;

	insert into tblOtherItemInfo082 (id, idItem, nameInfo, detailInfo)
    values (new_id, idItem, nameInfo, detailInfo);
END //

CREATE PROCEDURE `add_invoice` (
	IN idCustomer varchar(255),
    IN totalPrice float,
    OUT idInvoice varchar(255)
    )
BEGIN
	DECLARE new_id VARCHAR(255);
    SELECT CONCAT('In', LPAD(COALESCE(MAX(CAST(SUBSTRING(id, 3) AS UNSIGNED)), 0) + 1, 3, '0'))
	INTO new_id
	FROM tblInvoice082;

	insert into tblInvoice082 (id, orderingTime, idCustomer, state, totalPrice)
    values (new_id, NOW(), idCustomer, 'Chưa duyệt', totalPrice);

    SET idInvoice = new_id;
END //

CREATE PROCEDURE `add_ordered_invoice_item` (
	IN idItem varchar(255),
    IN idInvoice varchar(255),
    IN orderedQuanity int(10)
    )
BEGIN
	DECLARE new_id VARCHAR(255);
    SELECT CONCAT('OII', LPAD(COALESCE(MAX(CAST(SUBSTRING(id, 4) AS UNSIGNED)), 0) + 1, 3, '0'))
	INTO new_id
	FROM tblOrderedInvoiceItem082;

	insert into tblOrderedInvoiceItem082 (id, idItem, idInvoice, orderedQuanity)
    values (new_id, idItem, idInvoice, orderedQuanity);

END //

DELIMITER ;
