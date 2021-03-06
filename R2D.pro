>#*****************************************************************************
# Copyright (c) 2016-2021, The Regents of the University of California (Regents).
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# The views and conclusions contained in the software and documentation are those
# of the authors and should not be interpreted as representing official policies,
# either expressed or implied, of the FreeBSD Project.
#
# REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
# THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED HEREUNDER IS
# PROVIDED "AS IS". REGENTS HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT,
# UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
#
#***************************************************************************

# Written by: Stevan Gavrilovic, Frank McKenna

QT += core gui charts concurrent network sql qml webenginewidgets webengine webchannel 3dcore 3drender 3dextras charts xml

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

# Information about the app
TARGET = R2D
TEMPLATE = app
VERSION=1.0.0
DEFINES += APP_VERSION=\\\"$$VERSION\\\"

# C++17 support
CONFIG += c++17

# Check for the required Qt version
equals(QT_MAJOR_VERSION, 5) {
    lessThan(QT_MINOR_VERSION, 15) {
        error("$$TARGET requires Qt 5.15.0")
    }
        equals(QT_MINOR_VERSION, 15) : lessThan(QT_PATCH_VERSION, 0) {
                error("$$TARGET requires Qt 5.15.0")
        }
}


DEFINES += INCLUDE_USER_PASS

win32:DEFINES +=  CURL_STATICLIB

#win32::include($$PWD/R2D.user.pri)
#win32::include($$PWD/R2D.user.pri)
win32::include($$PWD/ConanHelper.pri)

win32::LIBS+=Advapi32.lib

# Full optimization on release
QMAKE_CXXFLAGS_RELEASE += -O3

# Specify the path to the Simcenter common directory
PATH_TO_COMMON=../SimCenterCommon

# Application Icons
win32 {
    RC_ICONS = icons/NHERI-R2D-Icon.ico
} else {
    mac {
    ICON = icons/NHERI-R2D-Icon.icns
    }
}

# GIS library
ARCGIS_RUNTIME_VERSION = 100.9
#include($$PWD/arcgisruntime.pri)
include(./arcgisruntime.pri)

# Simcenter dependencies
include($$PATH_TO_COMMON/Common/Common.pri)
include($$PATH_TO_COMMON/RandomVariables/RandomVariables.pri)
include(R2DCommon.pri)


# R2D files
INCLUDEPATH += $$PWD/Utils \
               $$PWD/styles \
               $$PWD/UIWidgets \
               $$PWD/ModelViewItems \
               $$PWD/GraphicElements \
               $$PWD/Events/UI \
               $$PWD/Tools \


