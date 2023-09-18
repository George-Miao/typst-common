#let today() = {
  datetime.today().display("[month repr:short] [day padding:none], [year]")
}

#let center(c) = { align(center, c) }
#let tag(body) = { align(right)[#body] }