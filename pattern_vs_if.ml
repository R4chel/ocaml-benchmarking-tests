open Core
open Core_bench

let f1 v =
  if v then 1 else 0
;;

let f2 = function
  | true -> 1
  | false -> 0
;;

let f3 v =
  if not v then 0 else 1
;;

let list_length_0 = List.length

let rec list_length_1 l =
  match l with
  | hd :: tl -> 1 + list_length_1 tl
  | [] -> 0
;;

let rec list_length_1 l =
  match l with
  | hd :: tl -> 1 + list_length_1 tl
  | [] -> 0
;;

let rec list_length_2 l =
  if List.is_empty l then 0 else 1 + list_length_2 (List.tl_exn l)
;;

let list_length_3 l =
  List.fold l ~init:0 ~f:(fun acum _ -> acum + 1)
;;

let test_list = List.range 0 1000


let fun_to_bench f name n =
  Bench.Test.create ~name (fun () -> ignore (f n : int))
;;
let tests =
  [ fun_to_bench f1 "if true" true
  ; fun_to_bench f1 "if false" false
  ; fun_to_bench f2 "pattern true" true 
  ; fun_to_bench f2 "pattern false" false
  ; fun_to_bench f3 "if not true" true
  ; fun_to_bench f3 "if not false" false
  ; fun_to_bench list_length_0  "ll0" test_list
  ; fun_to_bench list_length_1  "ll1" test_list
  ; fun_to_bench list_length_2  "ll2" test_list
  ; fun_to_bench list_length_3  "ll3" test_list

  ]
