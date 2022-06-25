mkdir build
cd build

cmake ^
    -G "Ninja" ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DBUILD_SHARED_LIBS:BOOL=ON ^
    -DBUILD_TESTING:BOOL=ON ^
    -DOGRE_BUILD_TESTS=ON ^
    -DOGRE_BUILD_DOCS:BOOL=ON ^
    -DOGRE_BUILD_COMPONENT_HLMS:BOOL=ON ^
    -DOGRE_BUILD_COMPONENT_HLMS_PBS:BOOL=ON ^
    -DOGRE_BUILD_COMPONENT_HLMS_UNLIT:BOOL=ON ^
    -DOGRE_BUILD_COMPONENT_OVERLAY:BOOL=ON ^
    -DOGRE_BUILD_COMPONENT_PLANAR_REFLECTION:BOOLS=ON ^
    -DOGRE_BUILD_RENDERSYSTEM_D3D11:BOOL=ON ^
    -DOGRE_BUILD_RENDERSYSTEM_GL:BOOL=ON ^
    -DOGRE_BUILD_RENDERSYSTEM_GL3PLUS:BOOL=ON ^
    -DOGRE_BUILD_RENDERSYSTEM_GLES:BOOL=OFF ^
    -DOGRE_BUILD_RENDERSYSTEM_GLES2:BOOL=OFF ^
    -DOGRE_BUILD_SAMPLES:BOOL=OFF ^
    -DOGRE_BUILD_SAMPLES2:BOOL=OFF ^
    -DOGRE_BUILD_TOOLS:BOOL=OFF ^
    -DOGRE_CONFIG_UNIX_NO_X11:BOOL=OFF ^
    -DOGRE_CONFIG_THREADS=0 ^
    -DOGRE_CONFIG_THREAD_PROVIDER=std ^
    -DOGRE_INSTALL_SAMPLES:BOOL=OFF ^
    -DOGRE_INSTALL_SAMPLES_SOURCE:BOOL=OFF ^
    -DOGRE_INSTALL_TOOLS:BOOL=OFF ^
    -DOGRE_GLSUPPORT_USE_EGL_HEADLESS:BOOL=ON ^
    -DOGRE_USE_NEW_PROJECT_NAME:BOOL=ON ^
    -DOGRE_USE_SIMD:BOOL=OFF ^
    %SRC_DIR%
if errorlevel 1 exit 1

:: Build.
cmake --build . --config Release
if errorlevel 1 exit 1

:: Install.
cmake --build . --config Release --target install
if errorlevel 1 exit 1

:: Test.
ctest --output-on-failure -C Release 
if errorlevel 1 exit 1
