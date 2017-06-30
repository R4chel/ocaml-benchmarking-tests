open Core
open Core_bench

let rec gen_list_1 i j = 
    if i = j 
    then []
    else i :: gen_list_1 (i + 1) j
;;

let rec gen_list_2 i j = 
    if i = j 
    then []
    else gen_list_2  i (j - 1) @ [j]
;;

(*
let rec gen_list_3 n = 
    match n with
    | 0 -> []
    | n -> gen_list_1 (n - 1) @ [n]
;;
*)


let fun_to_test name f n =
  Bench.Test.create ~name (fun () -> ignore (f n : int list))
;;


let tests =
    [ fun_to_test "gen_list_1" (gen_list_1 0) 1_000
    ; fun_to_test "gen_list_2" (gen_list_2 0) 1_000
    ]

;;
