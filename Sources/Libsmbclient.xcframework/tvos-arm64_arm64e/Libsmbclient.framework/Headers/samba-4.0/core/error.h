/* 
   Unix SMB/CIFS implementation.   
   Error handling code
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef _SAMBA_ERROR_H_
#define _SAMBA_ERROR_H_

#include <core/werror.h>
#include <core/doserr.h>
#include <core/ntstatus.h>
#include <core/hresult.h>

/*****************************************************************************
convert a NT status code to a dos class/code
 *****************************************************************************/
void ntstatus_to_dos(NTSTATUS ntstatus, uint8_t *eclass, uint32_t *ecode);

/*****************************************************************************
convert a WERROR to a NT status32 code
 *****************************************************************************/
NTSTATUS werror_to_ntstatus(WERROR error);

/*****************************************************************************
convert a NTSTATUS to a WERROR
 *****************************************************************************/
WERROR ntstatus_to_werror(NTSTATUS error);

/*********************************************************************
 Map an NT error code from a Unix error code.
*********************************************************************/
NTSTATUS map_nt_error_from_unix_common(int unix_error);

/*********************************************************************
 Map a Unix error code from a NT error code.
*********************************************************************/
int map_errno_from_nt_status(NTSTATUS status);

NTSTATUS nt_status_squash(NTSTATUS nt_status);

/*****************************************************************************
convert a Unix error to a WERROR
 *****************************************************************************/
WERROR unix_to_werror(int unix_error);

#endif /* _SAMBA_ERROR_H */
