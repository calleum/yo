module Html
  ( Html
  , Title
  , Element
  , html_
  , p_
  , h1_
  , append_
  , render
  )
  where

newtype Html = Html String
newtype Element = Element String
type Title = String

html_ :: Title -> Element -> Html
html_ title content = Html
    ( el "html"
      ( el "head" (el "title" (escape title))
      <> el "body" (getElemString content)
      )
    )

body_ :: String -> Element
body_ = Element . el "body"

head_ :: String -> Element
head_ = Element . el "head"

p_ :: String -> Element
p_ = Element . el "p" . escape

h1_ :: String ->  Element
h1_ = Element . el "h1" . escape

append_ :: Element -> Element -> Element
append_ a b = Element (getElemString a <> getElemString b)

el :: String -> String -> String
el tag content = "<" <> tag  <> ">" <> content <> "</" <> tag <> ">"

render :: Html -> String
render html = 
    case html of
        Html str -> str

getElemString :: Element -> String
getElemString el = 
    case el of
        Element str -> str

escape :: String -> String
escape = 
    let
        escapeChar c = 
            case c of
                '<' -> "&lt;"
                '>' -> "&gt;"
                '&' -> "&amp;"
                '"' -> "&quot;"
                '\'' -> "&#39;"
                _ -> [c]
    in
        concat . map escapeChar
