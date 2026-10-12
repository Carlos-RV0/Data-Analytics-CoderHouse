---
🛒 RetailPro – Análisis de Ventas con SQL Server y Power BI
Proyecto de análisis de datos desarrollado en el marco del curso de Data Analytics de CoderHouse. Consiste en el modelado y consulta de la información de ventas de la empresa RetailPro usando SQL Server, y en la construcción de dashboards en Power BI que muestran los KPI's y gráficos de lo vendido.
---
📌 Tabla de contenidos
Descripción del proyecto
Objetivos
Herramientas utilizadas
Estructura del repositorio
Modelo de datos
Consultas SQL
Dashboard en Power BI
Cómo reproducir el proyecto
Autor
---
📖 Descripción del proyecto
RetailPro es una empresa de comercio minorista cuya información de ventas se organiza en una base de datos relacional. El proyecto recorre el flujo completo de un análisis de datos:
Almacenamiento y modelado de los datos en SQL Server, con llaves primarias (PK) y foráneas (FK) para garantizar la integridad entre tablas.
Consulta y transformación de los datos mediante SQL.
Visualización de resultados en Power BI, con KPI's y gráficos que permiten entender qué, cuánto y a quién se vende.
---
🎯 Objetivos
Diseñar un modelo relacional claro para los datos de ventas de RetailPro.
Extraer información de negocio mediante consultas SQL.
Construir un dashboard interactivo que resuma el desempeño de ventas.
Generar KPI's que faciliten la toma de decisiones.
---
🧰 Herramientas utilizadas
Herramienta	Uso en el proyecto
SQL Server	Creación de tablas, definición de PK/FK y consultas sobre los datos de ventas
Power BI	Creación de dashboards, KPI's y gráficos de lo vendido
GitHub	Control de versiones y publicación del proyecto
---
📁 Estructura del repositorio
```
Data-Analytics-CoderHouse/
├── RetailPro/          # Proyecto de análisis de ventas (SQL Server + Power BI)
├── sql-checkpoint/     # Ejercicios / checkpoint de SQL del curso
└── README.md
```
> Ajusta este árbol si deseas detallar los archivos que contiene cada carpeta (scripts `.sql`, archivo `.pbix`, capturas, etc.).
---
🗄️ Modelo de datos
La base de datos de RetailPro está dividida en cuatro tablas, relacionadas entre sí mediante llaves primarias (PK) y llaves foráneas (FK):
Tabla	Descripción
ventas	Registro de las transacciones realizadas. Referencia a clientes y productos mediante FK.
productos	Información de los productos comercializados.
clientes	Información de los clientes que realizan las compras.
catalogo	Clasificación o catálogo al que pertenecen los productos.
Relaciones
Cada venta se asocia a un cliente y a un producto (FK en `ventas`).
Cada producto pertenece a un catálogo (FK en `productos`).
Las llaves primarias identifican de forma única cada registro dentro de su tabla.
> 💡 Si lo deseas, agrega aquí una imagen del diagrama entidad-relación:
> `!\[Diagrama ER](ruta/a/tu/diagrama.png)`
---
🔎 Consultas SQL
Las consultas se ejecutan sobre SQL Server y aprovechan las relaciones PK/FK entre tablas. Entre los tipos de análisis que permite el modelo:
Ventas totales por período.
Ventas por producto y por catálogo.
Ventas por cliente.
Productos y clientes con mayor aporte a los ingresos.
Uso de `JOIN` para combinar `ventas`, `productos`, `clientes` y `catalogo`.
Agregaciones con `SUM`, `COUNT`, `AVG` y `GROUP BY`.
---
📊 Dashboard en Power BI
El dashboard se conecta a los datos de ventas y presenta de forma visual el desempeño comercial de RetailPro.
Contenido del dashboard:
KPI's de ventas (por ejemplo: total vendido, número de transacciones, ticket promedio).
Gráficos de lo vendido por producto, catálogo, cliente y período.
Filtros interactivos (segmentaciones) para explorar la información.
---
▶️ Cómo reproducir el proyecto
Clonar el repositorio
```bash
   git clone https://github.com/Carlos-RV0/Data-Analytics-CoderHouse.git
   ```
Crear la base de datos en SQL Server y ejecutar los scripts de creación de tablas e inserción de datos ubicados en la carpeta `RetailPro`.
Ejecutar las consultas SQL para validar las relaciones y explorar los datos.
Abrir el archivo de Power BI (`.pbix`) con Power BI Desktop y actualizar la conexión a tu instancia de SQL Server.
Actualizar los datos y explorar el dashboard.
Requisitos
SQL Server (y SQL Server Management Studio, opcional)
Power BI Desktop
---
👤 Autor
Carlos RV – @Carlos-RV0
Proyecto realizado para el curso de Data Analytics de CoderHouse.
