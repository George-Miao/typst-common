#import "@preview/t4t:0.3.2": is

#let today() = {
  datetime.today().display("[month repr:short] [day padding:none], [year]")
}

#let centering(body) = { align(alignment.center, body) }

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
  style(s =>
  stack(
    dir: dir,
    block(width: 100% - measure(tag_c, s).width, centering(body_c)),
    tag_c,
  ))
}
#let pillar(height: 1em) = {
  place(auto, float: true, block(width: 0em, height: height))
}

#let if_then(input, func) = {
  if input != "" and input != none {
    func(input)
  }
}

#let if_then_lb(input, func) = {
  if_then(input, x => [#func(x)\ ])
}

#let new_theorem(
  theorem_name,
  level: 2,
  cmy: none
) = {
  let counter = counter(theorem_name)
  return (name: none, body) => {
    locate(loc => {
      let ele = query(
        selector(heading.where(level: level)).before(loc),
        loc,
      )
      ele.first()
    })
    if cmy != none {
      let color = cmyk(
        cmy.at(0),
        cmy.at(1),
        cmy.at(2),
        10%
      )
      rect(
        fill: color.lighten(90%),
        stroke: (left: 1.8pt + color.darken(20%))
      )[
        #block(width: 100%, inset: 1em)[
          #text(1em, weight: 700, [#theorem_name])
          #if_then(name, x => [#h(-2pt) (#x)])
          #text(1em, weight: 700, [#h(-3pt).])
          #body
        ]
      ]
    } else {
      block(width: 100%, inset: 1em)[
          #text(1em, weight: 700, [#theorem_name])
          #if_then(name, x => [#h(-2pt) (#x)])
          #text(1em, weight: 700, [#h(-3pt).])
          #body
        ]
    }
  }
}

#let pb = pagebreak()
