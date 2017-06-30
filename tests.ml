open Core
open Core_bench

let bench tests =
  let run_config = 
    Bench.Run_config.create 
      ~verbosity:`High 
      ~time_quota: (Time.Span.of_sec 2.)
      () 
  in
  Bench.bench ~run_config tests
;;

let () = 
  let tests =
    (* Tuple_vs_record.tests *)
    Factorial.tests @
    Cons_vs_append.tests

  in
  bench tests


