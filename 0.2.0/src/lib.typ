#import "math.typ": *
#import "util.typ": *

#let jp(body) = {
  set text(
    font: (
      "Noto Serif CJK JP",
      "XCharter",
    ),
    lang: "ja",
    size: 11pt,
  )

  body
}

#let a(body) = {
  set text(fill: red)
  body
}

#let book(
  title: "",
  subtitle: "",
  authors: (),
  logo: none,
  toc: true,
  body,
) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(
    "us-letter",
    numbering: (page, ..nums) => {
      // Skip the cover page
      if page > 1 {
        text(str(page - 1))
      }

    },
    number-align: end,
    header: locate(loc => {
      let current = loc.position().page
      // Skip title page
      if current == 1 {
        return
      }

      // Find the first heading on or before the current page
      let ele = query(
        selector(heading.where(level: 1)),
        loc,
      ).rev().find(elem => elem.location().page() <= current)

      if ele == none {
        return
      }
      if ele.location().page() == current {
        return
      }

      text(0.9em, weight: 300, style: "italic", ele.body)
    }),
  )
  set math.mat(delim: "[")

  set text(
    font: "XCharter",
    lang: "en",
    size: 11pt,
  )

  /* Title page. */
  // The page can contain a logo if you pass one with `logo: "logo.png"`.
  v(0.6fr)

  // if_then_ln(logo, x => align(right, image(x, width: 26%)))

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

  pb

  /* Table of contents */
  if toc {
    show heading: x => block(below: 3em, text(size: 1.3em, x))
    show outline.entry.where(level: 1): it => text(1.1em, weight: 800, it)
    outline(target: heading.where(outlined: true))
  }

  pagebreak(weak: true)

  set heading(numbering: "1.")

  // Chapter heading
  show heading.where(level: 1): head => {
    let (chapter, ..) = counter(heading).get()
    pagebreak(weak: true)

    // Chapter number
    v(3.5em)
    text(.8em, weight: 800, font: "Charter", fill: rgb("#525252"), [Chapter #chapter])
    v(-1em)

    // Chapter title
    text(
      size: 27pt,
      weight: 800,
      par(
        leading: .4em,
        justify: false,
        head.body,
      ),
    )
    v(3em)
  }

  show heading.where(level: 2): head => {
    let num = text(fill: rgb("#525252"), counter(heading).get().map(str).join("."))

    block(above: 1.4em, below: 2em)[
      #num #h(.5em) #text(size: 1.3em, [#head.body])
    ]
  }

  set par(justify: true)


  body
}

#let sheet(
  title: "",
  subtitle: "",
  author: "",
  course: "",
  date: today(),
  height: auto,
  logo: none,
  body,
) = {
  // If it's in single sheet mode (height = auto), don't number the pages.
  let numbering = if (height == auto) {
    none
  } else {
    "1"
  }
  // Set the document's basic properties.
  set page(
    "us-letter",
    numbering: numbering,
    height: height,
    number-align: end,
    margin: 1in,
  )
  set document(author: author, title: title)
  set text(
    font: "XCharter",
    lang: "en",
    size: 11pt,
  )
  set block(breakable: true)
  set math.mat(delim: "[")

  if subtitle == "" {
    subtitle = course
  }

  // Header
  stack[
    #set block(spacing: .7em);
    #if_then(author, x => text(1.1em, weight: 800, x))
    #h(1fr)
    #if_then(title, x => text(1.1em, weight: 800, x))\
    #if_then(date, x => text(0.8em, style: "italic", x))
    #h(1fr)
    #if_then(subtitle, x => text(0.8em, style: "italic", x))\
    #v(1em)
  ]

  // Body
  set par(justify: true)
  set text(hyphenate: true)

  body
}

#let problem(name, body) = {
  v(1em)
  text(1em, weight: 700, [#name.])
  h(.5em)
  body
}

#let thm_color = (15%, 0%, 50%)
#let definition = new_theorem("Definition", cmy: (30%, 0%, 20%))
#let theorem = new_theorem("Theorem", cmy: thm_color)
#let fact = new_theorem("Fact", cmy: thm_color)
#let proposition = new_theorem("Proposition", cmy: thm_color)
#let corollary = new_theorem("Corollary", cmy: thm_color)
#let lemma = new_theorem("Lemma", cmy: thm_color)
#let example = new_theorem("Example")
#let question = new_theorem("Question")
#let answer = new_theorem("Answer")
#let remark = new_theorem("Remark")
#let note = new_theorem("Note")
#let recall = new_theorem("Recall")
#let caution = new_theorem("Caution")
#let claim = new_theorem("Claim")

#let proof(newline: false, body) = {
  if newline {
    linebreak()
  }
  block(inset: (left: 1em))[
    _proof_.
    #h(.5em)
    #body
    #h(1fr)
    $square$
  ]
}
#let proof_ln = proof.with(newline: true)

#let sub = text.with(fill: rgb("#737373"))