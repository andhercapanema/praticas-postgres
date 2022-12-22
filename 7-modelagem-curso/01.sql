CREATE DATABASE "pratica_modelagem_curso";

CREATE TABLE "classes" (
    id SERIAL NOT NULL PRIMARY KEY,
    key TEXT NOT NULL UNIQUE
);

CREATE TABLE "students" (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    current_class_id INTEGER NOT NULL REFERENCES classes(id)
);

CREATE TABLE "students_history" (
    id SERIAL NOT NULL PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES students(id),
    class_id INTEGER NOT NULL REFERENCES classes(id),
    start_date DATE NOT NULL DEFAULT NOW(),
    end_date DATE
);

CREATE TABLE "modules" (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE "projects" (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    module_id INTEGER NOT NULL REFERENCES module(id),
);

CREATE TYPE grade_type AS ENUM ('Abaixo das expectativas', 'Dentro das Expectativas', 'Acima das Expectativas');

CREATE TABLE "projects_submission" (
    id SERIAL NOT NULL PRIMARY KEY,
    date DATE NOT NULL DEFAULT NOW(),
    grade grade_type NOT NULL,
    project_id INTEGER NOT NULL REFERENCES projects(id),
    student_id INTEGER NOT NULL REFERENCES students(id)
);