SOURCES +=  Events/UI/EarthquakeRuptureForecast.cpp \
            Events/UI/EarthquakeRuptureForecastWidget.cpp \
            Events/UI/GMPE.cpp \
            Events/UI/GMPEWidget.cpp \
            Events/UI/GMWidget.cpp \
            Events/UI/GmAppConfig.cpp \
            Events/UI/GmAppConfigWidget.cpp \
            Events/UI/GmCommon.cpp \
            Events/UI/GridDivision.cpp \
            Events/UI/HBoxFormLayout.cpp \
            Events/UI/IntensityMeasure.cpp \
            Events/UI/IntensityMeasureWidget.cpp \
            Events/UI/Location.cpp \
            Events/UI/OpenQuakeScenario.cpp \
            Events/UI/OpenQuakeScenarioWidget.cpp \
            Events/UI/PeerLoginDialog.cpp \
            Events/UI/PeerNGAWest2Client.cpp \
            Events/UI/PointSourceRupture.cpp \
            Events/UI/PointSourceRuptureWidget.cpp \
            Events/UI/RecordSelectionConfig.cpp \
            Events/UI/RecordSelectionWidget.cpp \
            Events/UI/RuptureLocation.cpp \
            Events/UI/RuptureWidget.cpp \
            Events/UI/Site.cpp \
            Events/UI/SiteConfig.cpp \
            Events/UI/SiteConfigWidget.cpp \
            Events/UI/SiteGrid.cpp \
            Events/UI/SiteGridWidget.cpp \
            Events/UI/SiteScatter.cpp \
            Events/UI/SiteScatterWidget.cpp \
            Events/UI/SiteWidget.cpp \
            Events/UI/SpatialCorrelationWidget.cpp \
            Events/UI/Vs30.cpp \
            Events/UI/Vs30Widget.cpp \
            GraphicElements/ConvexHull.cpp \
            GraphicElements/PolygonBoundary.cpp \
            ModelViewItems/CheckableTreeModel.cpp \
            ModelViewItems/GISLegendView.cpp \
            ModelViewItems/SimCenterTreeView.cpp \
            Tools/AssetInputDelegate.cpp \
            Tools/ComponentDatabase.cpp \
            Tools/CSVReaderWriter.cpp \
            Tools/ExampleDownloader.cpp \
            Tools/HurricanePreprocessor.cpp \
            Tools/NGAW2Converter.cpp \
            Tools/NetworkDownloadManager.cpp \
            Tools/PelicunPostProcessor.cpp \
            Tools/REmpiricalProbabilityDistribution.cpp \
            Tools/TablePrinter.cpp \
            Tools/XMLAdaptor.cpp \
            Tools/ShakeMapClient.cpp \
            UIWidgets/AnalysisWidget.cpp \
            UIWidgets/AssetsModelWidget.cpp \
            UIWidgets/AssetsWidget.cpp \
            UIWidgets/BuildingDMEQWidget.cpp \
            UIWidgets/BuildingDMWidget.cpp \
            UIWidgets/BuildingEDPEQWidget.cpp \
            UIWidgets/BuildingEDPWidget.cpp \
            UIWidgets/BuildingInputWidget.cpp \
            UIWidgets/ColorDialogDelegate.cpp \
            UIWidgets/LayerComboBoxItemDelegate.cpp \
            UIWidgets/RendererComboBoxItemDelegate.cpp \
            UIWidgets/GasPipelineInputWidget.cpp \
            UIWidgets/BuildingModelGeneratorWidget.cpp \
            UIWidgets/BuildingModelingWidget.cpp \
            UIWidgets/BuildingSimulationWidget.cpp \
            UIWidgets/CSVtoBIMModelingWidget.cpp \
            UIWidgets/ComponentInputWidget.cpp \
            UIWidgets/DLWidget.cpp \
            UIWidgets/DamageMeasureWidget.cpp \
            UIWidgets/DecisionVariableWidget.cpp \
            UIWidgets/EarthquakeInputWidget.cpp \
            UIWidgets/EngDemandParameterWidget.cpp \
            UIWidgets/GeneralInformationWidget.cpp \
            UIWidgets/GroundMotionStation.cpp \
            UIWidgets/LayerManagerDialog.cpp \
            UIWidgets/RendererModel.cpp \
            UIWidgets/LoadResultsDialog.cpp \
            UIWidgets/RendererTableView.cpp \
            UIWidgets/LayerManagerTableView.cpp \
            UIWidgets/LayerManagerModel.cpp \
            UIWidgets/WindFieldStation.cpp \
            UIWidgets/GroundMotionTimeHistory.cpp \
            UIWidgets/HazardToAssetBuilding.cpp \
            UIWidgets/HazardToAssetWidget.cpp \
            UIWidgets/HazardsWidget.cpp \
            UIWidgets/HurricaneParameterWidget.cpp \
            UIWidgets/InputWidgetOpenSeesPyAnalysis.cpp \
            UIWidgets/MDOF_LU.cpp \
            UIWidgets/MapViewSubWidget.cpp \
            UIWidgets/ModelWidget.cpp \
            UIWidgets/MultiComponentR2D.cpp \
            UIWidgets/NearestNeighbourMapping.cpp \
            UIWidgets/NoneWidget.cpp \
            UIWidgets/OpenSeesPyBuildingModel.cpp \
            UIWidgets/PelicunDLWidget.cpp \
            UIWidgets/PopUpWidget.cpp \
            UIWidgets/EmbeddedMapViewWidget.cpp \
            UIWidgets/ResultsWidget.cpp \
            UIWidgets/SecondaryComponentSelection.cpp \
            UIWidgets/ShakeMapWidget.cpp \
            UIWidgets/SimCenterEventRegional.cpp \
            UIWidgets/SimCenterMapGraphicsView.cpp \
            UIWidgets/StructuralModelingWidget.cpp \
            UIWidgets/UQWidget.cpp \
            UIWidgets/UserDefinedEDPR.cpp \
            UIWidgets/UserInputGMWidget.cpp \
            UIWidgets/HurricaneSelectionWidget.cpp \
            UIWidgets/UserInputHurricaneWidget.cpp \
            UIWidgets/VisualizationWidget.cpp \
            ModelViewItems/LayerTreeItem.cpp \
            ModelViewItems/TreeItem.cpp \
            ModelViewItems/ListTreeModel.cpp \
            ModelViewItems/LayerTreeModel.cpp \
            ModelViewItems/LayerTreeView.cpp \
            ModelViewItems/TreeViewStyle.cpp \
            ModelViewItems/CustomListWidget.cpp \
            GraphicElements/NodeHandle.cpp \
            GraphicElements/RectangleGrid.cpp \
            GraphicElements/GridNode.cpp \
            RunWidget.cpp \
            WorkflowAppR2D.cpp \
            main.cpp \


