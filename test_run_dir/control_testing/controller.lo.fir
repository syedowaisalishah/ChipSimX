circuit controller :
  module controller :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<7>
    output io_memwrite : UInt<1>
    output io_branch : UInt<1>
    output io_memread : UInt<1>
    output io_regwrite : UInt<1>
    output io_memtoreg : UInt<1>
    output io_aluop : UInt<3>
    output io_opA : UInt<4>
    output io_opB : UInt<2>
    output io_extendsel : UInt<4>
    output io_nextpcsel : UInt<4>

    node _T = eq(UInt<5>("h13"), io_in) @[counterIO.scala 30:24]
    node _T_1 = eq(UInt<6>("h33"), io_in) @[counterIO.scala 30:24]
    node _T_2 = eq(UInt<6>("h23"), io_in) @[counterIO.scala 30:24]
    node _T_3 = eq(UInt<2>("h3"), io_in) @[counterIO.scala 30:24]
    node _T_4 = eq(UInt<7>("h63"), io_in) @[counterIO.scala 30:24]
    node _T_5 = eq(UInt<7>("h6f"), io_in) @[counterIO.scala 30:24]
    node _T_6 = eq(UInt<7>("h67"), io_in) @[counterIO.scala 30:24]
    node _T_7 = eq(UInt<6>("h37"), io_in) @[counterIO.scala 30:24]
    node _GEN_0 = mux(_T_7, UInt<1>("h0"), UInt<1>("h0")) @[counterIO.scala 30:24 118:26 20:18]
    node _GEN_1 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[counterIO.scala 30:24 121:26 23:17]
    node _GEN_2 = mux(_T_7, UInt<3>("h6"), UInt<1>("h0")) @[counterIO.scala 123:22 25:13 30:24]
    node _GEN_3 = mux(_T_7, UInt<2>("h3"), UInt<1>("h0")) @[counterIO.scala 124:21 26:12 30:24]
    node _GEN_4 = mux(_T_7, UInt<2>("h2"), UInt<1>("h0")) @[counterIO.scala 30:24 126:27 28:18]
    node _GEN_5 = mux(_T_6, UInt<1>("h0"), _GEN_0) @[counterIO.scala 30:24 106:26]
    node _GEN_6 = mux(_T_6, UInt<1>("h1"), _GEN_1) @[counterIO.scala 30:24 109:26]
    node _GEN_7 = mux(_T_6, UInt<2>("h3"), _GEN_2) @[counterIO.scala 111:22 30:24]
    node _GEN_8 = mux(_T_6, UInt<2>("h2"), _GEN_3) @[counterIO.scala 112:21 30:24]
    node _GEN_9 = mux(_T_6, UInt<1>("h0"), _GEN_1) @[counterIO.scala 113:21 30:24]
    node _GEN_10 = mux(_T_6, UInt<1>("h0"), _GEN_4) @[counterIO.scala 30:24 114:27]
    node _GEN_11 = mux(_T_6, UInt<2>("h3"), _GEN_0) @[counterIO.scala 30:24 115:27]
    node _GEN_12 = mux(_T_5, UInt<1>("h0"), _GEN_5) @[counterIO.scala 30:24 94:26]
    node _GEN_13 = mux(_T_5, UInt<1>("h1"), _GEN_6) @[counterIO.scala 30:24 97:26]
    node _GEN_14 = mux(_T_5, UInt<2>("h3"), _GEN_7) @[counterIO.scala 30:24 99:22]
    node _GEN_15 = mux(_T_5, UInt<2>("h2"), _GEN_8) @[counterIO.scala 100:21 30:24]
    node _GEN_16 = mux(_T_5, UInt<1>("h0"), _GEN_9) @[counterIO.scala 101:21 30:24]
    node _GEN_17 = mux(_T_5, UInt<1>("h0"), _GEN_10) @[counterIO.scala 30:24 102:27]
    node _GEN_18 = mux(_T_5, UInt<2>("h2"), _GEN_11) @[counterIO.scala 30:24 103:27]
    node _GEN_19 = mux(_T_4, UInt<1>("h0"), _GEN_12) @[counterIO.scala 30:24 82:26]
    node _GEN_20 = mux(_T_4, UInt<1>("h1"), _GEN_12) @[counterIO.scala 30:24 83:23]
    node _GEN_21 = mux(_T_4, UInt<1>("h0"), _GEN_13) @[counterIO.scala 30:24 85:26]
    node _GEN_22 = mux(_T_4, UInt<2>("h2"), _GEN_14) @[counterIO.scala 30:24 87:22]
    node _GEN_23 = mux(_T_4, UInt<1>("h0"), _GEN_15) @[counterIO.scala 30:24 88:21]
    node _GEN_24 = mux(_T_4, UInt<1>("h0"), _GEN_16) @[counterIO.scala 30:24 89:21]
    node _GEN_25 = mux(_T_4, UInt<1>("h0"), _GEN_17) @[counterIO.scala 30:24 90:27]
    node _GEN_26 = mux(_T_4, UInt<1>("h1"), _GEN_18) @[counterIO.scala 30:24 91:27]
    node _GEN_27 = mux(_T_3, UInt<1>("h0"), _GEN_19) @[counterIO.scala 30:24 70:26]
    node _GEN_28 = mux(_T_3, UInt<1>("h0"), _GEN_20) @[counterIO.scala 30:24 71:22]
    node _GEN_29 = mux(_T_3, UInt<1>("h1"), _GEN_19) @[counterIO.scala 30:24 72:23]
    node _GEN_30 = mux(_T_3, UInt<1>("h1"), _GEN_21) @[counterIO.scala 30:24 73:25]
    node _GEN_31 = mux(_T_3, UInt<2>("h3"), _GEN_22) @[counterIO.scala 30:24 75:21]
    node _GEN_32 = mux(_T_3, UInt<1>("h0"), _GEN_23) @[counterIO.scala 30:24 76:20]
    node _GEN_33 = mux(_T_3, UInt<1>("h1"), _GEN_24) @[counterIO.scala 30:24 77:20]
    node _GEN_34 = mux(_T_3, UInt<1>("h0"), _GEN_25) @[counterIO.scala 30:24 78:26]
    node _GEN_35 = mux(_T_3, UInt<1>("h0"), _GEN_26) @[counterIO.scala 30:24 79:26]
    node _GEN_36 = mux(_T_2, UInt<1>("h1"), _GEN_27) @[counterIO.scala 30:24 58:25]
    node _GEN_37 = mux(_T_2, UInt<1>("h0"), _GEN_28) @[counterIO.scala 30:24 59:22]
    node _GEN_38 = mux(_T_2, UInt<1>("h0"), _GEN_29) @[counterIO.scala 30:24 60:23]
    node _GEN_39 = mux(_T_2, UInt<1>("h0"), _GEN_30) @[counterIO.scala 30:24 61:25]
    node _GEN_40 = mux(_T_2, UInt<3>("h5"), _GEN_31) @[counterIO.scala 30:24 63:21]
    node _GEN_41 = mux(_T_2, UInt<1>("h0"), _GEN_32) @[counterIO.scala 30:24 64:20]
    node _GEN_42 = mux(_T_2, UInt<1>("h1"), _GEN_33) @[counterIO.scala 30:24 65:20]
    node _GEN_43 = mux(_T_2, UInt<2>("h2"), _GEN_34) @[counterIO.scala 30:24 66:26]
    node _GEN_44 = mux(_T_2, UInt<1>("h0"), _GEN_35) @[counterIO.scala 30:24 67:26]
    node _GEN_45 = mux(_T_1, UInt<1>("h0"), _GEN_36) @[counterIO.scala 30:24 45:26]
    node _GEN_46 = mux(_T_1, UInt<1>("h0"), _GEN_37) @[counterIO.scala 30:24 46:23]
    node _GEN_47 = mux(_T_1, UInt<1>("h0"), _GEN_38) @[counterIO.scala 30:24 47:24]
    node _GEN_48 = mux(_T_1, UInt<1>("h1"), _GEN_39) @[counterIO.scala 30:24 48:26]
    node _GEN_49 = mux(_T_1, UInt<1>("h0"), _GEN_40) @[counterIO.scala 30:24 50:22]
    node _GEN_50 = mux(_T_1, UInt<1>("h0"), _GEN_41) @[counterIO.scala 30:24 51:21]
    node _GEN_51 = mux(_T_1, UInt<1>("h0"), _GEN_42) @[counterIO.scala 30:24 52:21]
    node _GEN_52 = mux(_T_1, UInt<1>("h0"), _GEN_43) @[counterIO.scala 30:24 53:27]
    node _GEN_53 = mux(_T_1, UInt<1>("h0"), _GEN_44) @[counterIO.scala 30:24 54:27]
    node _GEN_54 = mux(_T, UInt<1>("h0"), _GEN_45) @[counterIO.scala 30:24 32:27]
    node _GEN_55 = mux(_T, UInt<1>("h0"), _GEN_46) @[counterIO.scala 30:24 33:23]
    node _GEN_56 = mux(_T, UInt<1>("h0"), _GEN_47) @[counterIO.scala 30:24 34:24]
    node _GEN_57 = mux(_T, UInt<1>("h1"), _GEN_48) @[counterIO.scala 30:24 35:26]
    node _GEN_58 = mux(_T, UInt<1>("h1"), _GEN_49) @[counterIO.scala 30:24 37:22]
    node _GEN_59 = mux(_T, UInt<1>("h0"), _GEN_50) @[counterIO.scala 30:24 38:21]
    node _GEN_60 = mux(_T, UInt<1>("h1"), _GEN_51) @[counterIO.scala 30:24 39:21]
    node _GEN_61 = mux(_T, UInt<1>("h0"), _GEN_52) @[counterIO.scala 30:24 40:27]
    node _GEN_62 = mux(_T, UInt<1>("h0"), _GEN_53) @[counterIO.scala 30:24 41:27]
    io_memwrite <= _GEN_54
    io_branch <= _GEN_55
    io_memread <= _GEN_56
    io_regwrite <= _GEN_57
    io_memtoreg <= _GEN_56
    io_aluop <= _GEN_58
    io_opA <= pad(_GEN_59, 4)
    io_opB <= pad(_GEN_60, 2)
    io_extendsel <= pad(_GEN_61, 4)
    io_nextpcsel <= pad(_GEN_62, 4)
