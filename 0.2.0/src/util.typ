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
      tag_c
    )
  )
}
#let pillar(height: 1em) = {
  place(auto, float: true, block(width: 0em, height: height))
}


#let pb = pagebreak()