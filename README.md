# README
## Instalación

1. Clona el repositorio:
   ```bash
   git clone https://github.com/KevinEs14/flutter_challenge

## Descripción del Proyecto

Este proyecto se utilizó `Provider` como gestor de estados junto con una arquitectura MVVM + Repositorio. 

## Por qué usar `Provider` como gestor de estados

Este gestor de estado permite una comunicación eficiente entre widgets y las razones para usarlo serían que es sencillo de usar, facilita la escalabilidad de la aplicación y su reactividad  permite que los widgets se actualicen automáticamente cuando cambia el estado.


## Características Adicionales

### Modo Oscuro

Implemeté un botón que permite al usuario alternar entre el modo claro y el modo oscuro. Esto apuntando a una aplicación que le permita al usuario una mejor personalización.

### Buscador

La aplicación incluye un buscador que permite a los usuarios filtrar rápidamente la lista de ítems ingresando el nombre completo del item.

### Paginación

Implementé la paginación en la lista de ítems, mostrando de 20 en 20 los items. Esto ayuda a que se reduzca la carga del servidor y que en el frontend la carga sea más rápida.

### Archivos de Temas

Hice uso de un archivo específico para los colores, tamaños de espacios, borderRadius, tamaños de letras y otro para los textStyles usados en la aplicación. Con estos busqué estandarizar los estilos de texto y los colores en la aplicación, permitiendo una gestión centralizada de los estilos, facilitando su modificación y asegurando una apariencia coherente en toda la app.

### Implementación de `dotenv`

Hice uso de la librería `dotenv` para manejar variables globales, en este caso la URL de la API. Esto permite una configuración más flexible y segura, ya que las credenciales y otros parámetros sensibles no están hardcodeados en el código fuente.

## Observaciones

### El buscador

La búsqueda está limitada a ingresar todo el nombre para encontrarlo. Esto se debe a una limitación con el endpoint ya que no permite realizar búsquedas por letra ingresada. Se podría hacer en la parte del frontend una vez agarrada la lista pero eso perjudica a la paginación que se implementó.

### El diseño 

El diseño está limitado debido a los atributos con los que se cuenta en el modelo, de tener algún atributo de imagen se podrían implementar widgets más atrayentes para el usuario.




