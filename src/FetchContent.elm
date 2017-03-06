module FetchContent exposing (..)

import Http
import Types exposing (Content, ContentType(..), Msg(..))


fetch : Content -> Cmd Msg
fetch content =
    Http.getString (getUrl content)
        |> Http.send NewContent


getUrl : Content -> String
getUrl content =
    "/content/posts/" ++ content.name ++ ".md"
