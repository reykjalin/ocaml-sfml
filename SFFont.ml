type u
type t = { u:u; s:string }

external getDefaultFont: unit -> u = "caml_sfFont_GetDefaultFont"

external createFromFile:
  ?charSize:int -> ?charset:int32 -> string -> u
  = "caml_sfFont_CreateFromFile"

external createFromMemory:
  ?charSize:int -> ?charset:int32 -> string -> u
  = "caml_sfFont_CreateFromMemory"

external destroy: font:u -> unit = "caml_sfFont_Destroy"

let destroy font = destroy font.u

let getDefaultFont () =
  let u = getDefaultFont () in
  let t = {u=u; s=" "} in
  Gc.finalise destroy t;
  (t)

let createFromFile ?charSize ?charset filename =
  let u = createFromFile ?charSize ?charset filename in
  let t = {u=u; s=" "} in
  Gc.finalise destroy t;
  (t)

let createFromMemory ?charSize ?charset buffer =
  let u = createFromMemory ?charSize ?charset buffer in
  let t = {u=u; s=" "} in
  Gc.finalise destroy t;
  (t)
