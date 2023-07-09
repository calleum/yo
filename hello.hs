import Html

main :: IO ()
main = do
  putStrLn (render myhtml)

myhtml :: Html
myhtml =
  html_
    "My page!"
      ((h1_ "Page Head1")
      <>
      (
        (p_ "<p>Hey cletus!</p>")
        <>
        (p_ "Hey zeus!")
    ))
