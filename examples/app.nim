import prologue
import strformat
import ./nom

proc hello*(ctx: Context) {.async.} =
  var document = html(body(Div(h1("Hello Nom!")), id="page", class="greeting"))
  resp $document

let app = newApp()
app.get("/", hello)
app.run()

# To run this example'nimble install prologue' which is this webserver... https://github.com/planety/prologue
# nim c -r app.nim