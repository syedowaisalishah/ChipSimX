package myproject.gates

import chisel3._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec

class andgatestest extends AnyFreeSpec with ChiselScalatestTester {
  "andGates Test" in {
    test(new andgates()) { c =>
      c.io.a.poke(1.U)  // Corrected UInt format
      c.io.b.poke(1.U)

      c.clock.step(1)
      c.io.OR.expect(1.U)
    }
  }
}
