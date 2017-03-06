module Pages exposing (..)

import Types exposing (Content, ContentType(..))
import PageViews exposing (homeView, aboutView, blogView, notFound404View, notFound404ContentView)


home : Content
home =
    { slug = "/"
    , contentType = Page
    , name = "home"
    , title = "Jamie Holliday"
    , view = Just homeView
    , markdown = Nothing
    }


about : Content
about =
    { slug = "/about"
    , contentType = Page
    , name = "about"
    , title = "About Me"
    , view = Just aboutView
    , markdown = Nothing
    }


blog : Content
blog =
    { slug = "/blog"
    , contentType = Page
    , name = "blog"
    , title = "Blog"
    , view = Just blogView
    , markdown = Nothing
    }


notFound404 : Content
notFound404 =
    { slug = "/404"
    , contentType = Page
    , name = "404"
    , title = "Not Found"
    , view = Just notFound404View
    , markdown = Nothing
    }


notFoundContent : Content
notFoundContent =
    { slug = "/404"
    , contentType = Page
    , name = "404"
    , title = "Not Found"
    , view = Just notFound404ContentView
    , markdown = Nothing
    }


pages : List Content
pages =
    [ home
    , about
    , notFound404
    , blog
    ]
