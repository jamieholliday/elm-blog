module View exposing (render)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events
import Types exposing (Model, Msg(..), Content)
import Markdown
import Pages
import Json.Decode


navigationOnClick : Msg -> Attribute Msg
navigationOnClick msg =
    Html.Events.onWithOptions "click"
        { stopPropagation = False
        , preventDefault = True
        }
        (Json.Decode.succeed msg)


navigationLink : String -> Content -> Html Msg
navigationLink name { slug } =
    a [ href slug, navigationOnClick (LinkClicked slug) ] [ text name ]


navigation : Model -> Html Msg
navigation model =
    nav []
        [ li [] [ navigationLink "Home" Pages.home ]
        , li [] [ navigationLink "About" Pages.about ]
        ]


content : Maybe String -> Html Msg
content content =
    case content of
        Just content ->
            Markdown.toHtml [ class "markdown-content" ] content

        Nothing ->
            div [ class "loader" ] [ text "Loading" ]


body : Model -> Html Msg
body model =
    div [ class "content" ]
        [ content model.currentContent.markdown ]


render : Model -> Html Msg
render model =
    div [ class "main-container" ]
        [ navigation model
        , body model
        ]
