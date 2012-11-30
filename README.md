# Newpage
Put

    [newpage]

alone at the beginning of the line.

Latex representation

    <!-- \newpage -->

# Sequencediagram
In order to use this script please visit http://www.texample.net/tikz/examples/pgf-umlsd/ and include their .sty file within your latex header.

## Use Sequencediagramm
Put

    [sequencediagram]

at the beginning and the end of your sequencediagram, alone at the beginning of the line.

Example

    [sequencediagram]

    [sequencediagram]

Latex representation

    <!--
    \ begin{ sequencediagram }
    \ end { sequencediagram }
    -->

## Creating Instance (At the Beginning of the Line!)
    **:Name[Abkürzung]**

or

    **:name[acronym][gap]**

Latex representation:

    \ newinst [gap]{ acronym }{ :name }
    
## Creating Thread (At the Beginning of the Line!)

    **Name[Abkürzung][Farbe]**

or

    **Name[Abkürzung]**

Latex representation:

    \ newthread [ blue ]{ b }{: Blue }

## Function Calls
In order to use this script please visit http://www.texample.net/tikz/examples/pgf-umlsd/ and include their .sty file within your latex header.

## Use Sequencediagramm
Put

    [sequencediagram]

at the beginning and the end of your sequencediagram, alone at the beginning of the line.

Example

    [sequencediagram]

    [sequencediagram]

Latex representation

    <!--
    \ begin{ sequencediagram }
    \ end { sequencediagram }
    -->

## Creating Instance (At the Beginning of the Line!)
    **:Name[Abkürzung]**

or

    **:name[acronym][gap]**

Latex representation:

    \ newinst [gap]{ acronym }{ :name }
    
## Creating Thread (At the Beginning of the Line!)

    **Name[Abkürzung][Farbe]**

or

    **Name[Abkürzung]**

Latex representation:

    \ newthread [ blue ]{ b }{: Blue }

## Function Calls
The following function calls can be nested. The **indentation** is important! In this version **every space counts**!

In the following example, " " indicates spaces.

**Example A**

    FunctionCall1
    FunctionCall2
    FunctionCall3

This two function call are consecutively.

**Example B**

    FunctionCall1
    " "FunctionCall2
    FunctionCall3

Here, FunctionCall2 happens between the Start of FunctionCall1 and FunctionCall3


### Funktion call
    
    Prozess1->Prozess2: Method(): return Value

Latex representation:

    \ begin { call }{ Prozess1 }{ Method() }{ Prozess2 }{ return value }
    \ end { call }
    
### Message

    Prozess1->>Prozess2: Method()

Latex representation:

    \ begin { messcall }{ Prozess1 }{ Method() }{ Prozess2 }
    \ end { messcall }
    

### Self call
    
    ->Prozess: Method(): return Value

Latex representation:

    \ begin { callself }{ Prozess }{ Method() }{ return value }
    \ end { callself }
    
### Block

    loop type description

Latex representation:

    \ begin { sdblock }{ type }{ description }
    \ end { sdblock }** is important! In this version **every space counts**!

In the following example, exchange - with a 

**Example A**

    FunctionCall1
    FunctionCall2
    FunctionCall3

This two function call are consecutively.

**Example B**

    FunctionCall1
    -FunctionCall2
    FunctionCall3

Here, FunctionCall2 happens between the Start of FunctionCall1 and FunctionCall3


### Funktion call
    
    Prozess1->Prozess2: Method(): return Value

Latex representation:

    \ begin { call }{ Prozess1 }{ Method() }{ Prozess2 }{ return value }
    \ end { call }
    
### Message

    Prozess1->>Prozess2: Method()

Latex representation:

    \ begin { messcall }{ Prozess1 }{ Method() }{ Prozess2 }
    \ end { messcall }
    

### Self call
    
    ->Prozess: Method(): return Value

Latex representation:

    \ begin { callself }{ Prozess }{ Method() }{ return value }
    \ end { callself }
    
### Block

    loop type description

Latex representation:

    \ begin { sdblock }{ type }{ description }
    \ end { sdblock }