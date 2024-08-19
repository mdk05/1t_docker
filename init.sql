DO $$
BEGIN
   -- Проверяем, существует ли база данных, и если нет, создаем ее
   IF NOT EXISTS (
       SELECT FROM pg_database
       WHERE datname = 'kondratev'
   ) THEN
       EXECUTE 'CREATE DATABASE kondratev';
   END IF;
END
$$;

\c kondratev;

CREATE TABLE IF NOT EXISTS test_table (
    name VARCHAR(10) CHECK (LENGTH(name) BETWEEN 4 AND 10),
    surname VARCHAR(255),
    city VARCHAR(255),
    age INT CHECK (age > 0 AND age <= 150)
);

INSERT INTO test_table (name, surname, city, age) VALUES
('John', 'Doe', 'New York', 25),
('Jane', 'Smith', 'Los Angeles', 30),
('Jime', 'Brown', 'Chicago', 15),
('Anna', 'Taylor', 'Houston', 28),
('Tomy', 'Moore', 'Phoenix', 45),
('Lucy', 'Johnson', 'San Diego', 22),
('Mark', 'White', 'Dallas', 33),
('Even', 'Miller', 'San Jose', 40),
('Lisa', 'Davis', 'Austin', 27),
('Paul', 'Garcia', 'Jacksonville', 18),
('Chris', 'Martinez', 'San Francisco', 50),
('Matt', 'Robinson', 'Columbus', 60),
('Emma', 'Clark', 'Indianapolis', 35),
('Samu', 'Walker', 'Fort Worth', 20),
('Adam', 'Hall', 'Charlotte', 42),
('Elis', 'Allen', 'Seattle', 29),
('Nina', 'Young', 'Denver', 19),
('Omar', 'Hernandez', 'El Paso', 32),
('Ians', 'King', 'Boston', 55),
('Zoes', 'Scott', 'Detroit', 23);

