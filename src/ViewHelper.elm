module ViewHelper exposing (pageLink)

import Types exposing (Content, Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events
import Json.Decode


navigationOnClick : Msg -> Attribute Msg
navigationOnClick msg =
    -- I'm not 100% sure what this does.
    Html.Events.onWithOptions "click"
        { stopPropagation = False
        , preventDefault = True
        }
        (Json.Decode.succeed msg)


pageLink : String -> Content -> Html Msg
pageLink name { slug } =
    a [ href slug, navigationOnClick (LinkClicked slug) ] [ text name ]
