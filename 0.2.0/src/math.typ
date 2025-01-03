/* Util Functions */
#let pmod(e) = [ $(mod #e)$ ] // (P)arenthesis (Mod)ulo
#let con(l, r, p, inline: false) = {
  // Congruence
  if inline {
    $#l ident #r #pmod(p)$
  } else {
    $#l ident #r #h(.5em) #pmod(p)$
  }
}

// A tuple surrounded by angle brackets
#let an(..body) = {
  let b = body.pos().join([, #h(3pt) ])

  [ $angle.l #b angle.r$ ]
}

// Surrounded by parentheses
#let pa(..body) = {
  let b = body.pos().join(h(5pt))

  [ $(#b)$ ]
}

// Vector variable (accent with arrow)
#let ve(body) = {
  $accent(#body, arrow)$
}
#let at(..body) = {
  math.lr($#h(0em) #body.pos().join(",") #h(0.1em) |$, size: 120%)
}
#let ex(..body) = {
  $exists #body.pos().join(","). thick$
}
#let ex1(..body) = {
  $exists! #body.pos().join(","). thick$
}
#let fa(..body) = {
  $forall #body.pos().join(","). thick$
}

/* Alias, consts */
#let xlra = sym.arrow.l.r.long // Long left right arrow
#let lra = sym.arrow.l.r // Left right arrow
#let mapsto = sym.arrow.r.long.bar // Mapsto
#let lcm = math.op("lcm") // Least common multiplier
#let na = sym.nabla // Nabla
#let circ = sym.compose // Compiose (circ)
#let comp = sym.complement // Complement
#let pm = sym.plus.minus // Plus Minus
#let sim = sym.tilde.op // Sim
#let ne = sym.eq.not // Not equal
#let iso = sym.tilde.equiv // Isomorphic or homeomorphic
#let contains = sym.in.rev // Contains (in but reversed)
#let nothing = $text(font: "Fira Sans", nothing)$ // Round empty set
#let emptyset = nothing // Empty set
#let power = math.cal($P$) // Power set
#let sends = sym.arrow.r.long.bar // |-->
#let dot = math.op(sym.circle.filled.tiny) // Dot
#let Sect = sym.sect.big // Big intersection
#let Union = sym.union.big // Big union
#let detmat = math.mat.with(delim: "|")
#let dom = math.op("dom") // Domain
#let obj = math.op("obj") // Object
#let Var = math.op("Var") // Variance
#let char = math.op("char") // Characteristic
#let normal = math.class("binary", sym.lt.tri.eq) // Normal subgroup

// Topology
#let bd = math.op("Bd") // Boundary
#let clo = math.overline // Closure
#let topo = math.cal($T$) // Topology
#let base = math.cal($B$) // Basis
#let neib = math.cal($N$) // Neighborhood basis
#let lebe = math.cal($S$) // Lebesgue number
#let dju = math.op(sym.union.sq) // Disjoint union
#let nbhd = math.op("nbhd")
#let homeo = math.op("Homeo") // Set of Homeomorphisms
#let mcg = math.op("MCG") // Mapping class group
#let bsum = math.class("binary", sym.natural) // Boundary connected sum
#let csum = math.class("binary", sym.sharp) // Connected sum
#let homo = math.class("binary", sym.tilde.eq) // Homotopy

// Calculus
#let na = sym.nabla
#let dx = $thick d x$
#let dy = $thick d y$
#let dz = $thick d z$
#let dt = $thick d t$
#let du = $thick d u$
#let dv = $thick d v$
#let dk = $thick d k$
#let dA = $thick d A$
#let dV = $thick d V$
#let ds = $thick d s$
#let dvx = $thick d ve(x)$
#let dphi = $thick d phi$
#let dtheta = $thick d theta$
#let int = sym.integral
#let iint = sym.integral.double
#let iiint = sym.integral.triple

// Set
#let ss = sym.subset
#let sse = sym.subset.eq

// Logic
#let nec = symbol("□") // Modal logic neccessity
#let pos = symbol("♢") // Modal logic possibility
#let vd = sym.tack.r
#let vD = sym.tack.r.double
#let iff = sym.arrow.l.r.double.long
#let implies = sym.arrow.r.double.long
#let ni = symbol(
  "⥽",
  ("l", "⥼"),
  ("r", "⥽"),
  ("t", "⥾"),
  ("b", "⥿"),
) // Necessarily implies
#let asymp = symbol("≍") // Asymptotically equal to

// Category theory
#let hom = math.op("Hom")
