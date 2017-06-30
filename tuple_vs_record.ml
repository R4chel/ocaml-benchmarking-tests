open Core
open Core_bench

type r =
  { first  : int
  ; second : float
  ; third  : Time.t
  }

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
  let t1 = Time.of_string "2017-05-25 12:46:15.232-4:00" in 
  [ Bench.Test.create
      ~name:"tuple"
      (fun ()->
         ignore (let x () = (3, 2., t1) in x ()))
  ; Bench.Test.create
      ~name:"record"
      (fun () ->
         ignore (
           let x () = {first = 3; second = 2.; third = Time.now ()}
           in x ()))
  ]
;;

