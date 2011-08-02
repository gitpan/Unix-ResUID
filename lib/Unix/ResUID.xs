#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

MODULE = Unix::ResUID				PACKAGE = Unix::ResUID

PROTOTYPES: DISABLED

int
getresuid()
	INIT:
		uid_t ruid, euid, suid;
		int ret;
	PPCODE:
		ret = getresuid(&ruid, &euid, &suid);
		if (ret == -1)
			XSRETURN_EMPTY;
		mXPUSHi(ruid);
		mXPUSHi(euid);
		mXPUSHi(suid);

int
setresuid(ruid, euid, suid)
	int ruid;
	int euid;
	int suid;
	INIT:
		int ret;
	PPCODE:
		ret = setresuid(ruid, euid, suid);
		if (ret == -1)
			XSRETURN_EMPTY;
		XSRETURN_IV(ret);

int
getresgid()
	INIT:
		gid_t rgid, egid, sgid;
		int ret;
	PPCODE:
		ret = getresgid(&rgid, &egid, &sgid);
		if (ret == -1)
			XSRETURN_EMPTY;
		mXPUSHi(rgid);
		mXPUSHi(egid);
		mXPUSHi(sgid);

int
setresgid(rgid, egid, sgid)
	int rgid;
	int egid;
	int sgid;
	INIT:
		int ret;
	PPCODE:
		ret = setresgid(rgid, egid, sgid);
		if (ret == -1)
			XSRETURN_EMPTY;
		XSRETURN_IV(ret);

