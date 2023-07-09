module Html.Internal where

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

code_ :: String -> Element
code_ = Element . el "pre" . escape

p_ :: String -> Element
p_ = Element . el "p" . escape

h1_ :: String ->  Element
h1_ = Element . el "h1" . escape

ol_ :: [Element] -> Element
ol_ = Element . el "ol" . concat . map (el "li" . getElemString)

ul_ :: [Element] -> Element
ul_ = Element . el "ul" . concat . map (el "li" . getElemString)

instance Semigroup Element where
    (<>) a b = Element (getElemString a <> getElemString b)

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

