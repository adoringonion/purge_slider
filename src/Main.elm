module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (..)
import Html.Attributes as H exposing (..)
import Html.Events exposing (on, onInput)


type alias Model =
    Int


type Msg
    = Update String


init : Model
init =
    100


update : Msg -> Model -> Model
update (Update v) model =
    case String.toInt v of
        Just i ->
            i

        Nothing ->
            model


view model =
    let
        nikolaiOpacity =
            toFloat (model) / 100
        
        nikolaiOpacityStyle = 
            style "opacity" <| String.fromFloat nikolaiOpacity
    in
    div []
        [ div
            [ class "img1" ]
            [ img [ src "src/Ni_background.png" ]
                []
            , div
                [ class "img2",  nikolaiOpacityStyle ]
                [ img [ src "src/Ni.png" ]
                    []
                ]
            ]
        , div
            [ class "slider" ]
            [ input
                [ type_ "range"
                , H.min "0"
                , H.max "100"
                , value <| String.fromInt model
                , onInput Update
                ]
                []
            ]
        ]


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }
