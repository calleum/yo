import Markup
import Data.Maybe

parse :: String -> Document
parse = parseLines_ [] . lines 

parseLines_ :: [String] -> [String] -> Document
parseLines_ currentParagraph txts = 
    let 
        paragraph = Paragraph (unlines (reverse currentParagraph))
    in
        case txts of
            [] -> [paragraph]
            currentLine : rest ->
                if trim currentLine == ""
                    then
                        paragraph : parseLines_ [] rest
                    else
                        parseLines_ (currentLine : currentParagraph) rest

parseLines :: Maybe Element -> [String] -> Document
parseLines context txts = 
    case txts of
        [] -> maybeToList context
        currentLine : rest -> 
            let 
                line = trim currentLine
            in
                if line == ""
                    then
                        maybe id (:) context (parseLines Nothing rest)
                    else
                        case context of 
                            Just (Paragraph paragraph) -> 
                                parseLines (Just (Paragraph (unwords [paragraph, line]))) rest
                            _ -> 
                                maybe id (:) context (parseLines (Just (Paragraph line)) rest)

trim :: String -> String
trim = unwords . words

