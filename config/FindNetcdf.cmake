# Locate Netcdf install directory

# This module defines
# NETCDF_INSTALL where to find include, lib, bin, etc.
# NETCDF_FOUND, is set to true

INCLUDE (${PROJ_SOURCE_DIR}/config/component_rules.cmake)

SET(NETCDF_INCLUDE_DIRS ${NETCDF_INSTALL}/include)
SET(NETCDF_LINK_DIRS ${NETCDF_INSTALL}/lib)
SET(NETCDF_LIBS "netcdf")

MESSAGE("Looking for netcdf in ${NETCDF_INSTALL}")

SET( NETCDF_FOUND NETCDF_FOUND-NOTFOUND )
FIND_FILE(NETCDF_FOUND netcdf.h ${NETCDF_INCLUDE_DIRS}/ )

IF ( NETCDF_FOUND )
  MESSAGE("  include dirs: ${NETCDF_INCLUDE_DIRS}")
  MESSAGE("  libs: ${NETCDF_LIBS}")
  MESSAGE("  link dirs: ${NETCDF_LINK_DIRS}")

  INCLUDE_DIRECTORIES( ${NETCDF_INCLUDE_DIRS} )
  LINK_DIRECTORIES( ${NETCDF_LINK_DIRS})

  OROCOS_PKGCONFIG_INCPATH("${NETCDF_INCLUDE_DIRS}")
  OROCOS_PKGCONFIG_LIBS("${NETCDF_LIBS}")
  OROCOS_PKGCONFIG_LIBPATH("${NETCDF_LINK_DIRS}")

ELSE (NETCDF_fOUND)

  MESSAGE( "  Can't find NETCDF" )

ENDIF( NETCDF_FOUND )

