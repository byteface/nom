import strformat
import std/[times, macros]
#import json
import std/json

proc render(inp: string, outp: string=""): string =
    echo inp
    return $inp

#[
type
  Attr = object
    key: string
    value: any
]#

type Node* = ref object of RootObj
  content: string
  attributes*: JsonNode
  name*: string

method valAttributes(this:Node): string =
  var attrs = ""
  if this.attributes != nil:
    for key, value in this.attributes:
        attrs &= fmt""" {key}={value}"""
  return attrs

type Element = ref object of Node
type HTMLElement = ref object of Element

type HTMLAnchorElement = ref object of HTMLElement
type HTMLAreaElement = ref object of HTMLElement
type HTMLAudioElement = ref object of HTMLElement
type HTMLBaseElement = ref object of HTMLElement
type HTMLBaseFontElement = ref object of HTMLElement
type HTMLBodyElement = ref object of HTMLElement
type HTMLBRElement = ref object of HTMLElement
type HTMLButtonElement = ref object of HTMLElement
type HTMLCanvasElement = ref object of HTMLElement
type HTMLContentElement = ref object of HTMLElement
type HTMLDataListElement = ref object of HTMLElement
type HTMLDataElement = ref object of HTMLElement
type HTMLDialogElement = ref object of HTMLElement
type HTMLDivElement = ref object of HTMLElement
type HTMLDListElement = ref object of HTMLElement
type HTMLDocument = ref object of HTMLElement
type HTMLEmbedElement = ref object of HTMLElement
type HTMLFieldSetElement = ref object of HTMLElement
type HTMLFormControlsCollection = ref object of HTMLElement
type HTMLFormElement = ref object of HTMLElement                        
type HTMLFrameSetElement = ref object of HTMLElement
type HTMLHeadElement = ref object of HTMLElement
type HTMLHeadingElement = ref object of HTMLElement
type HTMLHRElement = ref object of HTMLElement
type HTMLIFrameElement = ref object of HTMLElement
type HTMLImageElement = ref object of HTMLElement
type HTMLInputElement = ref object of HTMLElement
type HTMLIsIndexElement = ref object of HTMLElement
type HTMLKeygenElement = ref object of HTMLElement
type HTMLLabelElement = ref object of HTMLElement
type HTMLLegendElement = ref object of HTMLElement
type HTMLLIElement = ref object of HTMLElement
type HTMLLinkElement = ref object of HTMLElement
type HTMLMapElement = ref object of HTMLElement
type HTMLMediaElement = ref object of HTMLElement
type HTMLMetaElement = ref object of HTMLElement
type HTMLMeterElement = ref object of HTMLElement
type HTMLModElement = ref object of HTMLElement
type HTMLObjectElement = ref object of HTMLElement
type HTMLOListElement = ref object of HTMLElement
type HTMLOptGroupElement = ref object of HTMLElement
type HTMLOptionElement = ref object of HTMLElement
type HTMLOutputElement = ref object of HTMLElement
type HTMLParagraphElement = ref object of HTMLElement
type HTMLParamElement = ref object of HTMLElement
type HTMLPictureElement = ref object of HTMLElement
type HTMLPreElement = ref object of HTMLElement
type HTMLProgressElement = ref object of HTMLElement
type HTMLQuoteElement = ref object of HTMLElement
type HTMLScriptElement = ref object of HTMLElement
type HTMLSelectElement = ref object of HTMLElement
type HTMLShadowElement = ref object of HTMLElement
type HTMLSourceElement = ref object of HTMLElement
type HTMLSpanElement = ref object of HTMLElement
type HTMLStyleElement = ref object of HTMLElement
type HTMLTableCaptionElement = ref object of HTMLElement
type HTMLTableCellElement = ref object of HTMLElement
type HTMLTableColElement = ref object of HTMLElement
type HTMLTableDataCellElement = ref object of HTMLElement
type HTMLTableElement = ref object of HTMLElement
type HTMLTableHeaderCellElement = ref object of HTMLElement
type HTMLTableRowElement = ref object of HTMLElement
type HTMLTableSectionElement = ref object of HTMLElement
type HTMLTemplateElement = ref object of HTMLElement
type HTMLTextAreaElement = ref object of HTMLElement
type HTMLTimeElement = ref object of HTMLElement
type HTMLTitleElement = ref object of HTMLElement
type HTMLTrackElement = ref object of HTMLElement
type HTMLUListElement = ref object of HTMLElement
type HTMLUnknownElement = ref object of HTMLElement
type HTMLVideoElement = ref object of HTMLElement

#(Comment, DocumentType, DOMConfig, Text)

proc `$`*(this:Node): string = 
    fmt"<{this.name}{this.valAttributes()}>{this.content}</{this.name}>"

# utility prop builder for the tags
proc addProps(e: any, id="", style="", class="", href="", src=""): any =
  e.attributes = %* {}
  if id != "":
    e.attributes["id"] = %* id
  if style != "":
    e.attributes["style"] = %* style
  if class != "":
    e.attributes["class"] = %* class
  if href != "":
    e.attributes["href"] = %* href
  if src != "":
    e.attributes["src"] = %* src

  # TODO - loop a list of all attributes

  result = e

