val eq_option_uuid : eq (option Uuid.uuid) =
	mkEq (fn x y =>
             case (x, y) of
                 (Some x, Some y) => (x = y)
               | (_, _) => False)

fun index () =
id <- source None;
return <xml>
  <head>
    <title>UUID example</title>
  </head>
  <body>
    <h1>UUID example</h1>
    
    <button onclick={fn _ =>
                        id' <- Uuid.generate ();
	                    set id (Some id')}>Generate new UUID (client-side)</button>
    <br/>

    <button onclick={fn _ => id' <- rpc (Uuid.generate ());
                        set id (Some id')}>Generate new UUID (server-side)</button>

    <p>Here's your UUID:</p>

    <dyn signal={v <- signal id;
                 return (case v of
                     None => <xml>(nothing yet)</xml>
                   | Some id => <xml>{[v]}</xml>)
                }/>

    <p>Test cases</p>
    <p>Some UUID: {[@read Uuid.read_uuid "df7cca36-3d7a-40f4-8f06-ae03cc22f045"]}</p>
    <p>Nil UUID: {[@read Uuid.read_uuid "00000000-0000-0000-0000-000000000000"]}</p>
    <p>True: {[@read Uuid.read_uuid "df7cca36-3d7a-40f4-8f06-ae03cc22f045" = @read Uuid.read_uuid "DF7CCA36-3D7A-40F4-8F06-AE03CC22F045"]}</p>
    <p>Nothing: {[@read Uuid.read_uuid ""]}</p>
  </body>
</xml>
