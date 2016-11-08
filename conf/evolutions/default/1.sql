# TEMPERATURE SCHEMA

# --- !Ups

CREATE TABLE TEMPERATURES (
  ID          INTEGER          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  TIMESTAMP   TIMESTAMP        NOT NULL,
  TEMPERATURE DOUBLE PRECISION NOT NULL
);


# --- !Downs

DROP TABLE TEMPERATURE;
