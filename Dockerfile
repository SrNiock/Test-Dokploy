# --- Etapa 1: Construcción (Build) ---
# Usamos una imagen que ya tiene Flutter instalado
FROM ghcr.io/cirruslabs/flutter:stable AS build

# Establecemos el directorio de trabajo
WORKDIR /app

# Copiamos los archivos de configuración primero (para aprovechar caché)
COPY pubspec.yaml ./

# Obtenemos las dependencias
RUN flutter pub get

# Copiamos todo el código fuente
COPY . .

# Construimos la versión web
RUN flutter build web --release

# --- Etapa 2: Servidor (Production) ---
# Usamos Nginx para servir los archivos estáticos (muy rápido)
FROM nginx:alpine

# Copiamos los archivos construidos en la etapa anterior a la carpeta de Nginx
COPY --from=build /app/build/web /usr/share/nginx/html

# Exponemos el puerto 80
EXPOSE 80

# Arrancamos Nginx
CMD ["nginx", "-g", "daemon off;"]
