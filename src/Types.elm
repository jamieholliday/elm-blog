module Types exposing (..)

import Http
import Navigation
import Html exposing (Html)


type Msg
    = UrlChange Navigation.Location
    | NewContent (Result Http.Error String)
    | LinkClicked String


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
    , view : Maybe (Html Msg)
    , markdown : Maybe String
    }
