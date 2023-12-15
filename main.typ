#import "@preview/polylux:0.3.1": *
#import "@preview/codly:0.1.0": *
#import "ugent-theme.typ": *
#import "./common/typstguy.typ": typstguy

// Get the current date, you can also replace it with your
// presentation's date:
// #let date = datetime(year: 2023, month: 06, day: 29)
#let date = datetime.today()

// Configure the slides:
#show: ugent-theme.with(
  // The authors of the presentation
  authors: "Sébastien d'Herbais de Thun",

  // The short version of your name (e.g. for the footer)
  short-authors: "S. d'Herbais de Thun",

  // The role you have in the University
  role: [ Student ],

  // The title of the presentation
  title: [ Typst: a modern LaTeX replacement ],

  // The subtitle of the presentation
  subtitle: [
    Workshop for 2nd year MSc. in Photonics Student
  ],

  // The short title of the presentation (e.g. for the footer)
  short-title: [ Typst: a modern LaTeX replacement ],

  // The date of the presentation
  date: date,

  // The email address you want to display on the slides (or `none`)
  email: "sebastien.dherbaisdethun@ugent.be",

  // The mobile number you want to display on the slides (or `none`)
  mobile: none,

  // The department you are part of
  dept: "Photonics Engineering",

  // The research group you are part of
  research-group: none,

  // The link to your LinkedIn profile
  linkedin: "https://www.linkedin.com/in/s%C3%A9bastien-d-herbais-de-thun-069913206/",

  // Set this to true to generate a handout version of the slides.
  handout: true,

  // Whether to display a small progress bar at the bottom of the slides.
  progress-bar: true,
)

#let latex-logo = [
  #set text(font: "New Computer Modern")
  L#box[#move(dx: 0em, dy: -0.20em)[
    #box[
      #pad(left: -0.3em)[
        #text(size: 0.7em)[A]
      ]
    ]
  ]]#box[
    #pad(left: -0.15em)[T]
  ]#box[#move(dx: 0em, dy: 0.24em)[
    #box[
      #pad(left: -0.2em)[E]
    ]
  ]]#box[
    #pad(left: -0.15em)[X]
  ]
]

// This can be removed if you don't include code:
#let code-icon(icon) = text(
  font: "tabler-icons",
  fallback: false,
  weight: "regular",
  size: 16pt,
  icon,
)

// Configure codly
#show: codly-init.with()
#codly(
  languages: (
    latex: (name: latex-logo, icon: none, color: red),
    typ: (name: [ Typst ], icon: typstguy, color: rgb("#239DAD")),
  ),
  width-numbers: 1em
)

// UGent logo
#corporate-logo()

// Global title slide
#title-slide()

// Print a nice outline of the presentation
#outline-slide()

// Start of the first section
#section-slide("Introduction")

// We create a simple slide.
#slide(title: [Why?])[
  #line-by-line[
    - LaTeX is *old*
    - LaTeX is *hard*
    - LaTeX is *ugly*
    ```latex
      \title{My first LaTeX document}
      \author{Hubert Farnsworth\thanks{Funded by the Overleaf team.}}
      \date{August 2022}
      \begin{document}
      \maketitle
    ```
    - LaTeX is *slow*
  ]
][
  #line-by-line(start: 5)[
    - Typst is *modern*
    - Typst is *easy*
    - Typst is *beautiful*
    ```typ
      // Easy as pie
      #set document(
        title: "My first Typst document",
        author: "Hubert Farnsworth",
      )
    ```
    - Typst is *fast*
  ]
]

#slide(title: [ Is LaTeX really that old? ])[
  #line-by-line[
    - TeX was created in 1978 by *Donald Knuth*
      - Dude is absolutely bad-ass
      - Wrote "The Art of Computer Programming"
      - Created *METAFONT* & *Computer Modern*
      - Line-breaking algorithm
      - Document format: *DVI*
      - Created *WEB*
    - LaTeX was created in 1983 by *Leslie Lamport*
      - Set of macros of TeX
      - Easier to use
      - Closer logical structure #sym.arrow.l.r visual structure
  ]
]

