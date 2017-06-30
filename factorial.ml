open Core
open Core_bench

let rec factorial_1 n =
  if n <= 1 then 1
  else n * factorial_1 (n - 1)
;;

let factorial_2 n =
  let rec fact_iter acum counter n =
    if counter > n then acum
    else fact_iter (acum * counter) (counter + 1) n
  in
  fact_iter 1 1 n
;;

let factorial_3 n =
    List.fold_left (List.range 1 (n+1)) ~init:1 ~f:(fun acum n -> acum * n)
;;

let factorial_4 n =
    List.fold_right (List.range 1 (n+1)) ~init:1 ~f:(fun n acum -> acum * n)
;;

let factorial_5 n =
  let counter = ref 1 in
  for i = 1 to n
  do counter := !counter * i
  done;
  !counter
;;

let fun_to_bench f name n =
  Bench.Test.create ~name (fun () -> ignore (f n : int))
;;


let%expect_test "factorial_1" =
  let result = factorial_1 5 in
  Out_channel.output_string stdout (Int.to_string result);
  [%expect {| 121 |}]
;;


let tests =
    [ fun_to_bench factorial_1 "factorial_1" 1_000
    ; fun_to_bench factorial_2 "factorial_2" 1_000
    ; fun_to_bench factorial_3 "factorial_3" 1_000
    ; fun_to_bench factorial_4 "factorial_4" 1_000
    ; fun_to_bench factorial_5 "factorial_5" 1_000
    ]

;;

let () =
  assert (factorial_1 5 = 120);
  assert (factorial_2 5 = 120);
  assert (factorial_3 5 = 120);
  assert (factorial_4 5 = 120);
  assert (factorial_5 5 = 120);
