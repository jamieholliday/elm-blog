module App exposing (..)

import Navigation
import Pages
import Posts
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



-- HELPERS
-- getPagesByPathname : String -> Maybe Content
-- getPagesByPathname pathname =
--     Pages.pages
--         |> List.filter (\item -> item.slug == pathname)
--         |> List.head


getContentByPathname : String -> Maybe Content
getContentByPathname pathname =
    List.concat ([ Pages.pages, Posts.posts ])
        |> List.filter (\item -> item.slug == pathname)
        |> List.head



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked slug ->
            ( model, Navigation.newUrl slug )

        UrlChange location ->
            let
                pageContent =
                    getContentByPathname location.pathname
            in
                case pageContent of
                    Nothing ->
                        ( { model | currentContent = Pages.notFound404 }
                        , Cmd.none
                        )

                    Just content ->
                        case content.contentType of
                            Page ->
                                ( { model | currentContent = content }
                                , Cmd.none
                                )

                            Post ->
                                ( { model | currentContent = content }
                                , fetch (content)
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
            ( { model | currentContent = Pages.notFoundContent }
            , Cmd.none
            )



-- Nothing ->
--     ( model, fetch (Pages.notFound404) )
--         Just content ->
--             ( { model | history = location :: model.history }
--             , fetch (content)
--             )
-- NewContent (Ok content) ->
--     let
--         currentContent =
--             model.currentContent
--         newCurrent =
--             { currentContent | markdown = Just content }
--     in
--         ( { model | currentContent = newCurrent }
--         , Cmd.none
--         )
-- NewContent (Err errorMessage) ->
--     ( { model | currentContent = Pages.notFoundContent }
--     , Cmd.none
--     )
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
