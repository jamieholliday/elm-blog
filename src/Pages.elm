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


about : Content
about =
    { slug = "/about"
    , contentType = Page
    , name = "about"
    , title = "About Me"
    , markdown = Nothing
    }


notFound404 : Content
notFound404 =
    { slug = "/404"
    , contentType = Page
    , name = "404"
    , title = "Not Found"
    , markdown = Nothing
    }


notFoundContent : Content
notFoundContent =
    { slug = "/404"
    , contentType = Page
    , name = "404"
    , title = "Not Found"
    , markdown = Just "# couldn't load content"
    }


pages : List Content
pages =
    [ home
    , about
    , notFound404
    ]
