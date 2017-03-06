module PageViews exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (Msg(..), Content)
import Posts exposing (posts)
import ViewHelper exposing (pageLink)


homeView : Html Msg
homeView =
    div [ class "home" ]
        [ h1 [] [ text "This is the static homepage heading" ]
        , p [] [ text "This is the static homepage content" ]
        ]


aboutView : Html Msg
aboutView =
    div [ class "about" ]
        [ h1 [] [ text "This is the staticabout heading" ]
        , p [] [ text "This is the static about content" ]
        ]


blogView : Html Msg
blogView =
    div [ class "blog" ]
        [ h1 [] [ text "This is the static blog heading" ]
        , p [] [ text "This is the static blog content" ]
        , ul [] blogPostsView
        ]


blogPostsView : List (Html Msg)
blogPostsView =
    List.map singleBlogPostView posts


singleBlogPostView : Content -> Html Msg
singleBlogPostView post =
    li [] [ pageLink post.title post ]


notFound404View : Html Msg
notFound404View =
    div [ class "404" ]
        [ h1 [] [ text "This is the static not found 404 heading" ]
        , p [] [ text "This is the static not found 404 content" ]
        ]


notFound404ContentView : Html Msg
notFound404ContentView =
    div [ class "404" ]
        [ h1 [] [ text "static Not found content heading" ]
        , p [] [ text "static Not found content content" ]
        ]
