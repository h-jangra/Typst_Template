#let colors = (
  primary: rgb(30, 102, 245),
  secondary: rgb(92, 99, 112),
  accent: rgb(245, 169, 127),
  success: rgb(64, 150, 120),
  warning: rgb(245, 158, 100),
  background: rgb(255, 255, 255),
  surface: rgb(249, 250, 251),
  border: rgb(225, 232, 240),
  text: rgb(34, 39, 46),
  text-light: rgb(110, 118, 129),
  code-bg: rgb(246, 248, 250),
  highlight: rgb(235, 244, 255),
)


// Page Setup
#set page(
  height: auto,
  numbering: "1",
)

#set text(
  size: 12pt,
  fill: colors.text,
)

#set par(
  justify: true,
  leading: 0.7em,
  first-line-indent: 0pt,
)


// Headings
#set heading(numbering: "1.1")

#show heading.where(level: 1): it => [
  #block(
    inset: (bottom: 0.4em),
    stroke: (bottom: (paint: colors.primary, thickness: 3pt)),
  )[
    #set text(size: 22pt, weight: 700)
    #counter(heading).display() + "  " + it.body
  ]
  #v(0.9em)
]

#show heading.where(level: 2): it => [
  #set text(size: 16pt, weight: 600, fill: colors.primary)
  #counter(heading).display() + "  " + it.body
  #v(0.5em)
]

#show heading.where(level: 3): it => [
  #set text(size: 13pt, weight: 500, fill: colors.secondary)
  #counter(heading).display() + "  " + it.body
  #v(0.3em)
]


// Title Page
#let title-page(
  title: "",
  subtitle: none,
  author: "",
  id: "",
  course: "",
  professor: "",
  institution: "",
) = {
  align(center)[

    #set text(30pt, weight: 800, fill: colors.primary)
    #title

    #if subtitle != none [
      #v(0.3cm)
      #set text(17pt, weight: 400, fill: colors.secondary)
      #subtitle
    ]

    #v(0.5cm)

    #set text(12pt)
    #grid(
      columns: (1fr, 1fr),
      gutter: 0.5cm,
      [*Author:* #author], [*ID:* #id],
      // [*Course:* #course], [*Professor:* #professor],
    )

    #v(1cm)

    #set text(10pt, fill: colors.text-light)
    #institution
  ]
}


// Question / Answer Blocks
#let question(body) = block(
  inset: 0.8em,
  radius: 4pt,
  fill: colors.highlight,
  stroke: (paint: colors.primary, thickness: 1pt),
)[
  #set text(weight: 600, fill: colors.primary)
  📌 Question

  #v(0.4em)

  #set text(weight: 400, fill: colors.text)
  #body
]

#let answer(body) = block(
  inset: 0.8em,
  radius: 4pt,
  fill: colors.surface,
  stroke: (paint: colors.border, thickness: 1pt),
)[
  #set text(weight: 600, fill: colors.success)
  ✏️ Answer

  #v(0.4em)

  #set text(weight: 400, fill: colors.text)
  #body
]


// Notes
#let note(body, type: "info", label: none) = {
  let color = (if type == "warning" { colors.warning } else if type == "tip" { colors.success } else { colors.primary })

  let icon = (if type == "warning" { "⚠️" } else if type == "tip" { "💡" } else { "ℹ️" })

  block(
    inset: 1em,
    radius: 4pt,
    fill: colors.surface,
    stroke: (paint: color, thickness: 1pt),
  )[
    #set text(weight: 600, fill: color)
    #icon #label

    #v(0.3em)

    #set text(weight: 400, fill: colors.text)
    #body
  ]
}

// Code Styling
#show raw.where(block: true): block.with(
  fill: colors.code-bg,
  inset: 7pt,
  radius: 4pt,
  stroke: (paint: colors.border, thickness: 1pt),
)


// Figures & Tables
#show figure: it => block(
  inset: 5pt,
  radius: 4pt,
  stroke: (paint: colors.border, thickness: 1pt),
  fill: colors.surface,
)[#it]

#show image: it => box(
  radius: 4pt,
  clip: true,
  stroke: (paint: colors.border, thickness: 1pt),
  inset: 1pt,
  it,
)

#show table: it => {
  set table(
    stroke: (paint: colors.border, thickness: 0.5pt),
    align: center,
  )
  it
}


// Header / Footer
#set page(
  header: context {
    if counter(page).get().first() > 1 {
      align(right)[
        #set text(10pt, fill: colors.text-light)
        datetime.today().display()
      ]
    }
  },

  footer: context {
    if counter(page).get().first() > 1 {
      align(center)[
        #set text(10pt, fill: colors.text-light)
        counter(page).display() + " / " + counter(page).final()
      ]
    }
  },
)


// Template Wrapper
#let template(body) = body
