# Analisis de Funnel y Churn en e-commerce

## 🧠 Descripción del Proyecto
Este proyecto analiza el comportamiento de usuarios en un e-commerce con el objetivo de entender el proceso de conversión (funnel) y detectar oportunidades para mejorar la retención de clientes (churn).
A partir de datos de interacción (vistas, carritos y compras), se construyen métricas clave de negocio y se generan insights accionables.

## 🎯 Objetivos
* Analizar el funnel de conversión (vista -> carrito -> compra)
* Identificar los puntos de abandono
* Estimar métricas de churn a nivel de usuario
* Analizar comportamiento de clientes y patrones de compra
* Generar recomendaciones orientadas a negocio

## 🗂️ Estructura del Proyecto
```plaintext
ecommerce-funnel-and-churn-analysis/
│
├── data/
│   ├── raw/          # Datos originales (no incluidos)
│   └── processed/    # Datos procesados (sample/parquet)
│
├── notebooks/        # Análisis exploratorio y métricas
├── sql/              # Queries de análisis (funnel, churn, revenue)
├── dashboard/        # Visualizaciones (Power BI / similares)
├── README.md
```
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
* Construcción del funnel de conversión (vista → carrito → compra)
* Cálculo de métricas iniciales de conversión
* Análisis de churn por usuario
* Segmentación de clientes
* Análisis de revenue por categoría y comportamiento

## 🔍 Enfoque del análisis
El análisis se centra en entender el comportamiento del usuario a lo largo del funnel de conversión, evaluando en qué etapa se produce la mayor pérdida.
Se trabaja a nivel usuario (user_id) para medir conversiones reales y evitar duplicaciones por múltiples eventos.

## 📊 Métricas claves
- Tasa de conversión view -> cart
- Tasa de conversión cart -> purchase
- Tasa de conversión total (view -> purchase)

## 📊 Resultados del Funnel de Conversión
- View -> Cart: 4,91%
- Cart -> Purchase: 59,58%
- View -> Purchase: 2,93%

### 🔍 Insights
El funnel de conversión muestra una caida significativa en la etapa inicial (view -> cart), lo que indica que la mayoría de los usuarios navega productos pero no avanza hacía la intensión de compra.
Por otro lado, la conversión de carrito a compra (cart -> purchase) es alta (~59,6%), lo que sugiere, que los usuarios que agregan productos al carrito tienen una alta probabilidad de completar la compra.
Todo esto indica, que el principal punto a mejorar, es optimizar la conversión de la etapa inicial del funnel, ya sea mediante mejoras en la experiencia de usuario, precio o presentación del producto.

### 📊 Análisis por categoría
Se encontraron diferencias significativas en la conversión entre categorías.
Categorías como electronics.smartphone presentan tasas de conversión superiores al promedio (~5,9% vs ~2.9%), indicando altas intenciones de compra.
En contraste, categorías como accesories.bag presentan muy baja conversión en la etapa inicial del funnel, aunque con alta conversión en etapas posteriores, lo que sugiere que el principal problema se encuentra en la generación de intención de compra.

### 🎯 Análisis del funnel por rango de precio
Se analizó el comportamiento del funnel de conversión segmentado por rangos de precio para identificar patrones en la intensión de compra.

- 0-50 -> 0,84%
- 50-150 -> 1,66%
- 150-300 -> 2,67%
- 300-600 -> 1,68%
- 600-1000 -> 2,02%

La conversión no presenta un comportamiento lineal respecto al precio.
Se observa que el rango de precio medio (150-300) presenta la mayor tasa de conversión (~2,67%), lo que sugiere la existencia de un punto óptimo donde se maximiza la intención de compra.
Los productos de bajo precio (0-50) muestran una conversión significativamente menor, lo que podría indicar bajo valor percibido o menor intención de compra.
En rangos de precios más altos, la conversión se mantiene relativamente estable, aunque inferior al rango óptimo, posiblemente debido a una mayor fricción en la decisión de compra.
El análisis sugiere que las estrategias comerciales deberían enfocarse en potenciar productos dentro del rango de precio medio, así como optimizar la percepción de valor en productos de bajo costo para mejorar su conversión.

