module Posts exposing (..)

import Types exposing (Content, ContentType(..))


test1 : Content
test1 =
    { slug = "/test1"
    , contentType = Post
    , name = "test1"
    , title = "Test1 title"
    , view = Nothing
    , markdown = Nothing
    }


posts : List Content
posts =
    [ test1
    ]
