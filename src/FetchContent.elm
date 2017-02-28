module FetchContent exposing (..)

import Http
import Types exposing (Content, ContentType(..), Msg(..))


fetch : Content -> Cmd Msg
fetch content =
    Http.getString (getUrl content)
        |> Http.send NewContent


getUrl : Content -> String
getUrl content =
    let
        loc =
            directoryForContentType content.contentType
    in
        "/content/" ++ loc ++ "/" ++ content.name ++ ".md"


directoryForContentType : ContentType -> String
directoryForContentType contentType =
    case contentType of
        Page ->
            "pages"

        Post ->
            "posts"
