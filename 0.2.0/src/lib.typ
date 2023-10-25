#import "math.typ": *
#import "util.typ": *

#let book(title: "", subtitle: "", authors: (), logo: none, body) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(
    "us-letter",
    numbering: "1",
    number-align: end,
    header: locate(loc => {
      let page = loc.position().page
      // Skip title page
      if page == 1 { return }

      // Find the first heading on or before the current page
      let ele = query(
        selector(heading.where(level: 1)),
        loc,
      ).rev().find(elem => elem.location().page() <= page)

      if ele == none { return }
      if ele.location().page() == page { return }

      text(0.8em, weight: 300, style: "italic", ele.body)
    }),
  )
  set math.mat(delim: "[")

  set text(font: "XCharter", lang: "en", size: 11pt)

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
  pad(top: 0.7em, right: 20%, grid(
    columns: (1fr,) * calc.min(3, authors.len()),
    gutter: 1em,
    ..authors.map(author => align(start)[
      *#author.name* \
      #author.email
    ]),
  ))

  v(2.4fr)
  pagebreak()

  /* Table of contents */
  show outline: x => {
    show v: (v) => {}
    show outline.entry.where(
      level: 1
    ): it => {
      strong(it)
    }
    x
  }

  outline()
  pagebreak(weak: true)

  /* Main body */
  set heading(numbering: (..x) => {
    let nums = x.pos()
    let names = x.named()
    if nums.len() == 0 { return }
    if nums.len() == 1 {
      v(3.5em)
      text(.8em, weight: 800, font: "Charter", [Chapter #nums.at(0)])
      v(.2em)
    } else {
      nums = nums.map(str).join(".")
      [#nums #h(.5em)]
    }
  })

  // Chapter heading
  show heading.where(level: 1): head => {
    pagebreak(weak: true)
    text(
      size: 27pt,
      weight: 800,
      par(
        leading: .4em,
        justify: false,
        head
      )
    )
    v(3em)
  }

  show heading.where(level: 2): head => {
    [#head #v(1em)]
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
    margin: 1in
  )
  set document(author: author, title: title)
  set text(font: "XCharter", lang: "en", size: 11pt)
  set block(breakable: true)
  set math.mat(delim: "[")

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

#let theorem    = new_theorem("Theorem", cmy: (50%, 10%, 10%))
#let lemma      = new_theorem("Lemma", cmy: (30%, 0%, 10%))
#let corollary  = new_theorem("Corollary", cmy: (10%, 0%, 50%))
#let definition = new_theorem("Definition", cmy: (0%, 20%, 40%))
#let example    = new_theorem("Ex")
#let question   = new_theorem("Question")
#let remark     = new_theorem("Remark")
#let recall     = new_theorem("Recall")
#let caution    = new_theorem("Caution")

#let proof(newline: false, body) = {
  if newline { linebreak(); }
  [_proof_.]; h(.5em); body; h(1fr); $square$
}
#let proof_ln = proof.with(newline: true)
