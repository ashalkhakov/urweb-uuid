type uuid = string

fun parse_uuid s =
    if strlen s <> 36 then None
    else (let
            fun strall pred s =
                let
                    val sl = strlen s
                    fun loop i r =
                        if i < sl then let
                                val r = r && pred (strsub s i)
                            in
                                if r then loop (i+1) r
                                else False
                            end
                        else r
                in
                    loop 0 True
                end
            val xd =
                strall isxdigit

            (* canonicalize (to simplify equality checks, etc.) *)
            val s = String.mp tolower s

            val a = substring s 0 8
            val _x = (strsub s 8) = #"-"
            val b = substring s 9 4
            val _y = (strsub s 13) = #"-"
            val c = substring s 14 4
            val _z = (strsub s 18) = #"-"
            val d = substring s 19 4
            val _w = (strsub s 23) = #"-"
            val e = substring s 24 8
        in
            if xd a && _x && xd b && _y && xd c && _z && xd d && _w && xd e then (Some s)
            else None
        end)
            
val read_uuid =
    mkRead (fn s =>
                case parse_uuid s of
                    Some x => x
                  | None => error <xml>Unable to parse {[s]} as UUID</xml>)
           parse_uuid

val generate = Uuid__FFI.generate

val nil = "00000000-0000-0000-0000-000000000000"
fun is_null x = (x = nil)
