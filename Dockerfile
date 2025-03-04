# Usa una imagen base con Python
FROM python:3.9

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de configuración y documentación
COPY requirements.txt mkdocs.yml /app/
COPY docs /app/docs

# Instala MkDocs y las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Expone el puerto 8000 (puerto por defecto de MkDocs)
EXPOSE 9000

# Comando para ejecutar MkDocs en modo servidor
CMD ["mkdocs", "serve", "-a", "0.0.0.0:9000"]