HEADERS +=  Events/UI/EarthquakeRuptureForecast.h \
            Events/UI/EarthquakeRuptureForecastWidget.h \
            Events/UI/GMPE.h \
            Events/UI/GMPEWidget.h \
            Events/UI/GMWidget.h \
            Events/UI/GmAppConfig.h \
            Events/UI/GmAppConfigWidget.h \
            Events/UI/GmCommon.h \
            Events/UI/GridDivision.h \
            Events/UI/HBoxFormLayout.h \
            Events/UI/IntensityMeasure.h \
            Events/UI/IntensityMeasureWidget.h \
            Events/UI/JsonSerializable.h \
            Events/UI/Location.h \
            Events/UI/OpenQuakeScenario.h \
            Events/UI/OpenQuakeScenarioWidget.h \
            Events/UI/PeerLoginDialog.h \
            Events/UI/PeerNGAWest2Client.h \
            Events/UI/PointSourceRupture.h \
            Events/UI/PointSourceRuptureWidget.h \
            Events/UI/RecordSelectionConfig.h \
            Events/UI/RecordSelectionWidget.h \
            Events/UI/RuptureLocation.h \
            Events/UI/RuptureWidget.h \
            Events/UI/Site.h \
            Events/UI/SiteConfig.h \
            Events/UI/SiteConfigWidget.h \
            Events/UI/SiteGrid.h \
            Events/UI/SiteGridWidget.h \
            Events/UI/SiteScatter.h \
            Events/UI/SiteScatterWidget.h \
            Events/UI/SiteWidget.h \
            Events/UI/SpatialCorrelationWidget.h \
            Events/UI/Vs30.h \
            Events/UI/Vs30Widget.h \
            Events/UI/SpatialCorrelationWidget.h \
            GraphicElements/ConvexHull.h \
            GraphicElements/PolygonBoundary.h \
            ModelViewItems/CheckableTreeModel.h \
            ModelViewItems/GISLegendView.h \
            ModelViewItems/SimCenterTreeView.h \
            Tools/AssetInputDelegate.h \
            Tools/ComponentDatabase.h \
            Tools/CSVReaderWriter.h \
            Tools/ExampleDownloader.h \
            Tools/HurricanePreprocessor.h \
            Tools/NGAW2Converter.h \
            Tools/NetworkDownloadManager.h \
            Tools/PelicunPostProcessor.h \
            Tools/REmpiricalProbabilityDistribution.h \
            Tools/TableNumberItem.h \
            Tools/TablePrinter.h \
            Tools/XMLAdaptor.h \
            Tools/shakeMapClient.h \
            UIWidgets/AnalysisWidget.h \
            UIWidgets/AssetsModelWidget.h \
            UIWidgets/AssetsWidget.h \
            UIWidgets/BuildingDMEQWidget.h \
            UIWidgets/BuildingDMWidget.h \
            UIWidgets/BuildingEDPEQWidget.h \
            UIWidgets/BuildingEDPWidget.h \
            UIWidgets/BuildingInputWidget.h \
            UIWidgets/ColorDialogDelegate.h \
            UIWidgets/LayerComboBoxItemDelegate.h \
            UIWidgets/RendererComboBoxItemDelegate.h \
            UIWidgets/GISObjectTypeMapping.h \
            UIWidgets/GasPipelineInputWidget.h \
            UIWidgets/BuildingModelGeneratorWidget.h \
            UIWidgets/BuildingModelingWidget.h \
            UIWidgets/BuildingSimulationWidget.h \
            UIWidgets/CSVtoBIMModelingWidget.h \
            UIWidgets/ComponentInputWidget.h \
            UIWidgets/DLWidget.h \
            UIWidgets/DamageMeasureWidget.h \
            UIWidgets/DecisionVariableWidget.h \
            UIWidgets/EarthquakeInputWidget.h \
            UIWidgets/EngDemandParameterWidget.h \
            UIWidgets/GeneralInformationWidget.h \
            UIWidgets/GroundMotionStation.h \
            UIWidgets/LayerManagerDialog.h \
            UIWidgets/RendererModel.h \
            UIWidgets/LoadResultsDialog.h \
            UIWidgets/RendererTableView.h \
            UIWidgets/LayerManagerTableView.h \
            UIWidgets/LayerManagerModel.h \
            UIWidgets/WindFieldStation.h \
            UIWidgets/GroundMotionTimeHistory.h \
            UIWidgets/HazardToAssetBuilding.h \
            UIWidgets/HazardToAssetWidget.h \
            UIWidgets/HazardsWidget.h \
            UIWidgets/HurricaneParameterWidget.h \
            UIWidgets/InputWidgetOpenSeesPyAnalysis.h \
            UIWidgets/MDOF_LU.h \
            UIWidgets/MapViewSubWidget.h \
            UIWidgets/ModelWidget.h \
            UIWidgets/MultiComponentR2D.h \
            UIWidgets/NearestNeighbourMapping.h \
            UIWidgets/NoneWidget.h \
            UIWidgets/OpenSeesPyBuildingModel.h \
            UIWidgets/PelicunDLWidget.h \
            UIWidgets/PopUpWidget.h \
            UIWidgets/EmbeddedMapViewWidget.h \
            UIWidgets/ResultsWidget.h \
            UIWidgets/SecondaryComponentSelection.h \
            UIWidgets/ShakeMapWidget.h \
            UIWidgets/SimCenterEventRegional.h \
            UIWidgets/SimCenterMapGraphicsView.h \
            UIWidgets/StructuralModelingWidget.h \
            UIWidgets/UQWidget.h \
            UIWidgets/UserDefinedEDPR.h \
            UIWidgets/UserInputGMWidget.h \
            UIWidgets/HurricaneSelectionWidget.h \
            UIWidgets/UserInputHurricaneWidget.h \
            UIWidgets/VisualizationWidget.h \
            ModelViewItems/LayerTreeItem.h \
            ModelViewItems/TreeItem.h \
            ModelViewItems/ListTreeModel.h \
            ModelViewItems/LayerTreeModel.h \
            ModelViewItems/LayerTreeView.h \
            ModelViewItems/TreeViewStyle.h \
            ModelViewItems/CustomListWidget.h \
            GraphicElements/GridNode.h \
            GraphicElements/NodeHandle.h \
            GraphicElements/RectangleGrid.h \
            WorkflowAppR2D.h \
            RunWidget.h \


