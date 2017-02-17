module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Navigation
import Pages
import Types exposing (Model)


-- MODEL


model : Navigation.Location -> ( Model, Cmd Msg )
model location =
    ( { history = [ location ]
      , currentContent = Pages.index
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = UrlChange Navigation.Location


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            ( { model | history = location :: model.history }
            , Cmd.none
            )



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "main-container" ]
        [ text "test" ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- APP


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = model
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
