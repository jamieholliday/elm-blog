module App exposing (..)

import Navigation
import Pages
import Types exposing (Model, Msg(..), Content, ContentType(..))
import View
import FetchContent exposing (fetch)


-- MODEL


initialModel : Navigation.Location -> Model
initialModel location =
    { history = [ location ]
    , currentContent = Pages.home
    }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    (update (UrlChange location) (initialModel location))



-- init location =
--     ( { history = [ location ]
--       , currentContent = Pages.home
--       }
--     , fetch Pages.home
--     )
-- HELPERS


getPagesByPathname : String -> Content
getPagesByPathname pathname =
    let
        page =
            Pages.pages
                |> List.filter (\item -> item.slug == pathname)
                |> List.head
    in
        case page of
            Just pageContent ->
                pageContent

            -- this should be a 404 page instead of home
            Nothing ->
                Pages.home



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            ( { model | history = location :: model.history }
            , fetch (getPagesByPathname location.pathname)
            )

        NewContent (Ok content) ->
            let
                currentContent =
                    model.currentContent

                newCurrent =
                    { currentContent | markdown = Just content }
            in
                ( { model | currentContent = newCurrent }
                , Cmd.none
                )

        NewContent (Err errorMessage) ->
            let
                currentContent =
                    model.currentContent

                newCurrent =
                    { currentContent | markdown = Just (toString errorMessage) }
            in
                ( { model | currentContent = newCurrent }
                , Cmd.none
                )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- APP


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = View.render
        , update = update
        , subscriptions = subscriptions
        }
