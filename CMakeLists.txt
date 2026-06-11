cmake_minimum_required(VERSION 3.16)
project(Fitness VERSION 0.1 LANGUAGES CXX)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)
qt_standard_project_setup(REQUIRES 6.10)

qt_add_executable(appFitness
    main.cpp
)

qt_add_qml_module(appFitness
    URI Fitness
    QML_FILES
        Main.qml
        MenuPage.qml
        MenuButton.qml
    RESOURCES

    RESOURCES assets/cycling.png assets/menu.png  assets/play-button.png assets/swimming.png
        RESOURCES assets/menu.png assets/pause.png assets/play-button.png assets/swimming.png
        RESOURCES assets/run.png
        QML_FILES DisplayPage.qml
        SOURCES textdisplay.h textdisplay.cpp
        RESOURCES assets/stop-button.png
)

set_target_properties(appFitness PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appFitness
    PRIVATE Qt6::Quick
)

install(TARGETS appFitness
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)