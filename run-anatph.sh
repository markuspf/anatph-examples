#!/usr/bin/env bash

echo "Running ANATPH RSymTest on $1"
# Run the ANATPH RSym Tester
mkdir -p results/$1/
$GAP -q <<GAPInput
   LoadPackage("anatph");
   instr := InputTextFile("$1/presentation-gap");
   pgp := PregroupPresentationFromStream(instr);
   t1 := NanosecondsSinceEpoch();
   res := RSymTest(pgp, 1/12); 
   t2 := NanosecondsSinceEpoch() - t1;
   PrintTo("results/$1/rsym-result", res);
   PrintTo("results/$1/rsym-time", t2);
   QUIT_GAP(0);
GAPInput
echo "Done"
