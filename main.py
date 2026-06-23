from fastapi import FastAPI
from routes.recipes import router as recipes_router

app = FastAPI(
    title="Recipes API",
    description="API REST para gestión de recetas con análisis de IA usando FastAPI y Supabase.",
    version="1.0.0",
)

app.include_router(recipes_router)


@app.get("/", tags=["Root"])
def root():
    return {
        "message": "Bienvenido a la Recipes API 🍽️",
        "docs": "/docs",
        "version": "1.0.0",
    }
