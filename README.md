# Geovisor

**Geovisor** es una herramienta de visualización geográfica diseñada para facilitar el análisis y la interpretación de datos espaciales. Este proyecto permite a los usuarios interactuar con mapas y capas de información geográfica de manera intuitiva y eficiente.

## Características

- Visualización interactiva de mapas.
- Integración de múltiples capas de datos geográficos.
- Herramientas de análisis espacial.
- Interfaz de usuario personalizable.

## Requisitos del Sistema

- **Node.js** versión 14 o superior.
- **npm** versión 6 o superior.
- **Docker** (opcional, para despliegue con contenedores).

## Instalación

1. **Clonar el repositorio**:

   ```bash
   git clone https://github.com/Nachin7u7/geovisor.git
   cd geovisor
   ```

2. **Instalar dependencias**:

   ```bash
   npm install
   ```

3. **Configurar variables de entorno**:

   Renombrar el archivo `.env.example` a `.env` y ajustar las variables según sea necesario.

4. **Iniciar la aplicación en modo de desarrollo**:

   ```bash
   npm run dev
   ```

   La aplicación estará disponible en `http://localhost:380/`.

## Uso

Una vez iniciada la aplicación, puedes:

- Navegar por el mapa interactivo.
- Activar o desactivar capas de datos geográficos.
- Utilizar herramientas de medición y análisis.
- Personalizar la visualización según tus necesidades.

## Despliegue

Para desplegar la aplicación en un entorno de producción, se recomienda utilizar Docker:

1. **Construir y ejecutar los contenedores**:

   ```bash
   docker-compose up --build -d
   ```

   La aplicación estará disponible en el puerto especificado en el archivo `docker-compose.yml`.

