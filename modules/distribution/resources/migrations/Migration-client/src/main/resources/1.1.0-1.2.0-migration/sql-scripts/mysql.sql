CREATE TABLE IF NOT EXISTS APM_APP_DEFAULT_VERSION (
    DEFAULT_VERSION_ID INTEGER AUTO_INCREMENT,
    APP_NAME VARCHAR(256),
    APP_PROVIDER VARCHAR(256),
    DEFAULT_APP_VERSION VARCHAR(30),
    PUBLISHED_DEFAULT_APP_VERSION VARCHAR(30),
    TENANT_ID INTEGER,
PRIMARY KEY(DEFAULT_VERSION_ID)
)ENGINE INNODB;

CREATE TABLE IF NOT EXISTS APM_FAVOURITE_APPS (
   ID INTEGER  AUTO_INCREMENT,
   USER_ID VARCHAR(50) NOT NULL,
   TENANT_ID INTEGER NOT NULL,
   APP_ID INTEGER NOT NULL,
   CREATED_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (ID),
   FOREIGN KEY(APP_ID) REFERENCES APM_APP(APP_ID) ON DELETE CASCADE,
   UNIQUE (TENANT_ID,USER_ID,APP_ID)
)ENGINE INNODB;

CREATE TABLE IF NOT EXISTS APM_STORE_FAVOURITE_PAGE (
   ID INTEGER  AUTO_INCREMENT,
   USER_ID VARCHAR(50) NOT NULL,
   TENANT_ID_OF_USER INTEGER NOT NULL,
   TENANT_ID_OF_STORE INTEGER NOT NULL,
   PRIMARY KEY (ID)
)ENGINE INNODB;

CREATE TABLE IF NOT EXISTS APM_BUSINESS_OWNER(
  OWNER_ID INTEGER  AUTO_INCREMENT,
  OWNER_NAME VARCHAR(200) NOT NULL,
  OWNER_EMAIL VARCHAR(300) NOT NULL,
  OWNER_DESC VARCHAR(1500),
  OWNER_SITE VARCHAR(200),
  TENANT_ID INTEGER,
  PRIMARY KEY(OWNER_ID)
) ENGINE INNODB;

CREATE TABLE IF NOT EXISTS  APM_BUSINESS_OWNER_CUSTOM_PROPERTIES(
  OWNER_ID INTEGER,
  NAME VARCHAR(200) NOT NULL,
  VALUE VARCHAR(300) NOT NULL,
  SHOW_IN_STORE BOOLEAN NOT NULL,
  FOREIGN KEY(OWNER_ID) REFERENCES APM_BUSINESS_OWNER(OWNER_ID)
) ENGINE INNODB;


ALTER TABLE APM_API_CONSUMER_APPS ADD CONSTRAINT FOREIGN KEY (APP_CONSUMER_KEY) REFERENCES IDN_OAUTH_CONSUMER_APPS(CONSUMER_KEY) ON UPDATE CASCADE;
ALTER TABLE APM_APP ADD TREAT_AS_SITE BOOLEAN NOT NULL;

