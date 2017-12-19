type uuid

val sql_uuid : sql_injectable_prim uuid

val eq_uuid : eq uuid
val ord_uuid : ord uuid
val show_uuid : show uuid
val read_uuid : read uuid

(** generate a fresh UUID *)
val generate : unit -> transaction uuid

(** the empty UUID (all zeroes) *)
val nil : uuid
(** returns [True] if the given UUID is empty *)
val is_null : uuid -> bool
