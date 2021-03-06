/*
 * Copyright 2017 Matthieu Gallien <matthieu_gallien@yahoo.fr>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

import QtQuick 2.0
import org.mgallien.QmlExtension 1.0
import QtWinExtras 1.0

Item {
    id: rootItem

    property var playListModel
    property var playListControler
    property var audioPlayerManager
    property var player
    property var headerBarManager
    property var manageMediaPlayerControl

    signal raisePlayer()

    Theme {
        id: elisaTheme
    }

    ThumbnailToolBar {
        iconicThumbnailSource: (headerBarManager.image ? headerBarManager.image : Qt.resolvedUrl(elisaTheme.albumCover))

        ThumbnailToolButton {
            iconSource: Qt.resolvedUrl(elisaTheme.skipBackwardIcon)
            onClicked: playListControler.skipPreviousTrack()
            enabled: manageMediaPlayerControl.skipBackwardControlEnabled
        }

        ThumbnailToolButton {
            iconSource: (myPlayControlManager.musicPlaying ? Qt.resolvedUrl(elisaTheme.pauseIcon) : Qt.resolvedUrl(elisaTheme.playIcon))
            onClicked: manageAudioPlayer.playPause()
            enabled: manageMediaPlayerControl.playControlEnabled
        }

        ThumbnailToolButton {
            iconSource: Qt.resolvedUrl(elisaTheme.skipForwardIcon)
            onClicked: playListControler.skipNextTrack()
            enabled: manageMediaPlayerControl.skipForwardControlEnabled
        }
    }
}
