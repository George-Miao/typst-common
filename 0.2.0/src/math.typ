/* Util Functions */
#let pmod(e) = [ $(mod #e)$ ] // (P)arenthesis (Mod)ulo
#let con(l, r, p, inline: false) = { // Congruence
  if inline {
    $#l ident #r #pmod(p)$
  } else {
    $#l ident #r #h(.5em) #pmod(p)$
  }
}
#let tuple(..body) = {
  let b = body.pos().join(", ")
  [ $angle.l #b angle.r$ ]
} // A tuple surrounded by angle brackets
#let ve(body) = { $accent(#body, arrow)$ } // Vector variable (accent with arrow)
#let at(body) = { math.lr($#body #h(0.1em) |$) }

/* Alias, consts */
#let nec = symbol("□") // Modal logic neccessity
#let pos = symbol("♢") // Modal logic possibility

#let lcm = { math.op("lcm") } // Least common multiplier

#let dx = { $thick d x$ }
#let dy = { $thick d y$ }
#let dz = { $thick d z$ }
#let dt = { $thick d t$ }
#let du = { $thick d u$ }
#let int = math.integral
#let sse = sym.subset.eq