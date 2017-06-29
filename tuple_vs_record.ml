open Core
open Core_bench

let bench tests =
  Bench.bench tests
;;

let tests =
  [ Bench.Test.create ~name:"tuple" (fun ()-> (2,3))]

let () =
  bench tests
