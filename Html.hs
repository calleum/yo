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
    ( makeTag "html"
      ( makeTag "head" (makeTag "title" title)
      <> makeTag "body" (getElemString content)
      )
    )

body_ :: String -> Element
body_ = Element . makeTag "body"

head_ :: String -> Element
head_ = Element . makeTag "head"

title_ :: String -> Element
title_ = Element . makeTag "title"

p_ :: String -> Element
p_ = Element . makeTag "p"

h1_ :: String ->  Element
h1_ = Element . makeTag "h1"

makeTag :: String -> String -> String
makeTag tag content = "<" <> tag  <> ">" <> content <> "</" <> tag <> ">"

render :: Html -> String
render html = 
    case html of
        Html str -> str

getElemString :: Element -> String
getElemString el = 
    case el of
        Element str -> str

append_ :: Element -> Element -> Element
append_ a b = Element (getElemString a <> getElemString b)
