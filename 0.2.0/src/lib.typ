#import "math.typ": *
#import "util.typ": *

#let book(title: "", subtitle: "", authors: (), logo: none, body) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page("us-letter", numbering: "1", number-align: end)
  set text(font: "charter", lang: "en")

  // Title page.
  // The page can contain a logo if you pass one with `logo: "logo.png"`.
  v(0.6fr)

  if logo != none {
    align(right, image(logo, width: 26%))
  }

  v(8.6fr)

  text(2em, weight: 700, title)

  v(0.2fr)

  text(1em, style: "italic", weight: 500, subtitle)

  v(1fr)
  // Author information.
  pad(
    top: 0.7em,
    right: 20%,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(start)[
        *#author.name* \
        #author.email
      ]),
    ),
  )

  v(2.4fr)
  pagebreak()


  // Table of contents.
  outline(depth: 3, indent: true)
  pagebreak()


  // Main body.
  set par(justify: true)

  body
}

#let sheet(
  title: "",
  author: "",
  course: "",
  date: today(),
  height: auto,
  logo: none,
  body
) = {
  // If it's in single sheet mode (height = auto), don't number the pages.
  let numbering = if (height == auto) {
    none
  } else {
    "1"
  }
  // Set the document's basic properties.
  set document(author: author, title: title)
  set page("us-letter", numbering: numbering, height: height, number-align: end, margin: 1in)
  set text(font: "charter", lang: "en")
  set block(breakable: true)

  // Header
  stack[
    #set block(spacing: .4em);
    #set text(1em, weight: 700)
    #block[ #author #h(1fr) #course ]
    #block[ #date #h(1fr) #title ]
  ]

  set par(justify: true)
  set text(hyphenate: true)

  body
}

#let header(title: "", subtitle: "", body) = {
  stack[
    #set block(spacing: .8em);
    #block[
      #set text(2em, weight: 700)
      #title
    ]
    #block[ #subtitle ]
  ]

  set par(justify: true)
  set text(hyphenate: true)

  v(2em)

  body
}

#let problem(name, body) = {
  v(1em)
  text(1em, weight: 700, [#name.])
  h(.5em)
  body
}

#let chapter_counter = counter("chapter")
#let chapter(body) = {
  v(5em)
  text(1.6em, weight: 700, [**Chapter** #{chapter_counter.display()}])
  v(1em)
  text(2.5em, weight: 700, body)
  v(1em)
  chapter_counter.step()
}

#let theorem(body) = {
  rect(
    radius: 0.2em,
    stroke: 3pt + rgb(161, 247, 168),
    block(
      width: 100%,
      pad(
        rest: 1em,
        text(1.2em, weight: 700, body)
      )
    )
  )
}

#let proof(newline: false, body) = {
  if newline { linebreak(); }
  [_proof_.]; h(.5em); body; h(1fr); $square$
}


