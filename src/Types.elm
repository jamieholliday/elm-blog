module Types exposing (..)

import Http
import Navigation


type Msg
    = UrlChange Navigation.Location
    | NewContent (Result Http.Error String)


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
    , markdown : Maybe String
    }
