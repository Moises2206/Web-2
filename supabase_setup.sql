-- Ejecuta este script en el SQL Editor de Supabase
-- para crear la tabla necesaria para la API

CREATE TABLE recipes (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title TEXT NOT NULL,
    ingredients TEXT NOT NULL,
    instructions TEXT NOT NULL,
    author TEXT NOT NULL,
    ai_summary TEXT
);

-- Opcional: insertar datos de prueba
INSERT INTO recipes (title, ingredients, instructions, author)
VALUES (
    'Arepas con queso',
    '2 tazas de harina de maíz, 1 taza de agua tibia, sal al gusto, queso mozzarella',
    'Mezclar harina con agua y sal. Formar arepas y cocinar en sartén 5 min por lado. Rellenar con queso.',
    'María García'
);
