/* Util Functions */
#let pmod(e) = [ $(mod #e)$ ] // (P)arenthesis (Mod)ulo
#let con(l, r, p, inline: false) = { // Congruence
  if inline {
    $#l ident #r #pmod(p)$
  } else {
    $#l ident #r #h(.5em) #pmod(p)$
  }
}
// A tuple surrounded by angle brackets
#let tuple(..body) = {
  let b = body.pos().join([, #h(3pt) ])

  [ $angle.l #b angle.r$ ]
}
// Vector variable (accent with arrow)
#let ve(body) = { $accent(#body, arrow)$ }
#let at(body) = { math.lr($#body #h(0.1em) |$, size: 120%) }
#let ex(body) = { $exists #body. thick$ }
#let ex1(body) = { $exists! #body. thick$ }
#let fa(body) = { $forall #body. thick$ }

/* Alias, consts */
#let nec = symbol("□") // Modal logic neccessity
#let pos = symbol("♢") // Modal logic possibility

#let xlra = sym.arrow.l.r.long // Long left right arrow
#let lra = sym.arrow.l.r // Left right arrow

#let lcm = { math.op("lcm") } // Least common multiplier
#let na = sym.nabla // Nabla
#let circ = sym.compose // Compiose (circ)
#let comp = sym.complement // Complement
#let pm = sym.plus.minus // Plus Minus
#let sim = sym.tilde.op // Sim

#let detmat = math.mat.with(delim: "|")
#let dom = { math.op("dom") } // Domain
#let Var = { math.op("Var") } // Domain

// Calculus
#let dx = { $thick d x$ }
#let dy = { $thick d y$ }
#let dz = { $thick d z$ }
#let dt = { $thick d t$ }
#let du = { $thick d u$ }
#let dk = { $thick d k$ }
#let int = math.integral
#let iint = math.integral.double
#let iiint = math.integral.triple

// Set
#let ss = sym.subset
#let sse = sym.subset.eq

// Logic
#let vd = sym.tack.r
#let vD = sym.tack.r.double
#let iff = sym.arrow.l.r.double.long
#let implies = sym.arrow.r.double.long
#let ni = symbol("⥽",
  ("l", "⥼"),
  ("r", "⥽"),
  ("t", "⥾"),
  ("b", "⥿")
) // Necessarily implies

