# Analisis de Funnel y Churn en e-commerce

## 🧠 Descripción del Proyecto
Este proyecto analiza el comportamiento de usuarios en un e-commerce con el objetivo de entender el proceso de conversión (funnel) y detectar oportunidades para mejorar la relación de clientes (churn).
A partir de datos de interacción (vistas, carritos y compras), se construyen métricas clave de negocio y se generan insights accionables.

## 🎯 Obejtivos
* Analizar el funnel de conversión (vista -> carrito -> compra)
* Identificar los puntos de abandono
* Estimar métricas de churn a nivel de usuario
* Analizar comportamiento de clientes y patrones de compra
* Generar recomendaciones orientadas a negocio

## 🗂️ Estructura del Proyecto
ecommerce-funnel-and-churn-analysis/ 

│ 

├── data/ │ ├── raw/ # Datos originales (no incluidos) │ └── processed/ # Datos procesados (sample/parquet) │ ├── notebooks/ # Análisis exploratorio y métricas ├── sql/ # Queries de análisis (funnel, churn, revenue) ├── dashboard/ # Visualizaciones (Power BI / similares) ├── README.md

## 📄 Dataset
El dataset no se incluye en el repositorio, debido a restricciones de tamaño.
Podés descargarlo desde el siguiente enlace:
[Kaggle](https://www.kaggle.com/datasets/mkechinov/ecommerce-behavior-data-from-multi-category-store)

## ⚙️ Procesamiento de Datos
Se hicieron las siguientes transformaciones:
* Conversión de event_time a formato datetime
* Eliminación de inconsistencias en precios
* Manejo de valores nulos en variables categoricas (category_code, brand)
* Generación de un dataset limpio para análisis (events_clean.parquet)

## 📈 Análisis realizados (en progreso)
* Análisis exploratorio de datos (EDA)
* Construcción del funnel de conversión
* Análisis de churn por usuario
* Segmentación de clientes
* Análisis de revenue por categoría y comportamiento

## 🛠️ Tecnologías utilizadas
* Python (pandas, numpy)
* SQL
* Power BI (para visualización)
* Git / GitHub

## 📌 Autor
Guillermo Jofre