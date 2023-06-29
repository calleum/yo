main = do
  putStrLn (makeHtml "My page!" "Hello, cletus!")

makeHtml :: String -> (String -> String)
makeHtml title content = html_ ((head_ (title_ title)) <> (body_ content))


makeTag tag content = "<" <> tag  <> ">" <> content <> "</" <> tag <> ">"
html_ = makeTag "html"
body_ = makeTag "body"
head_ = makeTag "head"
title_ = makeTag "title"

