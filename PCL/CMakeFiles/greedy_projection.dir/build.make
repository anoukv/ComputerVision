# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/2.8.12.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/2.8.12.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/local/Cellar/cmake/2.8.12.2/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/anoukvisser/dev/MATLAB/ComputerVision/PCL

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/anoukvisser/dev/MATLAB/ComputerVision/PCL

# Include any dependencies generated for this target.
include CMakeFiles/greedy_projection.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/greedy_projection.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/greedy_projection.dir/flags.make

CMakeFiles/greedy_projection.dir/greedy_projection.cpp.o: CMakeFiles/greedy_projection.dir/flags.make
CMakeFiles/greedy_projection.dir/greedy_projection.cpp.o: greedy_projection.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/anoukvisser/dev/MATLAB/ComputerVision/PCL/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/greedy_projection.dir/greedy_projection.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/greedy_projection.dir/greedy_projection.cpp.o -c /Users/anoukvisser/dev/MATLAB/ComputerVision/PCL/greedy_projection.cpp

CMakeFiles/greedy_projection.dir/greedy_projection.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/greedy_projection.dir/greedy_projection.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /Users/anoukvisser/dev/MATLAB/ComputerVision/PCL/greedy_projection.cpp > CMakeFiles/greedy_projection.dir/greedy_projection.cpp.i

CMakeFiles/greedy_projection.dir/greedy_projection.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/greedy_projection.dir/greedy_projection.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /Users/anoukvisser/dev/MATLAB/ComputerVision/PCL/greedy_projection.cpp -o CMakeFiles/greedy_projection.dir/greedy_projection.cpp.s

CMakeFiles/greedy_projection.dir/greedy_projection.cpp.o.requires:
.PHONY : CMakeFiles/greedy_projection.dir/greedy_projection.cpp.o.requires

CMakeFiles/greedy_projection.dir/greedy_projection.cpp.o.provides: CMakeFiles/greedy_projection.dir/greedy_projection.cpp.o.requires
	$(MAKE) -f CMakeFiles/greedy_projection.dir/build.make CMakeFiles/greedy_projection.dir/greedy_projection.cpp.o.provides.build
.PHONY : CMakeFiles/greedy_projection.dir/greedy_projection.cpp.o.provides

CMakeFiles/greedy_projection.dir/greedy_projection.cpp.o.provides.build: CMakeFiles/greedy_projection.dir/greedy_projection.cpp.o

# Object files for target greedy_projection
greedy_projection_OBJECTS = \
"CMakeFiles/greedy_projection.dir/greedy_projection.cpp.o"

# External object files for target greedy_projection
greedy_projection_EXTERNAL_OBJECTS =

greedy_projection: CMakeFiles/greedy_projection.dir/greedy_projection.cpp.o
greedy_projection: CMakeFiles/greedy_projection.dir/build.make
greedy_projection: /usr/local/lib/libboost_system-mt.dylib
greedy_projection: /usr/local/lib/libboost_filesystem-mt.dylib
greedy_projection: /usr/local/lib/libboost_thread-mt.dylib
greedy_projection: /usr/local/lib/libboost_date_time-mt.dylib
greedy_projection: /usr/local/lib/libboost_iostreams-mt.dylib
greedy_projection: /usr/local/lib/libpcl_common.dylib
greedy_projection: /usr/local/lib/libpcl_octree.dylib
greedy_projection: /usr/local/lib/libpcl_io.dylib
greedy_projection: /usr/local/Cellar/flann/1.8.4/lib/libflann_cpp_s.a
greedy_projection: /usr/local/lib/libpcl_kdtree.dylib
greedy_projection: /usr/local/lib/libpcl_search.dylib
greedy_projection: /usr/local/lib/libpcl_sample_consensus.dylib
greedy_projection: /usr/local/lib/libpcl_filters.dylib
greedy_projection: /usr/local/lib/libpcl_segmentation.dylib
greedy_projection: /usr/local/lib/libpcl_visualization.dylib
greedy_projection: /usr/local/lib/libpcl_features.dylib
greedy_projection: /usr/local/lib/libqhullstatic.a
greedy_projection: /usr/local/lib/libpcl_surface.dylib
greedy_projection: /usr/local/lib/libpcl_registration.dylib
greedy_projection: /usr/local/lib/libpcl_keypoints.dylib
greedy_projection: /usr/local/lib/libpcl_tracking.dylib
greedy_projection: /usr/local/lib/libpcl_apps.dylib
greedy_projection: CMakeFiles/greedy_projection.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable greedy_projection"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/greedy_projection.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/greedy_projection.dir/build: greedy_projection
.PHONY : CMakeFiles/greedy_projection.dir/build

CMakeFiles/greedy_projection.dir/requires: CMakeFiles/greedy_projection.dir/greedy_projection.cpp.o.requires
.PHONY : CMakeFiles/greedy_projection.dir/requires

CMakeFiles/greedy_projection.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/greedy_projection.dir/cmake_clean.cmake
.PHONY : CMakeFiles/greedy_projection.dir/clean

CMakeFiles/greedy_projection.dir/depend:
	cd /Users/anoukvisser/dev/MATLAB/ComputerVision/PCL && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/anoukvisser/dev/MATLAB/ComputerVision/PCL /Users/anoukvisser/dev/MATLAB/ComputerVision/PCL /Users/anoukvisser/dev/MATLAB/ComputerVision/PCL /Users/anoukvisser/dev/MATLAB/ComputerVision/PCL /Users/anoukvisser/dev/MATLAB/ComputerVision/PCL/CMakeFiles/greedy_projection.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/greedy_projection.dir/depend

