circuit orgates :
  module orgates :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<2>
    input io_b : UInt<2>
    output io_OR : UInt<2>

    node _io_OR_T = or(io_a, io_b) @[orgates.scala 12:17]
    io_OR <= _io_OR_T @[orgates.scala 12:9]