### 🛍️ Análisis de productos en el rango de precio óptimo (150–300)
Se analizaron los productos dentro del rango de precio con mayor conversión para identificar cuáles impulsan el rendimiento del funnel.
Se identificaron diferencias entre productos en términos de volumen de ventas y eficiencia de conversión.
Algunos productos destacan tanto por su volumen de venta como por su conversión, como el producto 1004833, lo que indica una combinación de alta demanda y fuerte intención de compra.
Por otro lado, se observan productos con alto volumen de ventas pero menor conversión (producto 1004767), lo que sugiere oportunidades de optimización en la experiencia de compra o en la propuesta de valor.

- Existen productos estrella que combinan alto volumen y alta conversión.
- Algunos productos generan mucho tráfico pero convierten por debajo del promedio.
- Otros productos presentan alta conversión pero bajo volumen, lo que sugiere oportunidades de mayor exposición.

Este analisis permitió identificar productos clave para estrategias comerciales, diferenciando aquellos que deben ser potenciados, optimizados o promocionados para maximizar el rendimiento del negocio.

## 🔁 Análisis de churn
Se analizó el comportamiento de recompra de los usuarios para estimar el nivel de retención dentro del período observado.

### 📊 Resultado
- churn rate: 80.0%

### 🔍 Definición utilizada
Dado que el dataset abarca un único mes, se definió churn como aquellos usuarios que realizaron una única compra durante el período.

### 🔍 Insights
Se observa que aproximadamente el 80% de los usuarios realiza una sola compra y no vuelve a interactuar, lo que indica un bajo nivel de retención.
Esto sugiere que, si bien el funnel de conversión logra generar compras, existe una debilidad significativa en la fidelización de los clientes.

### 📌 Conclusión
El principal desafío del negocio no se encuentra únicamente en la conversión, sino en la retención de usuarios.
Estrategias como programas de fidelización, campañas de marketing o mejoras en la experiencia post-compra podrían contribuir a aumentar la recurrencia de clientes.

## 🔁 Análisis de churn por segmentos
Se analizó la retención de usuarios segmentada por categoría y rango de precios para identificar patrones de fidelización.

### 📊 Churn por categoría
Se observan categorías con tasas de churn cercanas al 100%, especialmente en productos de tipo indumentaria y pequeños electrodomesticos.
Esto indica que los usuarios suelen realizar compras únicas en estas categorías, lo cual es consistente con compartimientos de consumo no recurrentes.

### 🔍 Insight
No todas las categorías presentan el mismo potencial de retención. Algunas responden a compras ocasionales, por lo que las estrategías deberían enfocarse más en adquisición que en fidelización.

### 💰 Churn por rango de precios
- 0-50	86,6%
- 50-150 85,6%
- 150-300	85,2%
- 300-600	85,3%
- 600-1000	84,2%
- 1000+	82,9%

### 🔍 Insight
Se observa una leve disminución del churn a medida que aumenta el precio del producto.
Esto sugiere que los productos de mayor valor generan mayor compromiso por parte del usuario, mientras que los productos de bajo costo están más asociados a compras impulsivas con baja recurrencia.

### 📌 Conclusión
El análisis indica que tanto la categoría como el precio influyen en la retención de clientes.
Las estrategias de negocio deberían adaptarse según el tipo de producto:
- En categorías de compra ocasional -> foco en adquisición.
- En productos de mayor valor -> foco en retención y fidelización.

## 🛠️ Tecnologías utilizadas
* Python (pandas, numpy)
* SQL
* Power BI (para visualización)
* Git / GitHub

## 📌 Autor
Guillermo Jofre