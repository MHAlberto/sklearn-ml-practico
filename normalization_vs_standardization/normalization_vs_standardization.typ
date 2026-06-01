#import "@preview/callisto:0.2.5"

// -----------------------------------------------------------------------------
// METADATOS DEL DOCUMENTO Y PALETA DE COLORES
// -----------------------------------------------------------------------------
#set document(
  title: "Regresión lineal en python",
  author: "M.H. Alberto",
  date: auto,
  keywords: ("Análisis de Datos", "Machine Learning", "Regresión Lineal")
)

// Tono naranja quemado/formal para mantener la sobriedad académica
#let color-naranja = rgb("#D35400")

// -----------------------------------------------------------------------------
// CONFIGURACIÓN GLOBAL (Estilo Editorial / Académico)
// -----------------------------------------------------------------------------

#set page(
  paper: "us-letter",
  margin: (top: 3.5cm, bottom: 3cm, left: 3cm, right: 3cm),
  // Encabezado dinámico: no aparece en la portada, pero sí en el resto del documento
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 9pt, fill: luma(120), font: "New Computer Modern")
      #align(right)[Regresión lineal en python | M.H. Alberto]
    ]
  },
  numbering: "1",
  number-align: center,
)

// Tipografía principal (Serif)
#set text(
  font: "New Computer Modern",
  size: 11pt,
  lang: "es",
)

// Configuración de párrafo con sangría de primera línea para mayor formalidad
#set par(
  justify: true,
  leading: 0.7em,
  first-line-indent: 1.5em,
)

// -----------------------------------------------------------------------------
// ESTILO DE TÍTULOS ESTRUCTURALES
// -----------------------------------------------------------------------------
#show heading: set text(
  font: "New Computer Modern",
  weight: "bold"
)

// Color naranja y espaciado riguroso solo para los títulos principales (nivel 1)
#show heading.where(level: 1): it => block(
  width: 100%,
  below: 1.5em,
  above: 2em,
)[
  #text(fill: color-naranja)[#it.body]
]

// -----------------------------------------------------------------------------
// ENCABEZADO / TÍTULO DEL DOCUMENTO (Portada integrada)
// -----------------------------------------------------------------------------

#align(center)[
  #v(2em)
  #block(text(font: "New Computer Modern", size: 24pt, weight: "bold", fill: color-naranja)[
    Normalization vs Standardization
  ])
  #v(1em)
  #block(text(size: 14pt)[
    *M.H. Alberto*
  ])
  #v(0.5em)
  #block(text(size: 10pt, fill: luma(100))[ 
    #datetime.today().display("[day] de [month repr:long] de [year]")
  ])
  #v(3em)
]

// -----------------------------------------------------------------------------
// RENDERIZADO DEL NOTEBOOK (Callisto)
// -----------------------------------------------------------------------------

#let (render, Cell, In, Out) = callisto.config(
  nb: json("normalization_vs_standardization.ipynb"),
)

// Ajuste para que el código no abrume la lectura del texto formal
#show raw: set text(size: 9.5pt)

#render()

