module Types exposing (..)

import Navigation


type alias Model =
    { history : List Navigation.Location
    , currentContent : Content
    }


type ContentType
    = Page
    | Post


type alias Content =
    { slug : String
    , contentType : ContentType
    , name : String
    , title : String
    }
