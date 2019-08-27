PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS membership_type (
	id
		INTEGER PRIMARY KEY,
	name
		VARCHAR(16)
		NOT NULL
		DEFAULT NULL,
	nice_name
		VARCHAR(32)
		DEFAULT NULL,
	description
		TEXT
		DEFAULT NULL
);

CREATE UNIQUE INDEX membership_name_uk
 	ON membership_type (name);

CREATE UNIQUE INDEX membership_nice_name_uk
 	ON membership_type (nice_name);

INSERT INTO membership_type
	VALUES
		( 1, 'basic',   'Basic Membership',   NULL),
		(42, 'premium', 'Premium Membership', NULL);

---------------------------------------

CREATE TABLE IF NOT EXISTS role_type (
	id
		INTEGER PRIMARY KEY,
	name
		VARCHAR(16)
		NOT NULL
		DEFAULT NULL,
	nice_name
		VARCHAR(32)
		NOT NULL
		DEFAULT NULL,
	description
		TEXT DEFAULT NULL
);

CREATE UNIQUE INDEX role_type_name_uk
 	ON role_type (name);

CREATE UNIQUE INDEX role_type_nice_name_uk
 	ON role_type (nice_name);

INSERT INTO role_type
	VALUES
		( 1, 'registered_user', 'Registered User', NULL),
		(42, 'global_admin',    'Global Admin',    NULL);

---------------------------------------

CREATE TABLE IF NOT EXISTS membership (
	id
		INTEGER PRIMARY KEY,
	type_id
	 	INTEGER
	 	NOT NULL
	 	DEFAULT NULL,
	 user_id
	 	INTEGER
	 	NOT NULL
	 	DEFAULT NULL,
	 status
	 	VARCHAR(16)
	 	NOT NULL
	 	DEFAULT 'initialized'
	 	CHECK (status IN ('initialized','active','suspended','cancelled','expired','pending','deleted')),
	 start_date
	  	DATETIME
	  	DEFAULT NULL,
	 duration
	 	INTEGER
	 	NOT NULL
	 	DEFAULT '0',
	 created_at
	 	DATETIME
	 		NOT NULL
	 		DEFAULT CURRENT_TIMESTAMP,
	 modified_at
	 	DATETIME
	 	DEFAULT NULL,

	FOREIGN KEY (user_id)
		REFERENCES user (id),

	FOREIGN KEY (type_id)
		REFERENCES membership_type (id)
);

CREATE INDEX membership_user_type_status_key
 	ON membership (user_id, type_id, status);

CREATE TRIGGER UPDATE_MEMBERSHIP
	AFTER UPDATE ON membership
   	BEGIN
   		UPDATE membership
   		SET modified_at = CURRENT_TIMESTAMP
   		WHERE rowid = new.rowid;
   	END;

---------------------------------------

CREATE TABLE IF NOT EXISTS role(
	id
		INTEGER PRIMARY KEY
		NOT NULL,
	type_id
		INTEGER
		NOT NULL
		DEFAULT NULL,
	user_id
		INTEGER
		NOT NULL
		DEFAULT NULL,
	created_at
	 	DATETIME
	 	NOT NULL
	 	DEFAULT CURRENT_TIMESTAMP,
	modified_at
		DATETIME,

	FOREIGN KEY (user_id)
		REFERENCES user (id),

	FOREIGN KEY (type_id)
		REFERENCES role_type (id)
);

CREATE UNIQUE INDEX role_user_type_uk
	ON role (user_id, type_id);

CREATE TRIGGER UPDATE_ROLE
	AFTER UPDATE ON role
   	BEGIN
   		UPDATE role
   		SET modified_at = CURRENT_TIMESTAMP
   		WHERE rowid = new.rowid;
   	END;

---------------------------------------

CREATE TABLE IF NOT EXISTS user(
	id
		INTEGER PRIMARY KEY
		NOT NULL
		DEFAULT NULL,
	username
		VARCHAR(16)
		NOT NULL
		DEFAULT NULL,
	email
		VARCHAR(128)
		NOT NULL
		DEFAULT NULL,
	status
	 	VARCHAR(16)
	 	NOT NULL
	 	DEFAULT 'pending'
	 	CHECK (status IN ('pending','active','suspended','deleted')),
	first_name
		VARCHAR(16)
		NOT NULL
		DEFAULT NULL,
	last_name
		VARCHAR(16)
		NOT NULL
		DEFAULT NULL,
	created_at
		DATETIME
		NOT NULL
		DEFAULT CURRENT_TIMESTAMP,
	modified_at
		DATETIME
		DEFAULT NULL, 
	passphrase
		VARCHAR(48)
		NOT NULL
		DEFAULT NULL,
	change_password
		BOOLEAN
		NOT NULL
		DEFAULT 0
		CHECK (change_password IN (0,1)),
	is_test
		BOOLEAN
		NOT NULL
		DEFAULT 0
		CHECK (is_test IN (0,1))
);

CREATE UNIQUE INDEX user_username_uk
	ON user (username);

CREATE UNIQUE INDEX user_email_uk
	ON user (email);

CREATE INDEX user_last_name_key
	ON user (last_name);

CREATE TRIGGER UPDATE_USER
	AFTER UPDATE ON user
   	BEGIN
   		UPDATE user
   		SET modified_at = CURRENT_TIMESTAMP
   		WHERE rowid = new.rowid;
   	END;

---------------------------------------

COMMIT;

---------------------------------------