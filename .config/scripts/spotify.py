#!/bin/python

import dbus

try:
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object(
        "org.mpris.MediaPlayer2.spotify", "/org/mpris/MediaPlayer2"
    )

    spotify_interface = dbus.Interface(spotify_bus, "org.freedesktop.DBus.Properties")

    properties = spotify_interface.Get("org.mpris.MediaPlayer2.Player", "Metadata")

    artist_name = properties["xesam:artist"][0]
    song_name = properties["xesam:title"]

    if len(song_name) > 24:
        song_name = song_name[0:24]
        song_name += "..."

    print("{}: {}".format(artist, song).encode("UTF-8"))

except Exception as e:
    if isinstance(e, dbus.exceptions.DBusException):
        print("")
    else:
        print(e)
