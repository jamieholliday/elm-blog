module View exposing (render)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (Model, Msg(..), Content, ContentType(..))
import Pages
import ViewHelper exposing (pageLink)
import Markdown


navigation : Model -> Html Msg
navigation model =
    nav []
        [ li [] [ pageLink "Home" Pages.home ]
        , li [] [ pageLink "About" Pages.about ]
        , li [] [ pageLink "Blog" Pages.blog ]
        ]


staticContent : Maybe (Html Msg) -> Html Msg
staticContent html =
    case html of
        Just page ->
            div [] [ page ]

        Nothing ->
            div [] []


markdownContent : Maybe String -> Html Msg
markdownContent markdown =
    case markdown of
        Just content ->
            Markdown.toHtml [ class "markdown-content" ] content

        Nothing ->
            div [ class "loader" ] [ text "Loading" ]


content : Content -> Html Msg
content currentContent =
    case currentContent.contentType of
        Page ->
            staticContent currentContent.view

        Post ->
            markdownContent currentContent.markdown


body : Model -> Html Msg
body model =
    div [ class "content" ]
        [ content model.currentContent ]


render : Model -> Html Msg
render model =
    div [ class "main-container" ]
        [ navigation model
        , body model
        ]