#slide(title: [ Is it really that hard? ])[
  #line-by-line[
    - LaTeX is known for it's cryptic errors \ ```
      ! Undefined control sequence.
      \enit@setresumekeys ...it@toks }\ifnum \enit@type 
          =\z@ #3\def \enit@noexcs {...
    ```
    - People just Google for info
    - The documentation is often hard to search
  ]
]

#slide(title: [ LaTeX is ugly? ])[
  #quote(attribution: link("https://www.reddit.com/user/atloomis/")[u/atloomis], block: true, quotes: true)[
    Because it [LaTeX] is so hacky and messy. [...]
  ]

  - Have you ever wondered what goes on in your `documentclass`?
  ```latex
    \def\@citex[#1]#2{%
    \let\@citea\@empty
    \@cite{\@for\@citeb:=#2\do
      {\@citea\def\@citea{], [}%
      \edef\@citeb{\expandafter\@firstofone\@citeb\@empty}%
  ```
]

#section-slide([ It's #strike[hammer] Typst time!])

#slide(title: [ What sets Typst apart? ])[
  - A *real* programming language
  ```typ
    #let fib(n) = {
      if n <= 1 {
        1
      } else {
        fib(n - 1) + fib(n - 2)
      }
    }
  ```
][
  #only(2)[
    - With *powerful* markup syntax
  ```typ
    ==== My paragraph
    Hello, world!
    *This text is in bold*.
    _And this one is emphasized_.
    #strike[This one is
      struck through].
  ```
  ]
]

#slide(title: [ What sets Typst apart? ])[
  #line-by-line[
    - A simple *free* web-app for *everything*
      - Collaborative editing
      - Instant preview
      - Cloud storage
    - Or running on your PC using a *single* binary
      - macOS, Linux, or Windows
      - No dependencies
      - Easy to install
      - Easy to update
    - *Incredible* documentation
    - *Packages* at your fingertips
  ]
]

#section-slide([ Let's get started! ])

#slide(title: [ The basics ])[
  #line-by-line[
    - A Typst document is a *markup* with *code*
    - The markup is the default mode or when surrounded in `[` and `]`.
    - The `#` character is used to switch to code mode.
    ```typ
      This is markup
      #this-is-code()
      #[ This is also markup ]
    ```
  ]
]

#slide(title: [ The basics (cont.) ])[
  #line-by-line[
    - Heading levels are defined with `=` characters ```typ
      = Heading 1
      == Heading 2
      === Heading 3
    ```
    - Lists are defined with `-` characters ```typ
      - Item 1
      - Item 2
        - Item 2.1
    ```
  ]
]

#slide(title: [ The basics (cont.) ])[
  #line-by-line[
    - Numbered lists are defined with `+` characters ```typ
      + Item 1
      + Item 2
        + Item 2.1
    ```
    - Strong emphasis is done with `*` and `_` characters ```typ
      *This is strong*
      _This is emphasized_
    ```
  ]
]

#slide(title: [ The basics (cont.) ])[
  #line-by-line[
    - You can create labels using the `<label>` syntax: ```typ
      = Chapter 1 <my-label>
    ```
    - And you can reference them using the `@` syntax: ```typ
      @my-label // This creates a clickable link
    ```
    - It works the same for bibliographies! ```typ
      @my-bib-entry // This creates a clickable link
    ```
  ]
]

#slide(title: [ The basics (cont.) ])[
  #line-by-line[
    - You can insert comments using `//` and `/* */` ```typ
      // This is a comment
      /* This is a block comment */
    ```
    - You can insert code using the `#` character ```typ
      #let x = 1
      #let y = 2
      #let z = x + y
    ```
  ]
]

#slide(title: [ The basics (cont.) ])[
  #line-by-line[
    - You can insert a block of code using the `#` character ```typ
      #{
        let x = 1
        let y = 2
      }
    ```
    - You can declare functions and variables using the `let` keyword ```typ
      #let add(a, b) = a + b
      #let c = add(5, 6)
    ```
  ]
]

