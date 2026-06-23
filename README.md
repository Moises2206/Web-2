# 🍽️ Recipes API

API REST para gestión de recetas con análisis inteligente usando **FastAPI**, **Supabase** y **OpenAI**.

---

## 📋 Descripción

Este proyecto es una API REST desarrollada con FastAPI que permite gestionar recetas de cocina. Incluye operaciones CRUD completas y un endpoint de análisis con inteligencia artificial que evalúa la dificultad, el tiempo estimado y genera un resumen de cada receta.

---

## 🛠️ Tecnologías utilizadas

| Tecnología | Uso |
|---|---|
| **FastAPI** | Framework principal de la API |
| **Supabase** | Base de datos PostgreSQL en la nube |
| **OpenAI GPT-3.5** | Análisis inteligente de recetas |
| **Pydantic** | Validación de datos y esquemas |
| **Uvicorn** | Servidor ASGI para ejecutar la app |

---

## 📁 Estructura del proyecto

```
project/
│
├── core/
│   ├── __init__.py
│   └── config.py           # Variables de entorno con Pydantic Settings
│
├── database/
│   ├── __init__.py
│   └── supabase.py         # Cliente de Supabase
│
├── routes/
│   ├── __init__.py
│   └── recipes.py          # Endpoints CRUD + análisis IA
│
├── schemas/
│   ├── __init__.py
│   └── recipe_schema.py    # Modelos Pydantic (request/response)
│
├── services/
│   ├── __init__.py
│   └── ai_service.py       # Integración con OpenAI
│
├── docs/
│   └── screenshots/        # Capturas de pruebas
│
├── main.py                 # Punto de entrada de la aplicación
├── requirements.txt        # Dependencias del proyecto
├── .env.example            # Ejemplo de variables de entorno
├── .gitignore
└── README.md
```

---

## ⚙️ Instalación y configuración

### 1. Clonar el repositorio

```bash
git clone https://github.com/tu-usuario/recipes-api.git
cd recipes-api
```

### 2. Crear entorno virtual

```bash
python -m venv venv

# Windows
venv\Scripts\activate

# Mac / Linux
source venv/bin/activate
```

### 3. Instalar dependencias

```bash
pip install -r requirements.txt
```

### 4. Configurar variables de entorno

Crea un archivo `.env` basado en `.env.example`:

```bash
cp .env.example .env
```

Edita `.env` con tus credenciales:

```env
SUPABASE_URL=https://your-project-id.supabase.co
SUPABASE_KEY=your-supabase-anon-key
OPENAI_API_KEY=sk-your-openai-api-key
```

### 5. Crear la tabla en Supabase

Ejecuta el siguiente SQL en el **SQL Editor** de Supabase:

```sql
CREATE TABLE recipes (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title TEXT NOT NULL,
    ingredients TEXT NOT NULL,
    instructions TEXT NOT NULL,
    author TEXT NOT NULL,
    ai_summary TEXT
);
```

### 6. Ejecutar el servidor

```bash
uvicorn main:app --reload
```

La API estará disponible en: [http://127.0.0.1:8000](http://127.0.0.1:8000)

Documentación automática: [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)

---

## 🔗 Endpoints

| Método | Endpoint | Descripción |
|---|---|---|
| `GET` | `/recipes` | Listar todas las recetas |
| `GET` | `/recipes/{id}` | Obtener una receta por ID |
| `POST` | `/recipes` | Crear una nueva receta |
| `PUT` | `/recipes/{id}` | Actualizar una receta |
| `DELETE` | `/recipes/{id}` | Eliminar una receta |
| `POST` | `/recipes/analyze` | Analizar una receta con IA |

---

## 📌 Ejemplos de uso

### Crear una receta

**Request:**
```http
POST /recipes
Content-Type: application/json

{
  "title": "Arepas con queso",
  "ingredients": "2 tazas de harina de maíz, 1 taza de agua tibia, sal al gusto, queso mozzarella",
  "instructions": "Mezclar harina con agua y sal. Formar arepas y cocinar en sartén 5 min por lado. Rellenar con queso.",
  "author": "María García"
}
```

**Response:**
```json
{
  "id": 1,
  "title": "Arepas con queso",
  "ingredients": "2 tazas de harina de maíz, 1 taza de agua tibia, sal al gusto, queso mozzarella",
  "instructions": "Mezclar harina con agua y sal. Formar arepas y cocinar en sartén 5 min por lado. Rellenar con queso.",
  "author": "María García",
  "ai_summary": null
}
```

### Analizar una receta con IA

**Request:**
```http
POST /recipes/analyze
Content-Type: application/json

{
  "title": "Arepas con queso",
  "ingredients": "2 tazas de harina de maíz, 1 taza de agua tibia, sal al gusto, queso mozzarella",
  "instructions": "Mezclar harina con agua y sal. Formar arepas y cocinar en sartén 5 min por lado. Rellenar con queso."
}
```

**Response:**
```json
{
  "title": "Arepas con queso",
  "ai_summary": "Receta tradicional colombiana de arepas rellenas con queso, sencilla y rápida de preparar.",
  "difficulty": "Fácil",
  "estimated_time": "20 minutos"
}
```

---

## 🧪 Pruebas de la API

### ✅ Prueba válida 1 — Crear una receta (POST /recipes)

Petición exitosa creando una nueva receta con todos los campos requeridos.

![Prueba válida 1](docs/screenshots/test-valid-1.png)

---

### ✅ Prueba válida 2 — Analizar con IA (POST /recipes/analyze)

El endpoint de IA devuelve un resumen, dificultad y tiempo estimado de la receta.

![Prueba válida 2](docs/screenshots/test-valid-2.png)

---

### ❌ Prueba inválida — Campos vacíos (POST /recipes)

FastAPI valida automáticamente los campos requeridos y devuelve un error 422.

![Prueba inválida](docs/screenshots/test-invalid-1.png)

---

## 🗄️ Tabla en Supabase

La tabla `recipes` fue creada en Supabase con la siguiente estructura:

| Columna | Tipo | Descripción |
|---|---|---|
| `id` | BIGINT | Clave primaria autoincremental |
| `title` | TEXT | Título de la receta |
| `ingredients` | TEXT | Lista de ingredientes |
| `instructions` | TEXT | Pasos de preparación |
| `author` | TEXT | Nombre del autor |
| `ai_summary` | TEXT | Resumen generado por IA (opcional) |

---

## 🎥 Video de funcionamiento

📺 [Ver video en YouTube](https://youtube.com/tu-enlace-aqui)

> El video muestra: estructura del proyecto, ejecución del servidor, documentación en `/docs`, pruebas válidas e inválidas, datos en Supabase y funcionamiento del endpoint de IA.

---

## 👤 Autor

**Tu Nombre**  
Trabajo Final — Web II  
Universidad / Institución  
2025
