module Pages exposing (..)

import Types exposing (Content, ContentType(..))


index : Content
index =
    { slug = "/"
    , contentType = Page
    , name = "index"
    , title = "Jamie Holliday"
    }
