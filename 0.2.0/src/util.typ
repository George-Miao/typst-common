#import "@preview/t4t:0.3.2": is

#let inset(body) = block(inset: (x: 1em, y: .3em), body)

#let today() = {
  datetime.today().display("[month repr:short] [day padding:none], [year]")
}

#let centering(body) = {
  box(width: 1fr)[ #align(alignment.center, body) ]
}

#let tagged(tag, pos: "right", body) = {
  let dir
  if pos == "right" {
    dir = ltr
  } else if pos == "left" {
    dir = rtl
  } else {
    panic("Invalid position for tagged, expected 'right' or 'left'")
  }
  let tag_c = [(#tag)]
  let body_c = body
  style(s => stack(
    dir: dir,
    block(width: 100% - measure(tag_c, s).width, centering(body_c)),
    tag_c,
  ))
}
#let pillar(height: 1em) = {
  place(auto, float: true, block(width: 0em, height: height))
}

#let falsy(x) = {
  if is.n(x) {
    return true
  } // Test for none
  if is.empty(x) {
    return true
  } // Test for empty string/array
  false
}

#let if_then(input, func) = {
  if not falsy(input) {
    func(input)
  }
}

#let if_else(input, t, f) = {
  if falsy(input) {
    f(input)
  } else {
    t(input)
  }
}

#let if_then_ln(input, func) = {
  if_then(input, x => [#func(x)\ ])
}

#let new_theorem(
  theorem_name,
  level: 2,
  cmy: none,
  indent: 0pt,
) = {
  let c = counter(theorem_name)
  show heading: c.step(level: 1)
  return (name: none, body) => {
    // let a = context counter(heading).get().at(0)
    // c.step(level: level)
    // context c.get()
    let color = if_then(
      cmy,
      cmy => cmyk(
        cmy.at(0),
        cmy.at(1),
        cmy.at(2),
        10%,
      ),
    )
    block(
      fill: if_then(color, x => x.lighten(92%)),
      stroke: if_then(
        color,
        x => (
          // left: 1.8pt + x.darken(5%),
          rest: 0.8pt + x.darken(5%),
        ),
      ),
      inset: if_else(color, x => (rest: 1em, right: 1.3em), x => 0em),
      width: 100%,
    )[
      #text(1em, weight: 700, [#theorem_name])
      #h(-2pt)
      #if_else(name, x => [(#x)], x => h(.3em))
      #text(1em, weight: 700, [#h(-3pt).])
      #body
    ]
  }
}

#let pb = pagebreak()
#let qquad = h(4em)
#let hfill = h(1fr)
#let vfill = v(1fr)
