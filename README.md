# Nom: A Nim DOM

Nom is a Nim DOM!

# About

Trying nim for the first time. Created a small project to play around with it.

Nom lets you create html templates direclty in nim-lang.

```
echo html(body(Div(h1("Hello World!")), id="page", class="greeting"))
```

Use the $ to render the dom to a string. i.e.

```
var document = html(body(Div(h1("Hello World!")), id="page", class="greeting"))
resp = $document
```

# Setup

Looks like you install 'choosenim'

https://nim-lang.org/install_unix.html

Then run ```choosenim 1.6.0```

# Compiling

To compile the DOM do...

```
nimble build
```

# Running tests

To run these tests, execute...

```
nimble test
```

# Running examples

See examples folder.

tbc

# Installing

I think it will be something like...

```
nimble install https://github.com/byteface/nom
```

# Gotchas

The 'div' keyword in nim is already a binary division operator so our div requires an uppercase D not to clash. i.e. ```Div('some content')```

alternatively it appears you can wrap it backticks i.e. ```\`div\`('some test')```