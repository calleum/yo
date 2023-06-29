module Markup
  ( Document
  , Element(..)
  )
where

import Numeric.Natural

type Document
  = [Element]

data Element
  = Heading Natural String
  | Paragraph String
  | UnorderedList [String]
  | OrderedList [String]
  | CodeBlock [String]
