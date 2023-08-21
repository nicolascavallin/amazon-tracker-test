# Usar una versión reciente de Node.js
FROM node:18-alpine

# Crear un directorio específico para la aplicación y establecer permisos
RUN mkdir -p /usr/src/app/node_modules && chown -R node:node /usr/src/app

# Establecer el directorio de trabajo
WORKDIR /usr/src/app

# Cambiar al usuario 'node' para evitar ejecutar comandos como root
USER node

# Copiar los archivos de dependencias primero para aprovechar la caché de Docker
COPY --chown=node:node package*.json yarn.lock ./

# Instalar las dependencias con Yarn
RUN yarn install

# Copiar el resto de los archivos de la aplicación
COPY --chown=node:node . .

# Transpilar TypeScript a JavaScript
RUN yarn build

# Exponer el puerto que usa tu aplicación
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD [ "yarn", "start" ]
