module Leaflet.Update exposing (..)

import Event.Model exposing (Event)
import Leaflet.Model as Leaflet exposing (initialModel, Marker, Model)

init : Model
init =
  initialModel

type Msg
  = SelectMarker (Maybe Int)
  | SetMarkers (List Event)
  | ToggleMap
  | UnselectMarker


update : Msg -> Model -> Model
update action model =
  case action of
    SelectMarker val ->
      { model | selectedMarker = val }

    SetMarkers events ->
      { model | markers = eventToMarkers events }

    ToggleMap ->
      { model | showMap = (not model.showMap) }

    UnselectMarker ->
      { model | selectedMarker = Nothing }

eventToMarkers : List Event -> List Leaflet.Marker
eventToMarkers events =
  events
    |> List.map (\event -> Leaflet.Marker event.id event.marker.lat event.marker.lng)
