module Main exposing (main)

import Browser
import Html.Styled
import PlayerInfoForm


type State
    = PlayerInfoForm PlayerInfoForm.State


initialModel : State
initialModel =
    PlayerInfoForm PlayerInfoForm.init


type Event
    = PlayerInfoFormEvent PlayerInfoForm.Event


update : Event -> State -> State
update event state =
    case ( state, event ) of
        ( PlayerInfoForm s, PlayerInfoFormEvent e ) ->
            PlayerInfoForm <| PlayerInfoForm.update e s


view : State -> Html.Styled.Html Event
view state =
    case state of
        PlayerInfoForm s ->
            Html.Styled.map PlayerInfoFormEvent <| PlayerInfoForm.view s


main : Program () State Event
main =
    Browser.sandbox
        { init = initialModel
        , view = view >> Html.Styled.toUnstyled
        , update = update
        }
