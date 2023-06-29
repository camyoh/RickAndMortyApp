# RickAndMortyApp

La aplicación ha sido desarrollada utilizando SwiftUI y hace uso de la API de [Rick & Morty](https://rickandmortyapi.com). En esta aplicación, se pueden encontrar dos vistas principales. La primera es la vista de detalle, la cual muestra información importante acerca de cada personaje. La segunda vista permite buscar personajes y agregarlos a una lista de favoritos.

<img src='https://github.com/camyoh/RickAndMortyApp/assets/12130471/94083ed4-9a4c-416b-8fed-1accaad7382c' alt='Vista Detalle' width='300'>
<img src='https://github.com/camyoh/RickAndMortyApp/assets/12130471/c55e4cba-9859-498f-94d8-fc833f273315' alt='Vista Detalle' width='300'>
<img src='https://github.com/camyoh/RickAndMortyApp/assets/12130471/0cafc06e-f2c1-43cc-8f4f-53ceef43d4c7' alt='Vista Detalle' width='300'>

En la vista de lista, se incluye una barra de búsqueda que permite al usuario ingresar el nombre de un personaje, y se mostrará una lista de resultados relacionados con la búsqueda realizada.

<img src='https://github.com/camyoh/RickAndMortyApp/assets/12130471/a0102dd0-92e2-49c8-b31b-3cd0b0004d5f' alt='Vista Detalle' width='300'>

Al seleccionar uno de los resultados, se accede a la vista de detalle específica de ese personaje. En esta vista, se encuentra un botón de "agregar" que permite al usuario seleccionar al personaje como favorito, y este se añadirá a la lista correspondiente.

<img src='https://github.com/camyoh/RickAndMortyApp/assets/12130471/7253778d-5126-4bcd-b0d1-7bd088bd6592' alt='Vista Detalle' width='300'>
<img src='https://github.com/camyoh/RickAndMortyApp/assets/12130471/11bbfabe-ca55-49da-ac14-479bc63d10e1' alt='Vista Detalle' width='300'>

Al seleccionar cualquier personaje de la lista, se puede ver su vista de detalle. En este caso, el botón de "agregar" será reemplazado por un botón que permite volver a la vista de personajes.

<img src='https://github.com/camyoh/RickAndMortyApp/assets/12130471/e5235b88-da94-4fcd-b469-2b35338a632a' alt='Vista Detalle' width='300'>

## Estructura de la app
La aplicación está organizada en diferentes carpetas:

* Networking: Aquí se encuentra la estructura encargada de realizar las peticiones a la API, implementando el protocolo ApiUrlRequest.
* Entities: En esta carpeta se encuentran las estructuras utilizadas para mapear los datos provenientes de los JSON.
* CharacterScreen: Esta carpeta contiene la vista principal donde se muestra la lista de personajes y se permite buscar por nombre. Está dividida en tres archivos: la vista, el modelo y el view model.
* DetailScreen: Esta carpeta corresponde a la vista de detalle de los personajes. Se divide en cuatro archivos: la vista, el modelo, el view model y un esquema que contiene las constantes de diseño.
* Views: Aquí se encuentran los componentes utilizados en las vistas. Cada componente consta de una vista, un modelo y un esquema que contiene las constantes de diseño.
* Utils: Esta carpeta contiene funciones auxiliares que ayudan a reducir el código necesario al aplicar propiedades a las vistas.

Adicionalmente, se realizaron pruebas unitarias a los view model de ambas vistas.

<img src='https://github.com/camyoh/RickAndMortyApp/assets/12130471/6683e7e2-10af-4b04-b619-bf1858d29a9f' alt='Vista Detalle' width=''>

