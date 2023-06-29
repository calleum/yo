import Html

main :: IO ()
main = do
  putStrLn (render myhtml)

myhtml :: Html
myhtml =
  html_
    "My page!"
    ( append_
      (h1_ "Page Head1")
      ( append_
        (p_ "Hey cletus!")
        (p_ "Hey zeus!")
      )
    )
