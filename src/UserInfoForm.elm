module UserInfoForm exposing (Event, State, init, update, view)

import Html exposing (..)
import Html.Attributes exposing (name, type_, value)
import Html.Events exposing (onInput, onSubmit)


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
            form [ onSubmit Submitted ]
                [ h1 [] [ text "User Info" ]
                , label []
                    [ text "Your name"
                    , input
                        [ type_ "text"
                        , name "user_name"
                        , onInput NameChanged
                        , value user
                        ]
                        []
                    ]
                , button [ type_ "submit" ]
                    [ text "Next" ]
                ]
