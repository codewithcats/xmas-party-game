module PlayerInfoForm exposing (Event, State, init, update, view)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (class, css, name, type_, value)
import Html.Styled.Events exposing (onInput, onSubmit)


type State
    = Form String


type Event
    = NameChanged String
    | Submitted


init : State
init =
    Form ""


update : Event -> State -> State
update event state =
    case ( state, event ) of
        ( Form _, NameChanged name ) ->
            Form name

        ( Form _, Submitted ) ->
            state


view : State -> Html Event
view state =
    case state of
        Form user ->
            form
                [ onSubmit Submitted
                , class "flex flex-col bg-gray-200 p-4"
                , css
                    [ width (px 480)
                    ]
                ]
                [ h1 [ class "text-lg font-bold mb-4" ]
                    [ text "Who are you?" ]
                , label [ class "flex mb-2 items-baseline" ]
                    [ text "Your name"
                    , input
                        [ type_ "text"
                        , name "user_name"
                        , onInput NameChanged
                        , value user
                        , class "border flex-1 ml-4 rounded-sm py-1 px-2"
                        ]
                        []
                    ]
                , div [ class "text-right" ]
                    [ button
                        [ type_ "submit"
                        , class "bg-blue-400 text-white rounded-sm py-1 w-16"
                        ]
                        [ text "Next" ]
                    ]
                ]
