// (P)arenthesis (Mod)ulo
#let pmod(e) = [ $(mod #e)$ ]

// Congruence
#let con(l, r, p, inline: false) = {
  if inline {
    $#l ident #r #pmod(p)$
  } else {
    $#l ident #r #h(.5em) #pmod(p)$
  }
}

// A tuple surrounded by angle brackets
#let tuple(body) = [ $angle.l #body angle.r$ ]

// Vector variable (accent with arrow)
#let ve(body) = { $accent(#body, arrow)$ }

// Modal logic neccessity and possibility
#let nec = symbol("□")
#let pos = symbol("♢")

// Least common multiplier
#let lcm = { math.op("lcm") }