#slide(title: [ Bibliographies ])[
  #line-by-line[
    - Please use *Zotero* for managing your bibliographies
    - You can export your bibliography to a `.bib` file
    - Or you can use *Hayagriva*'s `.yaml` files
    - You can then import them in your Typst document ```typ
      #bibliography("my-bibliography.bib", style: "ieee")
    ```
    - You can then cite them using the `@` syntax ```typ
      @my-bib-entry // Will display like [1] and be clickable.
    ```
    - Everything will be formatted automatically!
  ]
]

#slide(title: [ Images and figures ])[
  #line-by-line[
    - You can insert images using the `#image` function ```typ
      #image("my-image.png")
    ```
    - And wrap them in a figure using the `#figure` function ```typ
      #figure(caption: "My caption")[
        #image("my-image.png")
      ] <my-image>
    ```
    - It automatically detects the type of figure (image, table, etc.)
    - You can reference it by giving it a label and referecing it using the `@` syntax.
  ]
]

#slide(title: [ Equations ])[
  - Two types: inline and display
  #line-by-line[
    - Inline equations are surrounded by `$` characters: $x^2 + y^2 = z^2$ ```typ
      $x^2 + y^2 = z^2$
    ```
    - Display equations are surrounded by `$` characters with a space:  $ x^2 + y^2 = z^2 $ ```typ
      $ x^2 + y^2 = z^2 $
    ```
    - You can also give them a label and reference them.
    - Syntax is similar to LaTeX but with a few differences.
  ]
]

#slide(title: [ Outlines & queries ])[
  #line-by-line[
    - Outlines are built from a query
    - Queries allow you to ask questions of your document ```typ
      #locate(loc => {
        query(heading.where(level: 1), loc)
      })
    ```
    - And are made easy to use ```typ
      #outline(target: figure.where(kind: image))
    ```
  ]
]

#slide(title: [ Packages ])[
  #line-by-line[
    - Packages are a way to extend Typst
    - They are written in Typst itself
    - They are easy to import ```typ
      #import "@preview/polylux:0.3.1": *
    ```
    - And easy to use ```typ
      #show: codly-init.with()
      #codly()
    ```
    - Downloaded on demand
  ]
]

#slide(title: [ `show` rules, and `set` commands ])[
  #line-by-line[
    - `show` rules are used to change how an object is displayed ```typ
      #show link: it => text(color: blue, it)
      #link("https://www.google.com/") will be blue.
    ```
    - `set` commands are used to change the state of a function ```typ
      #set text(font: "New Computer Modern")
      This text will be in New Computer Modern.
    ```
    - Rules are applied in order of appearance
    - Rules are scoped to the current block
  ]
]

#slide(title: [ Nifty packages ])[
  - `@preview/polylux` for making slides (like this one)
  - `@preview/codly` for beautiful code blocks
  - `@preview/cetz` for creating diagrams
  - `@preview/tablex` for creating beautiful tables
  - `@preview/glossarium` for creating glossaries
  - `@preview/lemmify` and `@preview/ctheorems` for creating theorems
  - `@preview/jogs` to run JS code
  - `@preview/pyrunner` to run Python code from Typst
  - So many more
]

#section-slide([ Did you say demo? ])

#section-slide([ About your thesis ])

#slide(title: [ Use these tools ])[
  - Zotero for managing your bibliography
  - Typst for writing your thesis
  - #link("https://draw.io") for creating diagrams
  - The Typst Discord server: #link("https://discord.gg/2uDybryKPe")
]

#slide(title: [ Thanks for coming! ])[
  - #link("https://typst.app")
  - #link("https://discord.gg/2uDybryKPe")
  - #link("https://github.com/typst/typst")
  - #link("https://github.com/Dherse/masterproef")
  - #link("https://github.com/Dherse/ugent-templates")
  - Questions?
]

// Final end slide
#end-slide()