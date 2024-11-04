circuit andgates :
  module andgates :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<2>
    input io_b : UInt<2>
    output io_OR : UInt<2>

    node _io_OR_T = and(io_a, io_b) @[andgates.scala 12:18]
    io_OR <= _io_OR_T @[andgates.scala 12:9]
