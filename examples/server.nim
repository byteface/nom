import std/asynchttpserver
import ./nom
import std/asyncdispatch

proc main {.async.} =
  var server = newAsyncHttpServer()
  proc cb(req: Request) {.async.} =
    echo (req.reqMethod, req.url, req.headers)
    let headers = {"Content-type": "text/html; charset=utf-8"}
    var document = html(body(Div(h1("Hello Nom!")), id="page", class="greeting"))
    await req.respond(Http200, $document, headers.newHttpHeaders())

  server.listen(Port(0)) # or Port(8080) to hardcode the standard HTTP port.
  let port = server.getPort
  echo "test this with: curl localhost:" & $port.uint16 & "/"
  while true:
    if server.shouldAcceptRequest():
      await server.acceptRequest(cb)
    else:
      # too many concurrent connections, `maxFDs` exceeded
      # wait 500ms for FDs to be closed
      await sleepAsync(500)

waitFor main()