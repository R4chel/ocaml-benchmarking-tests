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

let tests =
  [Bench.Test.create ~name:"tuple" 
    (fun ()-> ignore (2.,3.))
    (*Bench.Test.create ~name:"Time.now" 
    (fun () -> ignore (Time.now ()));
    Bench.Test.create ~name:"Array.create3000" 
    (fun () -> ignore (Array.create 3000 0))*)
  ]
;;

let () =
  bench tests
