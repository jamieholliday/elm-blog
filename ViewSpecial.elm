module ViewSpecial exposing (..)

import Html exposing (..)
import Types exposing (Msg)
import Dict exposing (Dict)


blogView : Html Msg
blogView =
    div []
        [ text "blog view"
        ]


specialCases : Dict String (Html Msg)
specialCases =
    Dict.fromList [ ( "blog", blogView ) ]


getSpecialCase : String -> Maybe (Html Msg)
getSpecialCase name =
    Dict.get name specialCases
