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

// Title Page
#let title-page(
  title: "",
  subtitle: none,
  author: "",
  id: "",
) = {
  align(left)[
    #block(
      inset: (x: 1.4em, y: 1em),
      stroke: (
        top: (paint: colors.primary.lighten(50%), thickness: 3pt),
        bottom: (paint: colors.accent.lighten(50%), thickness: 2pt),
        left: (paint: colors.border, thickness: 1pt),
        right: (paint: colors.border, thickness: 1pt),
      ),
      radius: 6pt,
      width: 100%,
    )[
      #set text(size: 20pt, weight: 900, fill: colors.primary)
      #title

      #if subtitle != none [
        #v(0.2cm)
        #set text(size: 14pt, fill: colors.secondary)
        #subtitle
      ]
    ]
  ]

  align(right)[
    #block(
      inset: (x: 1.2em, y: 0.9em),
      stroke: (right: (paint: colors.primary.lighten(80%), thickness: 2.5pt)),
      fill: colors.surface,
      radius: 5pt,
      width: 100%,
    )[
      #set par(justify: false)

      #set text(size: 14pt, weight: 700)
      #author
      #h(1fr)
      #set text(size: 10pt, fill: colors.text-light)
      #id
    ]
  ]

  v(3cm)
}

// Question / Answer Blocks
#let que(body) = block(
  inset: 0.8em,
  radius: 4pt,
  fill: colors.highlight,
  stroke: (paint: colors.primary.lighten(50%), thickness: 1pt),
)[
  #set text(weight: 600, fill: colors.primary)
   #body
]

#let ans(body) = block(
  inset: 0.8em,
  radius: 4pt,
  fill: colors.surface,
  stroke: (paint: colors.border.lighten(50%), thickness: 1pt),
)[
  #text(weight: 600, fill: colors.success)[󱝿 ]

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
    stroke: (paint: color.lighten(50%), thickness: 1pt),
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
)

// Figures & Tables
#show figure: it => block(
  inset: 5pt,
  radius: 4pt,
  stroke: (paint: colors.border.lighten(50%), thickness: 1pt),
  fill: colors.surface,
)[#it]

#show image: it => box(
  radius: 4pt,
  clip: true,
  stroke: (paint: colors.border.lighten(50%), thickness: 1pt),
  inset: 1pt,
  it,
)

#show table: it => {
  set table(
    stroke: (paint: colors.border.lighten(50%), thickness: 0.5pt),
    align: center,
  )
  it
}


// Template Wrapper
#let template(body) = {
  // Page Setup
  set page(height: auto, margin: (x: 20pt, y: 20pt))
  set text(size: 12pt, fill: colors.text)

  // Apply all show rules
  show raw.where(block: true): block.with(
    fill: colors.code-bg,
    inset: 7pt,
    radius: 4pt,
  )

  show figure: it => block(
    inset: 5pt,
    radius: 4pt,
    stroke: (paint: colors.border.lighten(50%), thickness: 1pt),
    fill: colors.surface,
  )[#it]

  show image: it => box(
    radius: 4pt,
    clip: true,
    stroke: (paint: colors.border.lighten(50%), thickness: 1pt),
    inset: 1pt,
    it,
  )

  show table: it => {
    set table(
      stroke: (paint: colors.border.lighten(50%), thickness: 0.5pt),
      align: center,
    )
    it
  }

  body
}
