circuit andgates :
  module andgates :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<2>
    input io_b : UInt<2>
    output io_and : UInt<2>

    node _io_and_T = and(io_a, io_b) @[andgates.scala 12:19]
    io_and <= _io_and_T @[andgates.scala 12:10]
