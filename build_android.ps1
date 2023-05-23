$ANDROID_NDK="C:/Users/lingy/AppData/Local/Android/Sdk/ndk/21.4.7075529" 
# $Env:ANDROID_HOME=C:/Users/lingy/AppData/Local/Android/Sdk
# $Env:ANDROID_SDK_ROOT=C:/Users/lingy/AppData/Local/Android/Sdk
$BuildDir = "./out/build_android_arm64"
if (Test-Path $BuildDir) {
  Remove-Item -Path $BuildDir  -Force -Recurse
}

mkdir $BuildDir 
cd $BuildDir
# cmake
cmake -G "Ninja" `
	-DCMAKE_TOOLCHAIN_FILE="$ANDROID_NDK/build/cmake/android.toolchain.cmake" `
	-DCMAKE_ANDROID_NDK="$ANDROID_NDK" `
	-DANDROID_NDK="$ANDROID_NDK" `
	-DANDROID_PLATFORM=android-28 `
	-DANDROID_ABI=arm64-v8a `
	-DCMAKE_CXX_COMPILER="$ANDROID_NDK/toolchains/llvm/prebuilt/windows-x86_64/bin/aarch64-linux-android28-clang++" `
	-DCMAKE_C_COMPILER="$ANDROID_NDK/toolchains/llvm/prebuilt/windows-x86_64/bin/aarch64-linux-android28-clang" `
	-DCMAKE_SYSTEM_NAME=Android `
	-DCMAKE_BUILD_TYPE=RelWithDebInfo `
	-DCMAKE_OSX_ARCHITECTURES=arm64 `
	-DCPU_INSTRUCTION_SET=arm64 `
	../..
# build
ninja all
# back
cd ../..	
