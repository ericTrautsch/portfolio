#let resume(body) = {
  set list(indent: 1em)
  show list: set text(size: 0.92em)

  set page(
    paper: "us-letter",
    margin: (x: 0.5in, y: 0.5in)
  )

  set text(
    size: 11pt,
      font: "New Computer Modern",
  )

  body
}

#let name_header(name) = {
  set text(size: 2em)
  [*#name*]
}



#import "@preview/fontawesome:0.6.0": *

// helper for consistent icon size + spacing

#let social-icon(url, icon) = link(url)[
  // remove underline only for the icon
  #text()[
    // increase 1.25em or higher for larger icons
    #fa-icon(icon, 1.25em)
  ]
]


// header macro
#let header(
  name: "Eric Trautsch",
  email: "erictrautsch@outlook.com",
  linkedin: "linkedin.com/in/erictrautsch",
  site: "erictrautsch.dev",
  location: "Minneapolis, MN"
) = [
  #align(center)[
    #name_header(name) \
    #text(size: 11pt)[#location   
    \
    // single line: email + icons
    #link("mailto:" + email)
    #h(0.3em)
    |
    #h(0.3em)
    #social-icon("https://" + linkedin, "linkedin") 
    #h(0.3em)
    |
    #h(0.3em)
    #social-icon("https://" + site, "globe")
]
  ]
  #v(5pt)
]


#let resume_heading(txt) = {
  show heading: set text(size: 0.92em, weight: "regular")

  block[
    = #smallcaps(txt)
    #v(-4pt)
    #line(length: 100%, stroke: 1pt + black)
  ]
}

#let edu_item(
  name: "Sample University", 
  degree: "B.S in Bullshit", 
  location: "Foo, BA", 
  date: "Aug. 1600 - May 1750"
) = {
  set block(above: 0.7em, below: 1em)
  pad(left: 1em, right: 0.5em, grid(
    columns: (3fr, 1fr),
    align(left)[
      *#name* \
      _#degree _
    ],
    align(right)[
      #location \
      _#date _
    ]
  ))
}

#let exp_item(
  name: "Sample Workplace",
  role: "Worker",
  date: "June 1837 - May 1845",
  location: "Foo, BA",
  ..points
) = {
    set block(above: 0.7em, below: 1em)
    pad(left: 1em, right: 0.5em, box[
      #grid(
        columns: (3fr, 1fr),
        align(left)[
          *#role* \
          _#name _
        ],
        align(right)[
      #date \
          _#location _
        ]
      )
      #list(..points)
    ])
}

#let project_item(
  name: "Example Project",
  skills: "Programming Language 1, Database3",
  date: "May 1234 - June 4321",
  ..points
) = {
  set block(above: 0.7em, below: 1em)
  pad(left: 1em, right: 0.5em, box[
    *#name* _#skills _ #h(1fr) #date
    #list(..points)
  ])
}

#let skill_item(
  category: "Skills",
  skills: "Balling, Yoga, Valorant",
) = {
  set block(above: 0.7em)
  set text(size: 0.91em)
  pad(left: 1em, right: 0.5em, block[*#category*: #skills])
}
