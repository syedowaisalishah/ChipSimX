package myproject.gates

import chisel3._

class andgates extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(2.W))
    val b = Input(UInt(2.W))
    val and = Output(UInt(2.W))
  })

  io.and := io.a  &  io.b
}