contains(DEFINES, INCLUDE_USER_PASS) {

HEADERS += R2DUserPass.h \

} else {

HEADERS += SampleUserPass.h \

}


RESOURCES += \
    images.qrc \
    $$PWD/styles.qrc


DISTFILES += \
    resources/docs/textAboutR2DT.html

# External libraries
macos:LIBS += -lcurl -llapack -lblas
linux:LIBS += /usr/lib/x86_64-linux-gnu/libcurl.so

# Path to build directory
win32 {
DESTDIR = $$shell_path($$OUT_PWD)
Release:DESTDIR = $$DESTDIR/release
Debug:DESTDIR = $$DESTDIR/debug

PATH_TO_EXAMPLES=$$DESTDIR/Examples
PATH_TO_DATABASES=$$DESTDIR/Databases

} else {
    mac {
    PATH_TO_EXAMPLES=$$OUT_PWD/R2D.app/Contents/MacOS
    PATH_TO_DATABASES=$$OUT_PWD/R2D.app/Contents/MacOS

    mkpath($$OUT_PWD/R2D.app/Contents/MacOS)
    }
}

win32 {

# Copies over the examples folder into the build directory
# Copydata.commands = $(COPY_DIR) $$shell_quote($$shell_path($$PWD/Examples)) $$shell_quote($$shell_path($$PATH_TO_EXAMPLES))
# first.depends = $(first) Copydata

# Copies the dll files into the build directory
# CopyDLLs.commands = $(COPY_DIR) $$shell_quote($$shell_path($$PWD/winDLLS)) $$shell_quote($$shell_path($$DESTDIR))
# first.depends += CopyDLLs

# CopyDbs.commands = $(COPY_DIR) $$shell_quote($$shell_path($$PWD/Databases)) $$shell_quote($$shell_path($$PATH_TO_DATABASES))
# first.depends += CopyDbs

# export(first.depends)
# export(CopyDbs.commands)
# export(CopyDLLs.commands)

# QMAKE_EXTRA_TARGETS += first Copydata CopyDbs CopyDLLs

}else {
mac {

# Copies the examples folder into the build directory
#Copydata.commands = $(COPY_DIR) $$shell_quote($$shell_path($$PWD/Examples)) $$shell_quote($$shell_path($$PATH_TO_EXAMPLES))

# Copies the databases folder into the build directory
# CopyDbs.commands = $(COPY_DIR) $$shell_quote($$shell_path($$PWD/Databases)) $$shell_quote($$shell_path($$PATH_TO_DATABASES))

# first.depends += Copydata CopyDbs

# export(first.depends)
# export(Copydata.commands)
# export(CopyDbs.commands)

# QMAKE_EXTRA_TARGETS += first Copydata CopyDbs

}
}

