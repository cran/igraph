/* -*- mode: C -*-  */
/* 
   IGraph library.
   Copyright (C) 2010-2012  Gabor Csardi <csardi.gabor@gmail.com>
   334 Harvard street, Cambridge, MA 02139 USA
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA 
   02110-1301 USA

*/

#ifndef IGRAPH_VERSION_H
#define IGRAPH_VERSION_H

#include "igraph_decls.h"

__BEGIN_DECLS

#define IGRAPH_VERSION "1.2.6"
#define IGRAPH_VERSION_MAJOR @PACKAGE_VERSION_MAJOR@
#define IGRAPH_VERSION_MINOR @PACKAGE_VERSION_MINOR@
#define IGRAPH_VERSION_PATCH @PACKAGE_VERSION_PATCH@
#define IGRAPH_VERSION_PRERELEASE "@PACKAGE_VERSION_PRERELEASE@"

int igraph_version(const char **version_string,
		   int *major,
		   int *minor,
		   int *subminor);

__END_DECLS

#endif