proc html*(content: varargs[string, `$`], id="", style="", class=""): HTMLElement =
  # TODO - we dont want to render when putting in. only when rendering other wise its not a dom
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLElement(name:"html", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc head*(content: varargs[string, `$`], id="", style="", class=""): HTMLHeadElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLHeadElement(name:"head", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc body*(content: varargs[string, `$`], id="", style="", class=""): HTMLBodyElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLBodyElement(name:"body", content:c)
  result = addProps(e, id=id, style=style, class=class)

# NOTE - div must be a builtin?
proc `div`*(content: varargs[string, `$`], id:string="", style:string="", class:string=""): HTMLDivElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLDivElement(name:"div", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc Div*(content: varargs[string, `$`], id="", style="", class=""): HTMLDivElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLDivElement(name:"div", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc h1*(content: varargs[string, `$`], id="", style="", class=""): HTMLHeadingElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLHeadingElement(name:"h1", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc h2*(content: varargs[string, `$`], id="", style="", class=""): HTMLHeadingElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLHeadingElement(name:"h2", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc h3*(content: varargs[string, `$`], id="", style="", class=""): HTMLHeadingElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLHeadingElement(name:"h3", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc h4*(content: varargs[string, `$`], id="", style="", class=""): HTMLHeadingElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLHeadingElement(name:"h4", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc h5*(content: varargs[string, `$`], id="", style="", class=""): HTMLHeadingElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLHeadingElement(name:"h5", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc script*(content: varargs[string, `$`], id="", style="", class=""): HTMLScriptElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLScriptElement(name:"script", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc style*(content: varargs[string, `$`], id="", style="", class=""): HTMLStyleElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLStyleElement(name:"style", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc p*(content: varargs[string, `$`], id="", style="", class=""): HTMLParagraphElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLParagraphElement(name:"p", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc i*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"i", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc b*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"b", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc a*(content: varargs[string, `$`], id="", style="", class="", href=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"a", content:c)
  result = addProps(e, id=id, style=style, class=class, href=href)

proc ul*(content: varargs[string, `$`], id="", style="", class=""): HTMLUListElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLUListElement(name:"ul", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc ol*(content: varargs[string, `$`], id="", style="", class=""): HTMLOListElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLOListElement(name:"ol", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc li*(content: varargs[string, `$`], id="", style="", class=""): HTMLLIElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLLIElement(name:"li", content:c)
  result = addProps(e, id=id, style=style, class=class)

# TODO - may need a param for data attributes.
proc strong*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"strong", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc blockquote*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"blockquote", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc table*(content: varargs[string, `$`], id="", style="", class=""): HTMLTableElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLTableElement(name:"table", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc tr*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"tr", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc td*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"td", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc form*(content: varargs[string, `$`], id="", style="", class=""): HTMLFormElement = # TODO - attributes
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLFormElement(name:"form", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc label*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"label", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc submit*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"submit", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc title*(content: varargs[string, `$`], id="", style="", class=""): HTMLTitleElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLTitleElement(name:"title", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc noscript*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"noscript", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc section*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"section", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc nav*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"nav", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc article*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"article", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc aside*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"aside", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc hgroup*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"hgroup", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc address*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"address", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc pre*(content: varargs[string, `$`], id="", style="", class=""): HTMLPreElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLPreElement(name:"pre", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc dl*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"dl", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc dt*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"dt", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc dd*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"dd", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc figure*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"figure", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc figcaption*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"figcaption", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc em*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"em", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc small*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"small", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc s*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"s", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc cite*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"cite", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc q*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"q", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc dfn*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"dfn", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc abbr*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"abbr", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc code*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"code", content:c)
  result = addProps(e, id=id, style=style, class=class)

#[
proc var*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"var", content:c)
  result = addProps(e, id=id, style=style, class=class)
]#

proc samp*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"samp", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc kbd*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"kbd", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc sub*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"sub", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc sup*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"sup", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc u*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"u", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc mark*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"mark", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc ruby*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"ruby", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc rt*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"rt", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc rp*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"rp", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc bdi*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"bdi", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc bdo*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"bdo", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc span*(content: varargs[string, `$`], id="", style="", class=""): HTMLSpanElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLSpanElement(name:"span", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc ins*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"ins", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc iframe*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"iframe", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc video*(content: varargs[string, `$`], id="", style="", class=""): HTMLVideoElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLVideoElement(name:"video", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc audio*(content: varargs[string, `$`], id="", style="", class=""): HTMLAudioElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLAudioElement(name:"audio", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc canvas*(content: varargs[string, `$`], id="", style="", class=""): HTMLCanvasElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLCanvasElement(name:"canvas", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc caption*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"caption", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc colgroup*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"colgroup", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc tbody*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"tbody", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc thead*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"thead", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc tfoot*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"tfoot", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc th*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"th", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc fieldset*(content: varargs[string, `$`], id="", style="", class=""): HTMLFieldSetElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLFieldSetElement(name:"fieldset", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc legend*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"legend", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc button*(content: varargs[string, `$`], id="", style="", class=""): HTMLButtonElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLButtonElement(name:"button", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc select*(content: varargs[string, `$`], id="", style="", class=""): HTMLSelectElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLSelectElement(name:"select", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc datalist*(content: varargs[string, `$`], id="", style="", class=""): HTMLDataListElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLDataListElement(name:"datalist", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc optgroup*(content: varargs[string, `$`], id="", style="", class=""): HTMLOptGroupElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLOptGroupElement(name:"optgroup", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc option*(content: varargs[string, `$`], id="", style="", class=""): HTMLOptionElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLOptionElement(name:"option", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc textarea*(content: varargs[string, `$`], id="", style="", class=""): HTMLTextAreaElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLTextAreaElement(name:"textarea", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc output*(content: varargs[string, `$`], id="", style="", class=""): HTMLOutputElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLOutputElement(name:"output", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc progress*(content: varargs[string, `$`], id="", style="", class=""): HTMLProgressElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLProgressElement(name:"progress", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc meter*(content: varargs[string, `$`], id="", style="", class=""): HTMLMeterElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLMeterElement(name:"meter", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc details*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"details", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc summary*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"summary", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc menu*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"menu", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc menuitem*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"menuitem", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc font*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"font", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc header*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"header", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc footer*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"footer", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc data*(content: varargs[string, `$`], id="", style="", class=""): HTMLDataElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLDataElement(name:"data", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc base*(content: varargs[string, `$`], id="", style="", class=""): HTMLBaseElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLBaseElement(name:"base", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc link*(content: varargs[string, `$`], id="", style="", class=""): HTMLLinkElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLLinkElement(name:"link", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc meta*(content: varargs[string, `$`], id="", style="", class=""): HTMLMetaElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLMetaElement(name:"meta", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc hr*(content: varargs[string, `$`], id="", style="", class=""): HTMLHRElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLHRElement(name:"hr", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc br*(content: varargs[string, `$`], id="", style="", class=""): HTMLBRElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLBRElement(name:"br", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc wbr*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"wbr", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc img*(content: varargs[string, `$`], id="", style="", class="", src=""): HTMLImageElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLImageElement(name:"img", content:c)
  result = addProps(e, id=id, style=style, class=class, src=src)

proc param*(content: varargs[string, `$`], id="", style="", class=""): HTMLParamElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLParamElement(name:"param", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc source*(content: varargs[string, `$`], id="", style="", class=""): HTMLSourceElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLSourceElement(name:"source", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc track*(content: varargs[string, `$`], id="", style="", class=""): HTMLTrackElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLTrackElement(name:"track", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc area*(content: varargs[string, `$`], id="", style="", class=""): HTMLAreaElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLAreaElement(name:"area", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc col*(content: varargs[string, `$`], id="", style="", class=""): HTMLTableColElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLTableColElement(name:"col", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc input*(content: varargs[string, `$`], id="", style="", class=""): HTMLInputElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLInputElement(name:"input", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc keygen*(content: varargs[string, `$`], id="", style="", class=""): HTMLKeygenElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLKeygenElement(name:"keygen", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc command*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"command", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc main*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"main", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc applet*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"applet", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc basefont*(content: varargs[string, `$`], id="", style="", class=""): HTMLBaseFontElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLBaseFontElement(name:"basefont", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc center*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"center", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc embed*(content: varargs[string, `$`], id="", style="", class=""): HTMLEmbedElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLEmbedElement(name:"embed", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc isindex*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"isindex", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc listing*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"listing", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc plaintext*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"plaintext", content:c)
  result = addProps(e, id=id, style=style, class=class)

#[
proc template*(content: varargs[string, `$`], id="", style="", class=""): Element =
  var c = ""
  for thing in content:
    c &= thing
  var e = Element(name:"template", content:c)
  result = addProps(e, id=id, style=style, class=class)
]#

proc picture*(content: varargs[string, `$`], id="", style="", class=""): HTMLPictureElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLPictureElement(name:"picture", content:c)
  result = addProps(e, id=id, style=style, class=class)

proc dialog*(content: varargs[string, `$`], id="", style="", class=""): HTMLDialogElement =
  var c = ""
  for thing in content:
    c &= thing
  var e = HTMLDialogElement(name:"dialog", content:c)
  result = addProps(e, id=id, style=style, class=class)

#[
proc doctype*(content: varargs[string, `$`], id="", style="", class=""): DocumentType =
  var e = DocumentType(name:"doctype")
  result = e
]#

#[
proc comment*(content: varargs[string, `$`], id="", style="", class=""): Comment =
  var c = ""
  for thing in content:
    c &= thing
  var e = Comment(name:"comment", content:c)
  result = e
]#

# proc create_element*(name: string): Element = # TODO - create custom tags
