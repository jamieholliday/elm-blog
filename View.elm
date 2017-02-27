module View exposing (render)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (Model, Msg)
import Markdown


contentView : Maybe String -> Html Msg
contentView content =
    case content of
        Just content ->
            Markdown.toHtml [ class "markdown-content" ] content

        Nothing ->
            div [ class "loader" ] [ text "Loading" ]


render : Model -> Html Msg
render model =
    div [ class "main-container" ]
        [ contentView model.currentContent.markdown ]
