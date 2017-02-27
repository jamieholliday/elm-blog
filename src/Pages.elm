module Pages exposing (..)

import Types exposing (Content, ContentType(..))


home : Content
home =
    { slug = "/"
    , contentType = Page
    , name = "home"
    , title = "Jamie Holliday"
    , markdown = Nothing
    }


about =
    { slug = "/about"
    , contentType = Page
    , name = "about"
    , title = "About Me"
    , markdown = Nothing
    }


pages : List Content
pages =
    [ home
    , about
    ]
