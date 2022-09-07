let () = Printf.printf "Insira tamanho de tabuleiro: "
let t = read_int() (*tamanh tabuleiro*)
(*caso o valor não tenha raiz inteira, não pode ser um tabuleiro de sudoku válido*)
let () = if not (Float.is_integer(sqrt (float_of_int(t)))) then invalid_arg "Número não tem raiz inteira"

let printf_sudoku matrix =
  Printf.printf("\n");
  let temp = int_of_float (sqrt (float_of_int(t))) in
  let size = String.length((string_of_int)t) in (*caso chegue ao digitos duplos/triplos/...*)

  for i = 0 to t - 1 do
    if i != 0 && i mod temp = 0 then
      for k = 1 to temp do 
        for j = 1 to (temp * (2 + (size-1))) do
          Printf.printf "-";
        done;
        if k > 1 && k < temp then Printf.printf "-";
        if k != temp then Printf.printf " "
        else Printf.printf "\n";
      done;

    for j = 0 to t - 1 do
        if j != 0 && j mod temp = 0 then Printf.printf "| ";
        if String.length((string_of_int)matrix.(i).(j)) < size then
          (for zero = 1 to (size-1) do
          Printf.printf "0"
          done);
        Printf.printf "%d " matrix.(i).(j);
    done;
    Printf.printf "\n"
  done

let qual_quadrado x y = ((x / (int_of_float(sqrt (float_of_int(t))))), (y / (int_of_float(sqrt (float_of_int(t))))))

let verificar matrix x y = 
  let temp = ref true in

  for i = 0 to (t-1) do (*verificar linha + coluna*)
    if i != y && matrix.(x).(i) != 0 && matrix.(x).(i) = matrix.(x).(y) then temp := false;
    if i != x && matrix.(i).(y) != 0 && matrix.(i).(y) = matrix.(x).(y) then temp := false;
  done;

  for i = 0 to (t-1) do
    for j = 0 to (t-1) do
      if qual_quadrado i j = qual_quadrado x y then (*realiza for até as coordenadas estarem no mesmo quadrante que x y está*)
        if i != x && j != y && matrix.(i).(j) != 0 && matrix.(x).(y) != 0 && matrix.(i).(j) = matrix.(x).(y) then temp := false; 
      done;
    done;
  !temp

let sudoku = Array.make_matrix t t 0

let () = Printf.printf "Insira as linhas com algumas posições já feitas (use 0 para posições vazias): "
let () = Printf.printf "\nEx. \"9 0 3 1 0 2 0 0 0\"\n"
let () = 
  let temp1 = ref 0 in (*linha*)
  while (!temp1 < t) do (*quando chegar ao limite para*)
    let string = read_line() in
    let temp2 = ref 0 in (*ler carateres da string de 2 em 2*)
    let temp3 = ref 0 in (*passar coluna*)
        while (!temp2 <= ((t-1)*2)) do (*ler 0, 2, 4, 6.... da string para detetar números*)
          sudoku.(!temp1).(!temp3) <- int_of_char (String.get string !temp2) - 48; (*converte char para int*)
          if verificar sudoku !temp1 !temp3 = false then invalid_arg "linha/coluna/quadrado não válido";
          temp2 := !temp2 + 2; (*continua string*)
          incr temp3; (*salta coluna*)
        done;
      incr temp1; (*salta linha)*)
    done

let rec resolver_sudoku matrix x y i =
  let solution = ref false in

  if x >= t || y >= t then
    (solution := true);

  if !solution = false && i <= t then
    (if matrix.(x).(y) = 0 then (matrix.(x).(y) <- i;

      if (verificar matrix x y) then
        (if y = t - 1 then
          (if (resolver_sudoku matrix (x+1) 0 1) then solution := true)
        else 
          (if (resolver_sudoku matrix x (y+1) 1) then solution := true));

    if !solution = false then (matrix.(x).(y) <- 0;
    solution := resolver_sudoku matrix x y (i+1)))

    else 
      (if y = t - 1 then
        (if (resolver_sudoku matrix (x+1) 0 1) then solution := true)
      else 
        (if (resolver_sudoku matrix x (y+1) 1) then solution := true))); 
  !solution
    
let () =
  if resolver_sudoku sudoku 0 0 1 then printf_sudoku sudoku
  else Printf.printf "falso\n"