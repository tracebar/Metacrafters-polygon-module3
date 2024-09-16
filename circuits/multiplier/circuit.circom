pragma circom 2.0.0;

//This circuit template checks that c is the multiplication of a and b./  

template Multiplier2 () {  
   signal input a_first;
   signal input b_first;
   signal x_second;
   signal y_second;
   signal output q_third;

   component and_gate=AND();
   component or_gate=OR();
   component not_gate=NOT();

   and_gate.a <== a_first;
   and_gate.b <== b_first;
   x_second <== and_gate.out ;

   not_gate.in <== b_first ;
   y_second <== not_gate.out;

   or_gate.a <== x_second;
   or_gate.b <== y_second;
   q_third <== or_gate.out;

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();