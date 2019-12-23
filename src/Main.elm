module Main exposing (main)

import Browser
import Html.Styled
import UserInfoForm


type State
    = UserInfoForm UserInfoForm.State


initialModel : State
initialModel =
    UserInfoForm UserInfoForm.init


type Event
    = UserInfoFormEvent UserInfoForm.Event


update : Event -> State -> State
update event state =
    case ( state, event ) of
        ( UserInfoForm s, UserInfoFormEvent e ) ->
            UserInfoForm <| UserInfoForm.update e s


view : State -> Html.Styled.Html Event
view state =
    case state of
        UserInfoForm s ->
            Html.Styled.map UserInfoFormEvent <| UserInfoForm.view s


main : Program () State Event
main =
    Browser.sandbox
        { init = initialModel
        , view = view >> Html.Styled.toUnstyled
        , update = update
        }
