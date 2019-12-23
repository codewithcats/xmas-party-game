module Main exposing (main)

import Browser
import GiftSelection
import Html.Styled
import PlayerInfoForm


type alias Player =
    { name : String
    , broughtGift : String
    }


type State
    = PlayerInfoForm PlayerInfoForm.State
    | GiftSelection String


initialModel : State
initialModel =
    PlayerInfoForm PlayerInfoForm.init


type Event
    = PlayerInfoFormEvent PlayerInfoForm.Event


update : Event -> State -> State
update event state =
    case ( state, event ) of
        ( PlayerInfoForm (PlayerInfoForm.Form playerName), PlayerInfoFormEvent PlayerInfoForm.Submitted ) ->
            GiftSelection playerName

        ( PlayerInfoForm s, PlayerInfoFormEvent e ) ->
            PlayerInfoForm <| PlayerInfoForm.update e s

        ( GiftSelection _, _ ) ->
            state


view : State -> Html.Styled.Html Event
view state =
    case state of
        PlayerInfoForm s ->
            Html.Styled.map PlayerInfoFormEvent <| PlayerInfoForm.view s

        GiftSelection _ ->
            GiftSelection.view


main : Program () State Event
main =
    Browser.sandbox
        { init = initialModel
        , view = view >> Html.Styled.toUnstyled
        , update = update
        }
