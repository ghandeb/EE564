//         Left: A B C N
//        Right: ROT1 ROT2 Pos

// A           : Phase A
// B           : Phase B
// C           : Phase C
// N           : Neutral
// ROT1        : Mechanical plus
// ROT2        : Mechanical minus
// Pos         : Position

MODELDEF Setup1
{
PORT electrical: A;
PORT electrical: B;
PORT electrical: C;
PORT electrical: N;
PORT ROTATIONAL_V: ROT1;
PORT ROTATIONAL_V: ROT2;
PORT REAL OUT ANGLE[deg]: Pos = VM_Pos.V;
PORT REAL IN ANGLE[deg]: IniPos = 0;

INTERN  R        Ra  N1:=A, N2:=N0_1  ( R:=2.59878 ); 
INTERN  R        Rb  N1:=B, N2:=N0_2  ( R:=2.59878 ); 
INTERN  R        Rc  N1:=C, N2:=N0_3  ( R:=2.59878 ); 
UMODEL Transformation_3To2 AB0 NAP:=N0_1, NAN:=N, NBP:=N0_2, NBN:=N, NCP:=N0_3, NCN:=N, NALPHA:=alpha, NBETA:=beta, NZERO:=zero () SRC: DLL( File:="Transformation.dll");

INTERN  EV       Speed  N1:=NM_1, N2:=GND  ( QUANT:=Torq.V, FACT:=1 ); 
INTERN  II       Torq  N1:=NM_6, N2:=NM_5  ( QUANT:=Speed.I, FACT:=1 ); 
UMODEL D2D D2D1 N1:=NM_5, N2:=ROT1 ( NATURE_1:="electrical", NATURE_2:="Rotational_V" ) SRC: DLL( File:="Domains.dll");
UMODEL D2D D2D2 N1:=NM_6, N2:=ROT2 ( NATURE_1:="electrical", NATURE_2:="Rotational_V" ) SRC: DLL( File:="Domains.dll");
INTERN  VM       VM_Pos  N1:=NM_2, N2:=GND  ; 
MODEL Setup1_AB0 model1 N_1:=alpha, N_2:=beta, N_3:=zero, N_4:=NM_1, N_5:=NM_2 ( pos0:=IniPos );


//         Left: N_1 N_2 N_3
//        Right: N_4 N_5

MODELDEF Setup1_AB0
{
PORT electrical: N_1;
PORT electrical: N_4;
PORT electrical: N_2;
PORT electrical: N_5;
PORT electrical: N_3;
PORT REAL IN: pos0 = 0;

INTERN  L        L1d  N1:=N_1, N2:=N_8  ( L:=N_41.V, I0:=0 ); 
INTERN  L        Lmd  N1:=N_8, N2:=GND  ( L:=N_43.V, I0:=0 ); 
INTERN  R        Rfed  N1:=N_8, N2:=GND  ( R:=3.98277e+006 ); 
INTERN  L        L2d  N1:=N_9, N2:=N_8  ( L:=N_42.V, I0:=0 ); 
INTERN  R        R2d  N1:=N_10, N2:=N_9  ( R:=0.00388427 ); 
INTERN  E        B2d  N1:=N_10, N2:=N_11  ( EMF:=3 * N_42.V * N_4.V * L2q.I, PARTDERIV:=1 ); 
INTERN  L        L2td  N1:=N_12, N2:=N_11  ( L:=4.33924e-005, I0:=0 ); 
INTERN  L        L2bd  N1:=N_13, N2:=N_11  ( L:=0.000153001, I0:=0 ); 
INTERN  M        K2d  ( L1:= L2td.L, L2:= L2bd.L, K:=0.668533 ); 
INTERN  R        R2td  N1:=N_14, N2:=N_12  ( R:=0.0120161 ); 
INTERN  R        R2bd  N1:=N_15, N2:=N_13  ( R:=0.0043769 ); 
INTERN  E        B2ttd  N1:=N_14, N2:=N_16  ( EMF:=0.000130177 * N_4.V * L2tq.I, PARTDERIV:=1 ); 
INTERN  E        B2btd  N1:=N_15, N2:=N_17  ( EMF:=0.000163417 * N_4.V * L2tq.I, PARTDERIV:=1 ); 
INTERN  E        B2tbd  N1:=N_16, N2:=N_18  ( EMF:=0.000163417 * N_4.V * L2bq.I, PARTDERIV:=1 ); 
INTERN  E        B2bbd  N1:=N_17, N2:=N_18  ( EMF:=0.000459003 * N_4.V * L2bq.I, PARTDERIV:=1 ); 
INTERN  E        Bmd  N1:=N_18, N2:=GND  ( EMF:=3 * N_43.V * N_4.V * Lmq.I, PARTDERIV:=1 ); 
INTERN  L        L1q  N1:=N_2, N2:=N_28  ( L:=N_41.V, I0:=0 ); 
INTERN  L        Lmq  N1:=N_28, N2:=GND  ( L:=N_43.V, I0:=0 ); 
INTERN  R        Rfeq  N1:=N_28, N2:=GND  ( R:=3.98277e+006 ); 
INTERN  L        L2q  N1:=N_29, N2:=N_28  ( L:=N_42.V, I0:=0 ); 
INTERN  R        R2q  N1:=N_30, N2:=N_29  ( R:=0.00388427 ); 
INTERN  E        B2q  N1:=N_30, N2:=N_31  ( EMF:=-3 * N_42.V * N_4.V * L2d.I, PARTDERIV:=1 ); 
INTERN  L        L2tq  N1:=N_32, N2:=N_31  ( L:=4.33924e-005, I0:=0 ); 
INTERN  L        L2bq  N1:=N_33, N2:=N_31  ( L:=0.000153001, I0:=0 ); 
INTERN  M        K2q  ( L1:= L2tq.L, L2:= L2bq.L, K:=0.668533 ); 
INTERN  R        R2tq  N1:=N_34, N2:=N_32  ( R:=0.0120161 ); 
INTERN  R        R2bq  N1:=N_35, N2:=N_33  ( R:=0.0043769 ); 
INTERN  E        B2ttq  N1:=N_34, N2:=N_36  ( EMF:=-0.000130177 * N_4.V * L2td.I, PARTDERIV:=1 ); 
INTERN  E        B2btq  N1:=N_35, N2:=N_37  ( EMF:=-0.000163417 * N_4.V * L2td.I, PARTDERIV:=1 ); 
INTERN  E        B2tbq  N1:=N_36, N2:=N_38  ( EMF:=-0.000163417 * N_4.V * L2bd.I, PARTDERIV:=1 ); 
INTERN  E        B2bbq  N1:=N_37, N2:=N_38  ( EMF:=-0.000459003 * N_4.V * L2bd.I, PARTDERIV:=1 ); 
INTERN  E        Bmq  N1:=N_38, N2:=GND  ( EMF:=-3 * N_43.V * N_4.V * Lmd.I, PARTDERIV:=1 ); 
INTERN  L        L0  N1:=N_3, N2:=GND  ( L:=0.000944041, I0:=0 ); 
INTERN  I        BT  N1:=GND, N2:=N_4  ( IS:=3 * N_43.V * (L2d.I*Lmq.I - L2q.I*Lmd.I), PARTDERIV:=1 ); 
INTERN  VM       VM_Speed  N1:=N_4, N2:=GND  ; 
INTERN  IV       Gx  N1:=GND, N2:=N_55  ( QUANT:=VM_Speed.V, FACT:=1 ); 
INTERN  C        Cx  N1:=N_55, N2:=GND  ( C:=1, V0:=pos0*0.0174533 ); 
INTERN  VM       VM_Pos  N1:=N_55, N2:=GND  ; 
INTERN  EV       Ex2  N1:=GND, N2:=N_5  ( QUANT:=VM_Pos.V, FACT:=57.2958 ); 
INTERN  E        BIsr  N1:=GND, N2:=N_39  ( EMF:=sqrt(L1d.I*L1d.I + L1q.I*L1q.I), PARTDERIV:=1 ); 
INTERN  VM       VM_Isr  N1:=N_39, N2:=GND  ; 
INTERN  E        BIm  N1:=GND, N2:=N_40  ( EMF:=sqrt(Lmd.I*Lmd.I + Lmq.I*Lmq.I), PARTDERIV:=1 ); 
INTERN  VM       VM_Im  N1:=N_40, N2:=GND  ; 
INTERN  VM       VM_L1  N1:=N_41, N2:=GND  ; 
INTERN  NDSRC    PL1 N0:=N_41, N1:=GND  ( QUANT:={N_39.V}, SRC:={vsrc}, TableData:="\
.MODEL Setup1_l1_table pwl TABLE=( 51, 0, 12.1638, 24.3276, 36.4913, 48.6551,\
 60.8189, 72.9827, 85.1465, 97.3103, 109.474, 121.638, 133.802, 145.965,\
 158.129, 170.293, 182.457, 194.621, 206.784, 218.948, 231.112, 243.276,\
 255.439, 267.603, 279.767, 291.931, 304.095, 316.258, 328.422, 340.586,\
 352.75, 364.913, 377.077, 389.241, 401.405, 413.569, 425.732, 437.896, 450.06,\
 462.224, 474.388, 486.551, 498.715, 510.879, 523.043, 535.206, 547.37,\
 559.534, 571.698, 583.862, 596.025, 608.189, 1, 0.000945043, 0.000945016,\
 0.000944989, 0.000944963, 0.000944936, 0.000944909, 0.000944882, 0.000944856,\
 0.000944829, 0.000944802, 0.000944776, 0.000944749, 0.000944722, 0.000944696,\
 0.000944669, 0.000944643, 0.000944616, 0.00094459, 0.000944563, 0.000944537,\
 0.00094451, 0.000944484, 0.000944458, 0.000944431, 0.000944405, 0.000944379,\
 0.000944353, 0.000944326, 0.0009443, 0.000944274, 0.000944248, 0.000944222,\
 0.000944195, 0.000944169, 0.000944143, 0.000944117, 0.000944091, 0.000944065,\
 0.000944039, 0.000944013, 0.000943987, 0.000943961, 0.000943935, 0.000943909,\
 0.000943884, 0.000943858, 0.000943832, 0.000943806, 0.00094378, 0.000943755,\
 0.000943729) CONSTANT NOSPLINE" );
INTERN  VM       VM_L2  N1:=N_42, N2:=GND  ; 
INTERN  NDSRC    PL2 N0:=N_42, N1:=GND  ( QUANT:={N_39.V}, SRC:={vsrc}, TableData:="\
.MODEL Setup1_l2_table pwl TABLE=( 51, 0, 12.1638, 24.3276, 36.4913, 48.6551,\
 60.8189, 72.9827, 85.1465, 97.3103, 109.474, 121.638, 133.802, 145.965,\
 158.129, 170.293, 182.457, 194.621, 206.784, 218.948, 231.112, 243.276,\
 255.439, 267.603, 279.767, 291.931, 304.095, 316.258, 328.422, 340.586,\
 352.75, 364.913, 377.077, 389.241, 401.405, 413.569, 425.732, 437.896, 450.06,\
 462.224, 474.388, 486.551, 498.715, 510.879, 523.043, 535.206, 547.37,\
 559.534, 571.698, 583.862, 596.025, 608.189, 1, 0.000213688, 0.000213651,\
 0.000213613, 0.000213576, 0.000213538, 0.000213501, 0.000213463, 0.000213426,\
 0.000213389, 0.000213352, 0.000213314, 0.000213277, 0.00021324, 0.000213203,\
 0.000213166, 0.000213128, 0.000213091, 0.000213054, 0.000213017, 0.00021298,\
 0.000212943, 0.000212906, 0.000212869, 0.000212832, 0.000212796, 0.000212759,\
 0.000212722, 0.000212685, 0.000212648, 0.000212611, 0.000212575, 0.000212538,\
 0.000212501, 0.000212465, 0.000212428, 0.000212391, 0.000212355, 0.000212318,\
 0.000212282, 0.000212245, 0.000212209, 0.000212172, 0.000212136, 0.000212099,\
 0.000212063, 0.000212027, 0.00021199, 0.000211954, 0.000211918, 0.000211882,\
 0.000211845) CONSTANT NOSPLINE" );
INTERN  VM       VM_Lm  N1:=N_43, N2:=GND  ; 
INTERN  NDSRC    PLm N0:=N_43, N1:=GND  ( QUANT:={N_40.V}, SRC:={vsrc}, TableData:="\
.MODEL Setup1_lm_table pwl TABLE=( 51, 0, 7.15065, 14.3013, 21.452, 28.6026,\
 35.6671, 42.6705, 49.4968, 56.0883, 62.3694, 68.5848, 74.7108, 80.7861,\
 86.8729, 93.0344, 99.1697, 105.297, 111.482, 117.9, 124.337, 130.787, 137.364,\
 143.891, 150.419, 156.954, 163.431, 170.041, 177.229, 184.414, 192.177,\
 200.174, 208.599, 217.394, 226.393, 236.413, 247.319, 258.244, 270.178,\
 282.52, 299.278, 317.783, 408.872, 678.34, 1159.68, 1652.75, 2232.03, 2921.82,\
 3873.82, 5322.83, 6974.5, 9020.42, 1, 0.00963061, 0.00963061, 0.00963061,\
 0.00963061, 0.00963061, 0.00965388, 0.00968328, 0.00973912, 0.00982239,\
 0.00993734, 0.0100409, 0.0101393, 0.0102293, 0.0103052, 0.010363, 0.0104162,\
 0.0104641, 0.0105013, 0.0105138, 0.0105233, 0.0105309, 0.010528, 0.010529,\
 0.0105299, 0.0105303, 0.0105343, 0.0105298, 0.0104913, 0.0104559, 0.0103919,\
 0.0103208, 0.0102341, 0.0101368, 0.0100381, 0.0099039, 0.00974564, 0.0096,\
 0.00943086, 0.00926263, 0.00897406, 0.00866821, 0.00741079, 0.00487297,\
 0.0030879, 0.00233335, 0.00185119, 0.00150843, 0.00120884, 0.000931513,\
 0.000750412, 0.000610749) CONSTANT NOSPLINE" );
}

}