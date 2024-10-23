# Usa una imagen base de Node.js
FROM node:14


# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copiar los archivos package.json y package-lock.json al contenedor
COPY package*.json ./

# Instalar las dependencias
RUN npm install

# Copiar el resto de los archivos al contenedor
COPY . .

# Exponer el puerto que usa la aplicación (puede ser 8080 o el puerto que uses)
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["npm", "start"]
