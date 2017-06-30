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
    List.fold (List.range 1 (n+1)) ~init:1 ~f:(fun acum n -> acum * n)
;;

let factorial_4 n =
  let counter = ref 1 in
  for i = 1 to n
  do counter := !counter * i
  done;
  !counter
;;



let tests =
  []
